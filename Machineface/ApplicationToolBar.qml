import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import Machinekit.Controls 1.0
import Machinekit.Application.Controls 1.0

Rectangle {
    color: systemPalette.dark

    SystemPalette { id: systemPalette }
    Flickable{
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent
        contentHeight: parent.height * 2;
    ColumnLayout {
        id: toolBar
        anchors.fill: parent
        anchors.margins: Screen.pixelDensity / 2

        TouchButton {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            action : EstopPowerAction { }
            iconSource: ""
            FontIcon { // settings-power
                text: "\ue8c6"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            action : OpenAction { fileDialog: applicationFileDialog }
            iconSource: ""
            FontIcon { // folder-open
                text: "\ue2c8"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            action : OpenAction {
                fileDialog: applicationRemoteFileDialog
                shortcut: "Shift+O"
            }
            iconSource: ""
            FontIcon { // folder-open
                text: "\ue2c2"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            action : RunProgramAction { }
            iconSource: ""
            FontIcon { // play_arrow
                text: "\ue037"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            action : PauseResumeProgramAction { }
            iconSource: ""
            FontIcon { // pause
                text: "\ue034"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            action : StopProgramAction { }
            iconSource: ""
            FontIcon { // stop
                text: "\ue047"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            action : EditProgramAction { }
            iconSource: ""
            FontIcon { // mode_edit
                text: "\ue254"; color: systemPalette.light
            }
        }

        Item {
            Layout.fillHeight: true
        }

        TouchButton {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            onClicked: {
                if (displayPanel.hidePanel){
                    displayPanel.showDisplay()
                }else{
                    mainTab.currentIndex = 0
                    displayPanel.showOption_f()
                }
            }
            iconSource: ""
            FontIcon { // more_horiz
                text: "\ue5d3"; color: systemPalette.light
            }
        }

        ApplicationMenu {
            id: applicationMenu
        }

        AboutDialog {
            id: aboutDialog
        }
    }
}
}
