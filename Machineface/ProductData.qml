import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.0

Tab {
    title: qsTr("Product")
    property int status: XMLHttpRequest.UNSENT
    property bool isLoading: status === XMLHttpRequest.LOADING
    property bool wasLoading: false
    property int baseSize: Math.min(width, height)
    property int fontSize: baseSize * 0.05
    property string address: ''

    ColumnLayout {

        FocusScope {
            id: f1
            height: 60
            width: parent.width
            Rectangle {
                anchors.fill: parent
                color: "#999999"

                Rectangle { color: "#c1c1c1"; width: parent.width; height: 1 }
                Rectangle { color: "#707070"; width: parent.width; height: 1; anchors.bottom: parent.bottom }

                LineInput {
                    id: lineInputLotID
                    hint: "Lot ID"
                    prefix: "Lot ID: "
                    anchors { fill: parent; margins: 6 }
                    onAccepted: {
//                        lineInputLotName.forceActiveFocus()
//                        lineInputLotName.inputWidget.selectAll()
                        dbItem.search(lineInputLotID.text)
                        dbItem.visible = true
                    }
                }
            }
        }

        Item{
            id: dbItem
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false

            RowLayout{
                anchors.fill: parent
                Item{
                    Layout.fillWidth: true
                    anchors.top:parent.top
                    anchors.bottom: parent.bottom
                    ColumnLayout{
                        id: c1
                        Text{
                            id:lotNameLabel
                            font.bold: true
                            text: qsTr("Lot Name: ")
                            font.pixelSize: fontSize
                        }
                        Item{
                            Layout.preferredHeight: dbItem.width *0.01
                        }

                        Text{
                            font.bold: true
                            text: qsTr("Target: ")
                            font.pixelSize: fontSize
                        }
                        Item{
                            Layout.preferredHeight: dbItem.width *0.01
                        }

                        Text{
                            font.bold: true
                            text: "Finished: "
                            font.pixelSize: fontSize
                        }
                        Item{
                            Layout.preferredHeight: dbItem.width *0.01
                        }

                        Text{
                            text: qsTr("Cycle Time: ")
                            font.bold: true
                            font.pixelSize: fontSize
                        }

                    }
                }
                Item{
                    Layout.fillWidth: true
                    anchors.top:parent.top
                    anchors.bottom: parent.bottom
                    ColumnLayout{
                        Text{
                            id:lotNameText
                            font.bold: true
                            text: qsTr("TODO")
                            font.pixelSize: fontSize
                        }
                        Item{
                            Layout.preferredHeight: dbItem.width *0.01
                        }

                        Text{
                            id: targetText
                            font.bold: true
                            text: qsTr("TODO")
                            font.pixelSize: fontSize
                        }
                        Item{
                            Layout.preferredHeight: dbItem.width *0.01
                        }

                        Text{
                            id: finishedText
                            font.bold: true
                            text: qsTr("TODO")
                            font.pixelSize: fontSize
                        }
                        Item{
                            Layout.preferredHeight: dbItem.width *0.01
                        }

                        Text{
                            id: cycleTimeText
                            font.bold: true
                            text: qsTr("TODO")
                            font.pixelSize: fontSize
                        }
                    }
                }

            }
            function search(lotID){
                var req = new XMLHttpRequest;
                req.open("GET", "http://" + address+ "/qtSearchLot/" + parseInt(lotID));
                req.onreadystatechange = function() {
                    status = req.readyState;
                    if (status === XMLHttpRequest.DONE) {
                        var objectArray = JSON.parse(req.responseText);
                        if (objectArray.errors !== undefined)
                            console.log("Error fetching: " + objectArray.errors[0].message)
                        else {
                            for (var key in objectArray.lotTable) {
                                var jsonObject = objectArray.lotTable[key];
                                lotNameText.text = jsonObject.lot_name
                                targetText.text = jsonObject.target
                                finishedText.text = jsonObject.finished
                                cycleTimeText.text = jsonObject.cycle_time
                            }
                        }
                    }
                    wasLoading = (status === XMLHttpRequest.LOADING);
                }
                req.send();
            }
        }
        Item{
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: btn.width
            height: 60
            ColumnLayout{
              Button{
                  id: btn
                  text:"New lot"
                  onClicked: productPage.currentIndex = 1
              }
            }
        }
    }
}
