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
    property double spinMinimumValue: minTemperaturePin.value
    property double spinMaximumValue: maxTemperaturePin.value
    property double gaugeMinimumValue: spinMinimumValue
    property double gaugeMaximumValue: spinMaximumValue * 1.1
    property double gaugeZ0BorderValue: 50.0
    property double gaugeZ1BorderValue: spinMaximumValue * 0.9
    property int logHeight: 200
    property bool wasConnected: false

//    visible: halRemoteComponent.connected || wasConnected
    visible: true
    HalRemoteComponent {
        id: halRemoteComponent
        halrcmdUri: halrcmdService.uri
        halrcompUri: halrcompService.uri
        ready: (halrcmdService.ready && halrcompService.ready) || connected
        name: "aout_control"
        containerItem: container
        create: false
        onErrorStringChanged: console.log(errorString)
        onConnectedChanged: tempItem.wasConnected = true
    }

    ColumnLayout {
        id: container
        enabled:  halRemoteComponent.connected
        Layout.fillWidth: true

        RowLayout {
            Label {
                id: tempSetLabel
                font.bold: true
                text: tempItem.labelName
            }

            Item {
                Layout.fillWidth: true
            }

            HalLed {
                name: "active"
                onColor: "orange"
                Layout.preferredHeight: tempSetLabel.height * 0.9
                Layout.preferredWidth: tempSetLabel.height * 0.9
                visible: false
            }

            HalLed {
                name: "press.in-range"
                onColor: "green"
                Layout.preferredHeight: tempSetLabel.height * 0.9
                Layout.preferredWidth: tempSetLabel.height * 0.9
                visible: false
            }

//            Led {
//                value: errorPin.value
//                onColor: "red"
//                Layout.preferredHeight: tempSetLabel.height * 0.9
//                Layout.preferredWidth: tempSetLabel.height * 0.9
//            }
        }

        HalPin {
            id: errorPin
            name: "error"
            direction: HalPin.In
            type: HalPin.Bit
        }

        HalPin {
            id: maxTemperaturePin
            name: "press.limit.max"
            direction: HalPin.In
            type: HalPin.Float
        }

        HalPin {
            id: minTemperaturePin
            name: "press.limit.min"
            direction: HalPin.In
            type: HalPin.Float
        }

        HalPin {
            id: standbyTemperaturePin
            name: "press.standby"
            direction: HalPin.In
            type: HalPin.Float
        }

        HalGauge {
            id: tempGauge
            Layout.fillWidth: true
            name: "press.meas"
            suffix: "V"
            decimals: 1
            minimumValueVisible: false
            maximumValueVisible: false
            minimumValue: tempItem.gaugeMinimumValue
            maximumValue: tempItem.gaugeMaximumValue
            z0BorderValue: tempItem.gaugeZ0BorderValue
            z1BorderValue: tempItem.gaugeZ1BorderValue
            z0Color: "green"
            z1Color: "yellow"
            z2Color: "red"

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: tempChart.visible = !tempChart.visible
                onClicked: control.visible = !control.visible
                cursorShape: "PointingHandCursor"
            }
        }

        LogChart {
            id: tempChart
            Layout.fillWidth: true
            Layout.preferredHeight: tempItem.logHeight
            visible: false
            value: tempGauge.value
            minimumValue: tempGauge.minimumValue
            maximumValue: tempGauge.maximumValue
            leftTextVisible: false
            rightTextVisible: false
            autoSampling: (tempGauge.halPin.synced) && visible
            updateInterval: 500
            timeSpan: 120000
        }

        RowLayout {
            Layout.fillWidth: true
            id: control
            visible: true

            HalSpinBox {
                Layout.fillWidth: true
                id: tempSetSpin
                enabled: errorPin.value === false
                name: "press.set"
                halPin.direction: HalPin.IO
                minimumValue: tempItem.spinMinimumValue
                maximumValue: tempItem.spinMaximumValue
                decimals: 1
                suffix: "V"

                onEditingFinished: {            // remove the focus from this control
                    parent.forceActiveFocus()
                    parent.focus = true
                }
            }

            Switch {
                id: onOffSwitch
                Layout.fillWidth: true
                enabled: errorPin.value === false
                onCheckedChanged: {
                    if (checked) {
                        if (tempSetSpin.value == 0) {
                            tempSetSpin.value = standbyTemperaturePin.value
                        }
                    }
                    else {
                        tempSetSpin.value = 0
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
                    value: tempSetSpin.value > 0.0
                }
            }
        }
    }
}

