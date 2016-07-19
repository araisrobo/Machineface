import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Window 2.0
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.Controls 1.0
import Machinekit.Service 1.0

ColumnLayout {
    id: tempItem
    property string componentName: "fdm-e0"
    property string labelName: "E0"
    property double gaugeZ0BorderValue: 50.0
    property int logHeight: 200
    property bool wasConnected: false

    visible: halRemoteComponent.connected || wasConnected

    HalRemoteComponent {
        id: halRemoteComponent
        halrcmdUri: halrcmdService.uri
        halrcompUri: halrcompService.uri
        ready: (halrcmdService.ready && halrcompService.ready) || connected
        name: tempItem.componentName
        containerItem: container
        create: false
        onErrorStringChanged: console.log(errorString)
        onConnectedChanged: tempItem.wasConnected = true
    }

    ColumnLayout {
        id: container
        enabled:  halRemoteComponent.connected
        Layout.fillWidth: false
        Layout.preferredHeight: displayPanel.width *0.5


        HalPin {
            id: logEnable
            name: "log-en"
            direction: HalPin.Out
            type: HalPin.Bit
        }
        HalButton {
            id:logDelBtn
            Layout.alignment: Layout.Center
            name: "log-del"
            text: "Delete"
        }
        RowLayout {
            id: control
            visible: true
            Label {
                id: tempSetLabel
                font.bold: true
                text: tempItem.labelName
            }
            Item {
                Layout.preferredHeight: displayPanel.width *0.8
            }
            Switch {
                id: onOffSwitch
                enabled: true
                onCheckedChanged: {
                    if (checked) {
                        if (logEnable.value == 0) {
                            logEnable.value = 1
                        }
                    }
                    else {
                        logEnable.value = 0
                    }
                }

                function toggle() {
                    consold.log("toggle")
                    if (checked == true) {
                        checked = false
                    } else {
                        checked =true
                    }
                }
                MouseArea {
                    anchors.fill: onOffSwitch
                    onClicked: onOffSwitch.checked = !onOffSwitch.checked
                    cursorShape: "PointingHandCursor"
                }

                Binding {
                    target: onOffSwitch
                    property: "checked"
                    value: logDelBtn.value == 0
                }
            }
        }
    }
}

