import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtWebEngine 1.0
import QtQuick.Controls.Styles 1.0

Tab {
    title: qsTr("Product")
    property int status: XMLHttpRequest.UNSENT
    property bool isLoading: status === XMLHttpRequest.LOADING
    property bool wasLoading: false
    property int baseSize: Math.min(width, height)
    property int fontSize: baseSize * 0.05

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
                        f2.visible = true
                        lineInputLotName.forceActiveFocus()
                        lineInputLotName.inputWidget.selectAll()
                    }
                }
            }
        }
        FocusScope {
            id: f2
            height: 60
            width: parent.width
            visible: false
            Rectangle {
                anchors.fill: parent
                color: "#999999"

                Rectangle { color: "#c1c1c1"; width: parent.width; height: 1 }
                Rectangle { color: "#707070"; width: parent.width; height: 1; anchors.bottom: parent.bottom }

                LineInput {
                    id: lineInputLotName
                    hint: "Lot Name"
                    prefix: "Lot Name: "
                    anchors { fill: parent; margins: 6 }
                    onAccepted: {
                        f3.visible = true
                        lineInputTarget.forceActiveFocus()
                        lineInputTarget.inputWidget.selectAll()
                    }
                }
            }
        }
        FocusScope {
            id: f3
            height: 60
            width: parent.width
            visible: false
            Rectangle {
                anchors.fill: parent
                color: "#999999"

                Rectangle { color: "#c1c1c1"; width: parent.width; height: 1 }
                Rectangle { color: "#707070"; width: parent.width; height: 1; anchors.bottom: parent.bottom }

                LineInput {
                    id: lineInputTarget
                    hint: "Target"
                    prefix: "Target: "
                    anchors { fill: parent; margins: 6 }
                    onAccepted: {
                        f4.visible = true
                        lineInputOpID.forceActiveFocus()
                        lineInputOpID.inputWidget.selectAll()
                    }
                }
            }
        }
        FocusScope {
            id:f4
            height: 60
            width: parent.width
            visible: false
            Rectangle {
                anchors.fill: parent
                color: "#999999"

                Rectangle { color: "#c1c1c1"; width: parent.width; height: 1 }
                Rectangle { color: "#707070"; width: parent.width; height: 1; anchors.bottom: parent.bottom }

                LineInput {
                    id: lineInputOpID
                    hint: "OP ID"
                    prefix: "OP ID: "
                    anchors { fill: parent; margins: 6 }
                    onAccepted: {
                        if (Qt.inputMethod.visible)
                            Qt.inputMethod.hide()
                        dbItem.search(lineInputLotID.text, lineInputLotName.text, lineInputTarget.text, lineInputOpID.text)
                        dbItem.visible = true
                        lineInputLotID.forceActiveFocus()
                        lineInputLotID.inputWidget.selectAll()
                        f2.visible = false
                        f3.visible = false
                        f4.visible = false
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
            function search(lotID, lotName, target, opID){
                var req = new XMLHttpRequest;
                console.log(opID)
                req.open("GET", "http://10.1.1.150:8080/qtlot/" + parseInt(opID) +"/"+ parseInt(lotID) +"/"+ lotName +"/"+ parseInt(target));
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
    }
}
