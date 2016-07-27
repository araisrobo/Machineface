import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtWebEngine 1.0
import QtQuick.Controls.Styles 1.0

Tab {
    title: qsTr("Users")
    property int status: XMLHttpRequest.UNSENT
    property bool isLoading: status === XMLHttpRequest.LOADING
    property bool wasLoading: false
    property int baseSize: Math.min(width, height)
    property int fontSize: baseSize * 0.05
    property bool opbtnChecked: true
    property bool enbtnChecked: false
    property bool subtnChecked: false
    property int userID: 0
    id: changeUserTab
    ColumnLayout {
        id:cl
        property alias userText: userLabel.text
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout{
                height: parent.height - (60 * 2)
                width: parent.width

                Button{
                    id: opBtn
                    text: qsTr("Operator")
                    implicitWidth: parent.width / 3
                    implicitHeight: implicitWidth
                    anchors.left: parent.left
                    style: CustomStyle { baseColor: "#DDD"; radius: 1000; boldFont: true; fontSize: changeUserTab.fontSize }
                    checkable: true
                    checked: true
                    onCheckedChanged: {
                        if(opBtn.checked) {
                            enbtnChecked = enBtn.checked = false
                            subtnChecked = suBtn.checked = false
                            opbtnChecked = true
                        } else if (!(enBtn.checked || suBtn.checked)){
                            opbtnChecked = opBtn.checked = true
                            console.log("opbtnChecked:",opbtnChecked)
                        }
                    }
                }
                Button{
                    id: enBtn
                    text: qsTr("Engineer")
                    implicitWidth: parent.width / 3
                    implicitHeight: implicitWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    style: CustomStyle { baseColor: "#DDD"; radius: 1000; boldFont: true; fontSize: changeUserTab.fontSize }
                    checkable: true
                    onCheckedChanged: {
                        if(enBtn.checked) {
                            opbtnChecked = opBtn.checked = false
                            subtnChecked = suBtn.checked = false
                            enbtnChecked = true
                        } else if (!(opBtn.checked || suBtn.checked)){
                            enbtnChecked = enBtn.checked = true
                            console.log("enbtnChecked:",enbtnChecked)
                        }

                    }
                }
                Button{
                    id:suBtn
                    text: qsTr("SuperVisor")
                    implicitWidth: parent.width / 3
                    implicitHeight: implicitWidth
                    anchors.right : parent.right
                    style: CustomStyle { baseColor: "#DDD"; radius: 1000; boldFont: true; fontSize: changeUserTab.fontSize }
                    checkable: true
                    onCheckedChanged: {
                        if(suBtn.checked) {
                            opbtnChecked = opBtn.checked = false
                            enbtnChecked = enBtn.checked = false
                            subtnChecked = true
                        } else if (!(enBtn.checked || opBtn.checked)){
                            subtnChecked = suBtn.checked = true
                            console.log("subtnChecked:",subtnChecked)
                        }
                    }
                }
            }
        }
        Label{
            id:userLabel
            height: 60
            width: parent.width
            text: "Operator"
            font.pixelSize: fontSize
        }

        FocusScope {
            height: 60
            width: parent.width
            Rectangle {
                anchors.fill: parent
                color: "#999999"

                Rectangle { color: "#c1c1c1"; width: parent.width; height: 1 }
                Rectangle { color: "#707070"; width: parent.width; height: 1; anchors.bottom: parent.bottom }

                LineInput {
                    id: lineInputLotID
                    hint: "Pass Word"
                    echo: TextInput.Password
                    anchors { fill: parent; margins: 6 }
                    onAccepted: {
                        search(lineInputLotID.text)
                        lineInputLotID.text =''
                    }
                }
            }
        }

        function search(inputPwd){
            var req = new XMLHttpRequest;
            var userName;
            if (enbtnChecked) {
                userName = "Engineer"
            } else if (subtnChecked) {
                userName = "Supervisor"
            } else {
                userName = "Operator"
            }
            console.log("http://10.1.1.150:8080/pwd/" + userName)
            req.open("GET", "http://10.1.1.150:8080/pwd/" + userName);
            req.onreadystatechange = function() {
                status = req.readyState;
                if (status === XMLHttpRequest.DONE) {
                    var objectArray = JSON.parse(req.responseText);

                    console.log(objectArray.pwd)
                    if(inputPwd == objectArray.pwd && subtnChecked){
                        console.log("Pass: Supervisor")
                        cl.userText = "Supervisor"
                        userID = 2
                    } else if (inputPwd == objectArray.pwd && enbtnChecked){
                        console.log("Pass: Engineer")
                        cl.userText = "Engineer"
                        userID = 1
                    } else {
                        console.log("Fail: Change To Operator")
                        cl.userText = "Operator"
                        userID = 0
                    }
                }
                wasLoading = (status === XMLHttpRequest.LOADING);
            }
            req.send();
        }
    }
}
