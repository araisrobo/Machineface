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
        property double basewidth: (window.width - window.height * 0.1).toFixed((2))
        property double ledSize: (basewidth - ledspacing * 36 - textwidth.width) / 37
        property double fontSize: basewidth * 0.015
        property double ledspacing: basewidth * 0.005
        property double zoom_add: 1
        property double textspacing_h: 0//height * 0.0075


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
        Text{
            id: textwidth
            text: "00"
            font.pixelSize: fontSize
            visible: false
        }
        //***************************************************
        // BP-TICK
        //***************************************************
        Text {//bptick
            id: bptickValue
            text: "bp-tick : " + bptickPin.value + " "
            font.pixelSize: fontSize * zoom_add
            x: basewidth - bptickValue.width
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
