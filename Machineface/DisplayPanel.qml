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
    DigitalReadOut {
        id:digitalReadOut
        Layout.fillWidth: true
    }

    PressureControl {
        componentName: "aout_control"
        labelName: "Pressure Control"
        logHeight: parent.height * 0.25
        width: parent.width
    }

    Item {
        Layout.fillHeight: true
    }
    property bool hidePanel: false
    MouseArea{
    id: mouseArea
    x: 0
    y: 0
    width: parent.width * 0.25
    height: parent.height * 0.25
    anchors.rightMargin: 0
    anchors.bottomMargin: parent.height * 0.25
    anchors.leftMargin: parent.width * 0.5
    anchors.topMargin: 0
    anchors.fill: parent
    onDoubleClicked: hideDisplay()
    }
    function hideDisplay(){
        if (jogTab.visible) {
            hidePanel = true
//            digitalReadOut.implicitWidth =1
        }
    }
    function showDisplay(){
        hidePanel = false
    }

}
