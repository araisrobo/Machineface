import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0
import QtQml 2.2
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0

ApplicationItem {
    property var numberModel: defaultHandler.incrementsModel //numberModelBase.concat(["inf"])
    property var numberModelReverse: defaultHandler.incrementsModelReverse
    property var axisColors: ["#F5A9A9", "#A9F5F2", "#81F781", "#D2B48C", "#D28ED0", "#CFCC67", "#CFCC67"]
    property color allColor: "#DDD"
    property color specialColor: "#BBBBBB"
    property var axisNames: ["X", "Y", "Z", "A", "B", "C", "U", "V", "W"] // should come from INI/config
    property string eName: "E"
    property string eUnits: "mm/s"
    property bool zVisible: status.synced ? status.config.axes > 2 : true
    property bool aVisible: status.synced ? status.config.axes > 3 : true
    property int buttonBaseHeight: container.height / (numberModel.length*2+1)

    property int baseSize: Math.min(width, height)
    property int fontSize: baseSize * 0.028

    id: root

    JogDistanceHandler {
        id: defaultHandler
        continuousText: "inf"
        core: root.core
        axis: -1
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Screen.pixelDensity
        visible: root.status.synced

        Item {
            id: container
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: Math.min(width / 1.6, parent.height)

            RowLayout {
                property int axes: status.synced ? status.config.axes : 1

                id: axisRowLayout
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.leftMargin: parent.height * 0.03
                width: parent.height * 0.20 * (axisRowLayout.axes + 1) // one for home icon
                spacing: parent.height * 0.03

                Repeater {
                    model: axisRowLayout.axes

                    Item {
                        property int axisIndex: index
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        JogDistanceHandler {
                            property int buttonBaseHeight: container.height / (incrementsModel.length*2+1)

                            id: axisHandler
                            continuousText: "inf"
                            core: root.core
                            axis: axisIndex
                        }

                        JogKeyHandler {
                            baseKey: "PgUp"
                            axis: axisIndex+2
                            axisHandler: axisHandler
                            direction: 1
                            enabled: axis == 2
                        }

                        JogKeyHandler {
                            baseKey: "PgDown"
                            axis: axisIndex+2
                            axisHandler: axisHandler
                            direction: -1
                            enabled: axis == 2
                        }

                        Button {
                            anchors.centerIn: parent
                            height: axisHandler.buttonBaseHeight * 0.95
                            width: height
                            text: axisNames[index]
                            style: CustomStyle { baseColor: root.axisColors[index]; radius: 1000; boldFont: true; fontSize: root.fontSize }
                            enabled: zZeroAction.enabled
                            tooltip: qsTr("Select axis action")

                            onClicked: {
                                displayOtherPanel.index = index
                                displayPanel.hideDisplay()
                            }
                            MdiCommandAction {
                                id: zZeroAction
                                enableHistory: false
                            }
                        }

                        ColumnLayout {
                            id: axisTopLayout
                            anchors.top: parent.top
                            anchors.left: parent.left
                            height: axisHandler.buttonBaseHeight * axisHandler.incrementsModelReverse.length
                            width: parent.width
                            spacing: 0
                            Repeater {
                                model: axisHandler.incrementsModelReverse
                                JogButton {
                                    property string modelText: axisHandler.incrementsModelReverse[index]
                                    Layout.preferredWidth: axisTopLayout.height / axisHandler.incrementsModelReverse.length * ((axisHandler.incrementsModelReverse.length - index - 1) * 0.2 + 1)
                                    Layout.fillHeight: true
                                    Layout.alignment: Qt.AlignHCenter
                                    text: modelText == "inf" ? "" : modelText
                                    axis: axisIndex
                                    distance: modelText === "inf" ? 0 : modelText
                                    direction: 1
                                    style: CustomStyle {
                                        baseColor: axisColors[axisIndex]
                                        darkness: (axisHandler.incrementsModelReverse.length-index-1)*0.06
                                        fontSize: root.fontSize
                                        fontIcon: modelText == "inf" ? "\ue316" : ""
                                        fontIconSize: root.fontSize * 2.5
                                    }
                                }
                            }
                        }

                        ColumnLayout {
                            id: axisBottomLayout
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: axisHandler.buttonBaseHeight * axisHandler.incrementsModel.length
                            width: parent.width
                            spacing: 0
                            Repeater {
                                model: axisHandler.incrementsModel
                                JogButton {
                                    property string modelText: axisHandler.incrementsModel[index]
                                    Layout.preferredWidth: axisBottomLayout.height / axisHandler.incrementsModel.length * (index*0.2+1)
                                    Layout.fillHeight: true
                                    Layout.alignment: Qt.AlignHCenter
                                    text: modelText == "inf" ? "" : "-" + modelText
                                    axis: axisIndex
                                    distance: modelText === "inf" ? 0 : modelText
                                    direction: -1
                                    style: CustomStyle {
                                        baseColor: axisColors[axisIndex]
                                        darkness: index*0.06
                                        fontSize: root.fontSize
                                        fontIcon: modelText == "inf" ? "\ue313" : ""
                                        fontIconSize: root.fontSize * 2.5
                                    }
                                }
                            }
                        }
                    }
                }

                HomeButton {
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    Layout.fillHeight: false
                    Layout.fillWidth: false
                    Layout.preferredHeight: parent.height * 0.2
                    Layout.preferredWidth: height
                    width: parent.width
                    height: width
                    axis: -1
                    axisName: "All"
                    color: "white"
                    fontSize: root.fontSize
                }

            }

            Item {
                property int axisIndex: status.synced ? status.config.axes : 0
                property double extruderVelocity: 5.0

                id: extruderControl
                anchors.left: axisRowLayout.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.leftMargin: parent.height * 0.03
                width: parent.height * 0.20

                HalPin {
                    id: jogVelocityPin
                    name: "velocity"
                    direction: HalPin.IO
                    type: HalPin.Float
                }

                HalPin {
                    id: jogDistancePin
                    name: "distance"
                    direction: HalPin.IO
                    type: HalPin.Float
                }

                HalPin {
                    id: jogDirectionPin
                    name: "direction"
                    direction: HalPin.IO
                    type: HalPin.Bit
                }

                HalPin {
                    id: jogTriggerPin
                    name: "trigger"
                    direction: HalPin.IO
                    type: HalPin.Bit
                }

                HalPin {
                    id: jogContinuousPin
                    name: "continuous"
                    direction: HalPin.IO
                    type: HalPin.Bit
                }

                HalPin {
                    id: jogDtgPin
                    name: "dtg"
                    direction: HalPin.In
                    type: HalPin.Float
                }

                HalPin {
                    id: jogMaxVelocityPin
                    name: "max-velocity"
                    direction: HalPin.In
                    type: HalPin.Float
                }
            }
        }

        RowLayout {
            spacing: Screen.pixelDensity
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.preferredHeight: root.baseSize * 0.152
            Layout.preferredWidth: height

            Repeater {
                model: status.synced ? status.config.axes : 0

                JogVelocityKnob {
                    Layout.fillHeight: true
                    Layout.preferredWidth: height
                    color: axisColors[index]
                    axis: index
                    axisName: axisNames[index]
                    font.pixelSize: root.fontSize
                }
            }

            JogKnob {
                id: feedrateKnob
                Layout.fillHeight: true
                Layout.preferredWidth: height
                minimumValue: feedrateHandler.minimumValue
                maximumValue: feedrateHandler.maximumValue
                defaultValue: 1.0
                enabled: feedrateHandler.enabled
                color: allColor
                axisName: "FO"
                font.pixelSize: root.fontSize
                stepSize: 0.05
                decimals: 2
                text: (value * 100).toFixed(0) + "%"

                FeedrateHandler {
                    id: feedrateHandler
                }

                Binding { target: feedrateKnob; property: "value"; value: feedrateHandler.value }
                Binding { target: feedrateHandler; property: "value"; value: feedrateKnob.value }
            }

            Item {
                Layout.fillWidth: false
            }
        }
    }
}
