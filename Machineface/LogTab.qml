import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.PathView 1.0
import QtQuick.Controls.Styles 1.2

Tab {
    title: qsTr("Log")
    id:logTab

    TabView {
        frameVisible: false
        id:logMainTab

        GPIO_Tab{id:gpioTab}
        AlarmTab{id:alarmTab}

        style: TabViewStyle {
            frameOverlap: 1
            tab: Rectangle {
                color: styleData.selected ? "steelblue" : systemPalette.window
                border.color:  "steelblue"
                implicitWidth: Math.max(text.width + 4, 70)
                implicitHeight: 60
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
}
