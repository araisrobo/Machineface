import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Machinekit.Controls 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.HalRemote 1.0
import Machinekit.Application 1.0
import QtQuick.Window 2.0

Tab {
    id: signaltab
    anchors.top:parent.top
    title: qsTr("Signals")
    active: true

    HalApplicationWindow {
        id: main
        title: "My HAL application"
        name: "signals"
        anchors.right: parent.right
        property int baseSize: Math.min(width, height)
        property int ledSize: width * 0.032
        property int fontSize: baseSize * 0.03
        property int ledspacing: ledSize * 0.2

        TabView {
            id: mainTab
            frameVisible: false
            anchors.left: toolBar.right
            anchors.right: displayPanel.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: Screen.pixelDensity
            anchors.leftMargin: Screen.pixelDensity / 2

            Signals_GPIO{}
            Signals_Analog{}
            Signals_Debug{}
        }

        //***************************************************
        // BP-TICK
        //***************************************************
        Text {//bptick
            id: bptickValue
            text: "bp-tick : " + bptickPin.value
            font.pixelSize: fontSize
            x: (applicationProgressBar.x + applicationProgressBar.width) - bptickValue.width * 1.5
            y: bptickValue.height * 0.5
            horizontalAlignment: Text.AlignRight
            HalPin {
                id: bptickPin
                name: "bptick"
                direction: HalPin.In
                type: HalPin.U32
            }
        }
    }
}
