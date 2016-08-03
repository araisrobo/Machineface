import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Application.Controls 1.0

Tab {
    title: qsTr("Set")
    property int status: XMLHttpRequest.UNSENT
    property bool isLoading: status === XMLHttpRequest.LOADING
    property bool wasLoading: false
    property string address: ''
    ColumnLayout{
        Item{
            height: 60
            width: parent.width

            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0 ; color: Qt.darker("lightgreen", 0.75)}
                    GradientStop { position: 1 ; color: Qt.darker("lightsteelblue", 1.5)}
                }
                Label{
                    id:changePageUser
                    anchors.centerIn: parent
                    text:qsTr("User")
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: setttingsPage.currentIndex = 0
                    cursorShape: "PointingHandCursor"
                }
            }
        }
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            ScrollView {
                id: scrollView
                anchors.fill: parent
                anchors.margins: Screen.pixelDensity
                horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
                contentItem:

                    ColumnLayout {
                    id: column1
                    width: scrollView.width
                    spacing: Screen.pixelDensity

                    //            VelocityExtrusionControl {
                    //                Layout.fillWidth: false
                    //                id: velocityExtrusionControl
                    //            }

                    //            GantryConfigControl {
                    //                Layout.fillWidth: false
                    //                id: gantryConfigControl
                    //            }

                    Label {
                        text: qsTr("Digital Read Out")
                        font.bold: true
                    }

                    ToggleSettingCheck {
                        groupName: "dro"
                        valueName: "showOffsets"
                        text: qsTr("Show offsets")
                    }

                    ToggleSettingCheck {
                        id: showVelocityAction
                        groupName: "dro"
                        valueName: "showVelocity"
                        text: qsTr("Show velocity")
                    }

                    ToggleSettingCheck {
                        id: showDistanceToGoAction
                        groupName: "dro"
                        valueName: "showDistanceToGo"
                        text: qsTr("Show distance to go")
                    }

                    Label {
                        text: qsTr("Other")
                        font.bold: true
                    }

                    // temporarily disable preview until it is working in a better way
                    ToggleSettingCheck {
                        id: enablePreviewAction
                        groupName: "preview"
                        valueName: "enable"
                        text: qsTr("Enable preview")
                        visible: checked  // in case preview was accidentally enabled show this check box
                    }

                    CheckBox {
                        id: teleopCheck
                        checked: teleopAction.checked
                        text: teleopAction.text
                        onClicked: teleopAction.trigger()

                        TeleopAction {
                            id: teleopAction
                        }
                    }

                    FocusScope {
                        id: oil_period
                        height: 60
                        width: parent.width
                        Rectangle {
                            anchors.fill: parent
                            color: "#999999"

                            Rectangle { color: "#c1c1c1"; width: parent.width; height: 1 }
                            Rectangle { color: "#707070"; width: parent.width; height: 1; anchors.bottom: parent.bottom }

                            LineInput {
                                id: lineInputOilPeriod
                                hint: "Oil Period"
                                prefix: "Oil Period: "
                                inputMethodHint: Qt.ImhFormattedNumbersOnly
                                anchors { fill: parent; margins: 6 }
                                onAccepted: {
                                    column1.set("qtSetOilPeriod", lineInputOilPeriod.text)
                                }
                            }
                        }
                    }
                    FocusScope {
                        id: oil_time
                        height: 60
                        width: parent.width
                        Rectangle {
                            anchors.fill: parent
                            color: "#999999"

                            Rectangle { color: "#c1c1c1"; width: parent.width; height: 1 }
                            Rectangle { color: "#707070"; width: parent.width; height: 1; anchors.bottom: parent.bottom }

                            LineInput {
                                id: lineInputOilTime
                                hint: "Oil time"
                                prefix: "Oil time: "
                                inputMethodHint: Qt.ImhFormattedNumbersOnly
                                anchors { fill: parent; margins: 6 }
                                onAccepted: {
                                    column1.set("qtSetOilTime", lineInputOilTime.text)
                                }
                            }
                        }
                    }
                    function set(search, value){
                        var req = new XMLHttpRequest;
                        req.open("GET", "http://" + address +"/" + search + "/" + value);
                        req.onreadystatechange = function() {
                            status = req.readyState;
                            if (status === XMLHttpRequest.DONE) {

                            }
                            wasLoading = (status === XMLHttpRequest.LOADING);
                        }
                        req.send();
                    }

                    function search(){
                        var req = new XMLHttpRequest;
                        req.open("GET", "http://" + address +"/qtOilRequest/");
                        req.onreadystatechange = function() {
                            status = req.readyState;
                            if (status === XMLHttpRequest.DONE) {
                                var objectArray = JSON.parse(req.responseText);
                                if (objectArray.errors !== undefined)
                                    console.log("Error fetching: " + objectArray.errors[0].message)
                                else {
                                    lineInputOilPeriod.text = objectArray.oil_period
                                    lineInputOilTime.text = objectArray.oil_time
                                }
                            }
                            wasLoading = (status === XMLHttpRequest.LOADING);
                        }
                        req.send();
                    }
                    Component.onCompleted: {
                        search()
                    }
                    /* ToggleSettingCheck {
                id: showMachineLimitsAction
                groupName: "preview"
                valueName: "showMachineLimits"
                text: qsTr("Show machine limits")
            }

            ToggleSettingCheck {
                id: showProgramAction
                groupName: "preview"
                valueName: "showProgram"
                text: qsTr("Show program")
            }

            ToggleSettingCheck {
                id: showProgramExtentsAction
                groupName: "preview"
                valueName: "showProgramExtents"
                text: qsTr("Show program extents")
            }

            ToggleSettingCheck {
                id: showProgramRapidsAction
                groupName: "preview"
                valueName: "showProgramRapids"
                text: qsTr("Show program rapids")
            }

            ToggleSettingCheck {
                id: alphaBlendProgramAction
                groupName: "preview"
                valueName: "alphaBlendProgram"
                text: qsTr("Alpha-blend program")
            }

            ToggleSettingCheck {
                id: showLivePlotAction
                groupName: "preview"
                valueName: "showLivePlot"
                text: qsTr("Show live plot")
            }

            ToggleSettingCheck {
                id: showToolAction
                groupName: "preview"
                valueName: "showTool"
                text: qsTr("Show tool")
            }

            ToggleSettingCheck {
                id: showCoordinateAction
                groupName: "preview"
                valueName: "showCoordinate"
                text: qsTr("Show coordinate")
            }*/
                }
            }
        }
    }
}
