/****************************************************************************
**
** Copyright (C) 2014 Alexander Rössler
** License: LGPL version 2.1
**
** This file is part of QtQuickVcp.
**
** All rights reserved. This program and the accompanying materials
** are made available under the terms of the GNU Lesser General Public License
** (LGPL) version 2.1 which accompanies this distribution, and is available at
** http://www.gnu.org/licenses/lgpl-2.1.html
**
** This library is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
** Lesser General Public License for more details.
**
** Contributors:
** Alexander Rössler @ The Cool Tool GmbH <mail DOT aroessler AT gmail DOT com>
**
****************************************************************************/
import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Controls 1.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.Service 1.0

import QtQuick.Controls.Styles 1.2

ServiceWindow {
    id: window
    visible: true
    width: 800
    height: 600
    title: applicationCore.applicationName + (d.machineName == "" ? "" :" - " +  d.machineName)

    Item {
        id: d
        property string machineName: applicationCore.status.config.name
    }

    FontLoader {
        id: iconFont
        source: "icons/MaterialIcons-Regular.ttf"
    }

    Service {
        id: halrcompService
        type: "halrcomp"
    }

    Service {
        id: halrcmdService
        type: "halrcmd"
    }

    ApplicationCore {
        id: applicationCore
        notifications: applicationNotifications
        applicationName: "Machineface"
    }

    PathViewCore {
        id: pathViewCore
    }

    ApplicationToolBar {
        id: toolBar
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: window.height * 0.1
    }

    ApplicationRemoteFileDialog {
        id: applicationFileDialog
        width: window.width
        height: window.height
        fileDialog: fileDialog
    }

    ApplicationFileDialog {
        id: fileDialog
    }

    TabView {
        id: mainTab
        frameVisible: false
        anchors.left: toolBar.right
        anchors.right: displayPanel.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: Screen.pixelDensity
        anchors.leftMargin: Screen.pixelDensity / 2

        JogControlTab {
            id:jogTab
        }
        MdiTab { }
        GCodeTab { }
        /*PreviewTab { }*/
//        VideoTab { }
//        SettingsTab { }
//        ExtrasTab { }
//        ANDDemo { }
        Signals{
            id:signalTab
        }
        style: TabViewStyle {
            frameOverlap: 1
            tab: Rectangle {
                color: styleData.selected ? "steelblue" : systemPalette.window
                border.color:  "steelblue"
                implicitWidth: Math.max(text.width + 4, 70)
                implicitHeight: 40
                radius: 2
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: styleData.title
                    color: styleData.selected ? "white" : "black"
                }
            }
            frame: Rectangle { color: "steelblue" }
        }
    }

    DisplayPanel {
        id: displayPanel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: applicationProgressBar.top
        width: parent.width * 0.25
        anchors.rightMargin: parent.width * 0.04
        anchors.topMargin: parent.width * 0.05
        anchors.margins: Screen.pixelDensity
        visible: !signalTab.visible && !displayPanel.hidePanel
    }
    DisplayOtherPanel {
        id: displayOtherPanel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: applicationProgressBar.top
        width: parent.width * 0.25
        anchors.rightMargin: parent.width * 0.04
        anchors.topMargin: parent.width * 0.05
        anchors.margins: Screen.pixelDensity
        visible: displayPanel.hidePanel && !displayPanel.showOption
    }
    DisplayOptionPanel {
        id: displayOptionPanel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: applicationProgressBar.top
        width: parent.width * 0.25
        anchors.rightMargin: parent.width * 0.04
        anchors.topMargin: parent.width * 0.05
        anchors.margins: Screen.pixelDensity
        visible: displayPanel.showOption
    }
    ApplicationProgressBar {
        id: applicationProgressBar
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: displayPanel.width
        anchors.margins: Screen.pixelDensity
        visible: !signalTab.visible && !jogTab.visible
    }

    ApplicationNotifications {
        id: applicationNotifications
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.margins: Screen.pixelDensity
        messageWidth: parent.width * 0.25
    }
}

