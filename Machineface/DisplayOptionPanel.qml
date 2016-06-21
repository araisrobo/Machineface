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

    Button {
        text: qsTr("&Disconnect")
        iconName: "network-disconnect"
        onClicked: {
            window.disconnect()
        }
    }

    Button {
        text: qsTr("&AboutMachineface")
        iconName: "help-about"
        onClicked: {
           aboutDialog.open()
        }
    }

    Button {
        text: qsTr("Sh&utdown")
        action: ShutdownAction {}
        onClicked: {
            window.disconnect()
        }
    }

    Button {
        text: qsTr("E&xit")
        iconName: "application-exit"
        onClicked: {
            Qt.quit()
        }
    }
    Button {
        text: qsTr("S&howPosition")
//        iconName: "application-exit"
        onClicked: {
            displayPanel.showDisplay()
        }
    }
    AboutDialog {
        id: aboutDialog
    }
}
