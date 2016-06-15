import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0
import QtQml 2.2
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0


Tab {// signaltab
    id: signaltab
    title: qsTr("Signals")
    active: true
    ApplicationItem {
        property bool eWasConnected: false
        property bool eEnabled: halRemoteComponent.connected
        property int baseSize: Math.min(width, height)
        property int fontSize: baseSize * 0.04

        id: signals

        HalRemoteComponent {
            id: halRemoteComponent
            halrcmdUri: halrcmdService.uri
            halrcompUri: halrcompService.uri
            ready: (halrcmdService.ready && halrcompService.ready) || connected
            name: "signals"
            containerItem: signalItems
            create: false
            onErrorStringChanged: console.log(errorString)
            onConnectedChanged: signals.eWasConnected = true
        }


        Item {
            id: signalItems
            enabled: eEnabled

            TabView {
                frameVisible: false
                Signals_GPIO{}
                Signals_Analog{}
                Signals_Debug{}
                style: TabViewStyle {
                       frameOverlap: 1
                       tab: Rectangle {
                           color: styleData.selected ? "steelblue" : systemPalette.window
                           border.color:  "steelblue"
                           implicitWidth: Math.max(text.width + 4, 70)
                           implicitHeight: 40
                           radius: 2
                           Text {
                               id: text
                               anchors.centerIn: parent
                               text: styleData.title
                               color: styleData.selected ? "white" : "black"
                           }
                       }
                       frame: Rectangle { color: "steelblue" }
                   }
            }
            //***************************************************
            // BP-TICK
            //***************************************************
            Text {//bptick
                id: bptickValue
                text: "bp-tick : " + bptickPin.value + " "
                font.pixelSize: fontSize
                x: window.width - (bptickValue.width * 1.4)
                HalPin {
                    id: bptickPin
                    name: "bptick"
                    direction: HalPin.In
                    type: HalPin.U32
                }
            }
        }
    }
}// Tab {// signaltab
