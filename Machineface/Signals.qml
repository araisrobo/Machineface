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

        property int joints: 7
        property bool j0enable: joints > 0
        property bool j1enable: joints > 1
        property bool j2enable: joints > 2
        property bool j3enable: joints > 3
        property bool j4enable: joints > 4
        property bool j5enable: joints > 5
        property bool j6enable: joints > 6

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
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: (styleData.selected) ?
                                                                    Qt.darker("lightsteelblue", 1.05) :
                                                                    Qt.darker("#DDD", 0.85) }
                            GradientStop { position: 1 ; color: (styleData.selected) ?
                                                                    Qt.darker("lightsteelblue", 1.5) :
                                                                    Qt.darker("#DDD", 1.3) }
                        }
                        implicitWidth: Math.max(text.width + 4, 70)
                        implicitHeight: 60
                        radius: 10
                        Text {
                            id: text
                            anchors.centerIn: parent
                            text: styleData.title
                            color: styleData.selected ? "white" : "black"
                        }
                    }
                }
//                style: TabViewStyle {
//                       frameOverlap: 1
//                       tab: Rectangle {
//                           color: styleData.selected ? "steelblue" : systemPalette.window
//                           border.color:  "steelblue"
//                           implicitWidth: Math.max(text.width + 4, 70)
//                           implicitHeight: 60
//                           radius: 2
//                           Text {
//                               id: text
//                               anchors.centerIn: parent
//                               text: styleData.title
//                               color: styleData.selected ? "white" : "black"
//                           }
//                       }
//                       frame: Rectangle { color: "steelblue" }
//                   }
            }
            //***************************************************
            // BP-TICK
            //***************************************************
            Text {//bptick
                id: bptickValue
                text: "bp-tick : " + bptickPin.value + " "
                font.pixelSize: fontSize
                x: window.width - (bptickValue.width * 1.8)
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
