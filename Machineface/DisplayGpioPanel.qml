import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.Controls 1.0
import Machinekit.Application.Controls 1.0

ColumnLayout {
    property int page: 1
    Item {
        Layout.fillHeight: true
    }
    function touchLogPage1(){
        page = 1
    }
    function touchLogPage2(){
        page = 2
    }

    Button {
        text: qsTr("&Reload")
        anchors.horizontalCenter: parent.horizontalCenter
//        iconName: "network-disconnect"
        onClicked: {
            if(page == 1){
                gpioAction.trigger()
            } else if (page == 2){
                alarmAction.trigger()
            }
        }
    }
    Item {
        Layout.preferredHeight: displayPanel.width *0.2
    }

    GpioData {
        componentName: "gpio_data"
        labelName: "Data"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Item {
        Layout.fillHeight: true
    }
    GPIOAction { id: gpioAction}
    AlarmAction { id: alarmAction}

}
