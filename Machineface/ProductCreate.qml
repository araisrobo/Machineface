import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.0

Tab {
    title: qsTr("Insert Lot")
    property int status: XMLHttpRequest.UNSENT
    property bool isLoading: status === XMLHttpRequest.LOADING
    property bool wasLoading: false
    property int baseSize: Math.min(width, height)
    property int fontSize: baseSize * 0.05

    ColumnLayout {
        Layout.fillWidth: true

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
                        search(lineInputLotID.text, lineInputLotName.text, lineInputTarget.text, lineInputOpID.text)
                        lineInputLotID.forceActiveFocus()
                        lineInputLotID.inputWidget.selectAll()
                    }
                }
            }
        }

    function search(lotID, lotName, target, opID){
        var req = new XMLHttpRequest;
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
//                        lotNameText.text = jsonObject.lot_name
//                        targetText.text = jsonObject.target
//                        finishedText.text = jsonObject.finished
//                        cycleTimeText.text = jsonObject.cycle_time
                        productPage.currentIndex = 0
                    }
                }
            }
            wasLoading = (status === XMLHttpRequest.LOADING);
        }
        req.send();

    }

    Item{
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: btn.width
        height: 60
        ColumnLayout{
            Button{
                id: btn
                text:"Back"
                onClicked: productPage.currentIndex = 0
            }
        }
    }
}
}
