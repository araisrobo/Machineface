import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0

//Qt5.7: import QtQuick 2.6
//Qt5.7: import QtQuick.Layouts 1.3
//Qt5.7: import QtQuick.Controls 2.0
//Qt5.7: import QtQuick.Controls.Material 2.0
//Qt5.7: import QtQuick.Controls.Universal 2.0
//Qt5.7: import Qt.labs.settings 1.0

import Machinekit.Application 1.0

ColumnLayout {
    property alias core: object.core
    property alias status: object.status
    property alias command: object.command
    property alias helper: object.helper
    property int index: 0
    property var axisNames: helper.ready ? helper.axisNamesUpper : ["X", "Y", "Z", "A", "B", "C", "U", "V", "W"]
    property var _axisNames: helper.ready ? helper.axisNames : ["x", "y", "z", "a", "b", "c", "u", "v", "w"]
    property var axisColors: ["#F5A9A9", "#A9F5F2", "#81F781", "#D2B48C", "#D28ED0", "#CFCC67"]
    property bool _ready: status.synced && command.connected
    property bool _executing: false
    property int positionFeedback: _ready ? status.config.positionFeedback : ApplicationStatus.ActualPositionFeedback
    property var g5xOffset: _ready ? (status.motion.g5xOffset) : {"x":0.0, "y":0.0, "z":0.0, "a":0.0, "b":0.0, "c":0.0, "u":0.0, "v":0.0, "w":0.0}
    property var g92Offset: _ready ? (status.motion.g92Offset) : {"x":0.0, "y":0.0, "z":0.0, "a":0.0, "b":0.0, "c":0.0, "u":0.0, "v":0.0, "w":0.0}
    property var toolOffset: _ready ? (status.io.toolOffset) : {"x":0.0, "y":0.0, "z":0.0, "a":0.0, "b":0.0, "c":0.0, "u":0.0, "v":0.0, "w":0.0}

    spacing: 5

    Rectangle {
        anchors { // the column should have a real size so make it fill the parent horizontally
            left: parent.left;
            right: parent.right;
        }
        height: childrenRect.height
        color: axisColors[index]
        radius: 3
        Text {
            width: parent.width
            text: qsTr("AXIS: %1").arg(axisNames[index])
            font.pixelSize: 20
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
    }

    Grid {
        columns: 2
        spacing: 5
        anchors { // the column should have a real size so make it fill the parent horizontally
            left: parent.left;
            right: parent.right;
        }
        Rectangle {
            width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
            height: childrenRect.height
            color: axisColors[index]
            radius: 3
            Text {
                width: parent.width
                text: qsTr("Machine")
                font.pixelSize: 20
                horizontalAlignment: Qt.AlignRight
            }
        }
        Rectangle {
            width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
            height: childrenRect.height
            color: axisColors[index]
            radius: 3
            Text {
                width: parent.width
                text: machinePosition(index).toFixed(2)
                font.pixelSize: 20
                horizontalAlignment: Qt.AlignRight
            }
        }
        Rectangle {
            width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
            height: childrenRect.height
            color: axisColors[index]
            radius: 3
            Text {
                width: parent.width
                text: qsTr("Relative")
                font.pixelSize: 20
                horizontalAlignment: Qt.AlignRight
            }
        }
        Rectangle {
            width: (parent.width - (parent.columns - 1) * parent.spacing) / parent.columns
            height: childrenRect.height
            color: axisColors[index]
            radius: 3
            Text {
                width: parent.width
                text: relativePosition(index).toFixed(2)
                font.pixelSize: 20
                horizontalAlignment: Qt.AlignRight
            }
        }
    }

    Button {
        id: touchoffButton
        Layout.fillHeight: true
        width: parent.width
        anchors { left: parent.left; right: parent.right; }
        style: CustomStyle { baseColor: axisColors[index]; radius: 5; fontSize: 20}
        text: qsTr("Touch Off")
        onClicked: {
            if (_ready && !_executing) {
                _executing = true
                if (status.task.taskMode !== ApplicationStatus.TaskModeMdi) {
                    command.setTaskMode('execute', ApplicationCommand.TaskModeMdi)
                }
                var axisName = _axisNames[index]
                var position = status.motion.position[axisName] - status.motion.g92Offset[axisName] - status.io.toolOffset[axisName]
                // TODO: add coordinateSpin:  var newOffset = (position - coordinateSpin.value)
                // TODO: add coordinateIndex: var mdi = "G10 L2 P" + (coordinateSystemCombo.currentIndex + 1) + " " + axisNames[axis] + newOffset.toFixed(6)
                var newOffset = (position)
                // P0: set Active coordinate system
                var mdi = "G10 L2 P0 " + axisNames[index] + newOffset.toFixed(6)
                command.executeMdi('execute', mdi)
            }
            _executing = false
        }
    }

    Button {
        id: axisMoveButton
        Layout.fillHeight: true
        anchors { left: parent.left; right: parent.right; }
        style: CustomStyle { baseColor: axisColors[index]; radius: 5; fontSize: 20}
        text: qsTr("Move to 0")
        onClicked: {
            if (_ready && !_executing) {
                _executing = true
                if (status.task.taskMode !== ApplicationStatus.TaskModeMdi) {
                    command.setTaskMode('execute', ApplicationCommand.TaskModeMdi)
                }
                var axisName = _axisNames[index]
                var mdi = "G0 " + axisNames[index] + "0.01"
                command.executeMdi('execute', mdi)
                var mdi = "G0 " + axisNames[index] + "0"
                command.executeMdi('execute', mdi)
            }
            _executing = false
        }
    }

    HomeButton {
        id: homeXButton
        Layout.fillHeight: true
        anchors { left: parent.left; right: parent.right; }
        axis: index
        axisName: axisNames[index]
        color: axisColors[index]
        fontSize: fontSize
    }

    Button {
        id: showPanelButton
        Layout.fillHeight: true
        text: qsTr("BACK")
        anchors { left: parent.left; right: parent.right; }
        style: CustomStyle { baseColor: "white"; radius: 5; fontSize: 20}
        onClicked: {
            displayPanel.showDisplay()
        }
    }

    function relativePosition(axis) {
        var basePosition
        var axisName = _axisNames[axis]
        if (_ready) {
            basePosition = (positionFeedback == ApplicationStatus.ActualPositionFeedback) ? status.motion.actualPosition[axisName] : status.motion.position[axisName]
        } else {
            basePosition = 0.0
        }
        basePosition -= g5xOffset[axisName] + g92Offset[axisName] + toolOffset[axisName]
        return basePosition
    }

    function machinePosition(axis) {
        var basePosition
        var axisName = _axisNames[axis]
        if (_ready) {
            basePosition = (positionFeedback == ApplicationStatus.ActualPositionFeedback) ? status.motion.actualPosition[axisName] : status.motion.position[axisName]
        } else {
            basePosition = 0.0
        }
        return basePosition
    }

    ApplicationObject {
        id: object
    }
}
