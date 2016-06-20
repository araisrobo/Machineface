import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.Controls 1.0
import Machinekit.Application.Controls 1.0

ColumnLayout {
    property int index: 0
    property var axisNames: ["X", "Y", "Z", "A", "B", "C", "U", "V", "W"] // should come from INI/config
    property var axisColors: ["#F5A9A9", "#A9F5F2", "#81F781", "#D2B48C", "#D28ED0", "#CFCC67"]
    spacing: 5

    Label{
        id: panelLabel
        text:"Panel: " + axisNames[index] + " axis"
    }

    Button {
        id: touchoffButton
        Layout.fillHeight: true
        anchors.top: panelLabel.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.width * 0.05
        text: qsTr("Touch off ") + axisNames[index] + qsTr(" axis")
        style: CustomStyle { baseColor: axisColors[index]; radius: 1000; boldFont: true; fontSize: fontSize }
        onClicked: {
            zZeroAction.mdiCommand = "G10 L20 P0 " + axisNames[index] + "0"
            zZeroAction.trigger()
        }
    }

    Button {
        id: rigidMoveButton
        Layout.fillHeight: true
        anchors.top: touchoffButton.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.width * 0.05
        text: qsTr("Move ") + axisNames[index] + qsTr(" axis to 0")
        style: CustomStyle { baseColor: axisColors[index]; radius: 1000; boldFont: true; fontSize: fontSize }
        onClicked: {
            zZeroAction.mdiCommand = "G0 " + axisNames[index] + "0"
            zZeroAction.trigger()
        }
    }
    HomeButton {
        id: homeXButton
        Layout.fillHeight: true
        anchors.top: rigidMoveButton.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.width * 0.05
        width: parent.height * 0.1
        height: width
        axis: index
        axisName: axisNames[index]
        color: axisColors[index]
        fontSize: fontSize
    }
    Button {
        id: showPanelButton
        Layout.fillHeight: true
        anchors.top: homeXButton.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.width * 0.05
        text: qsTr("Show Position ")
        style: CustomStyle { baseColor: "white"; radius: 0; boldFont: true; fontSize: fontSize }
        onClicked: {
            displayPanel.showDisplay()
        }
    }
}
