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
    DigitalReadOut {
        id:digitalReadOut
        decimals:2
    }

    Item {
        Layout.fillHeight: true
    }
    property bool hidePanel: false
    property bool showOption: false

    function hideDisplay(){
        if (jogTab.visible) {
            hidePanel = true
            showOption = false
        }
    }

    function showOption_f(){
        if (!signalTab.visible) {
            hidePanel = true
            showOption = true
        }
    }

    function showDisplay(){
        hidePanel = false
        showOption = false
    }

}
