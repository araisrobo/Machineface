import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.PathView 1.0
import QtQuick.Controls.Styles 1.2

Tab {
    title: qsTr("Log")
    id:logTab
//    enabled:changeUserTab.userID > 0
    visible:false
    active: false
    TabView {
        frameVisible: false
        id:logMainTab
        GPIO_Tab{id:gpioTab}
        AlarmTab{id:alarmTab}
//        ProductTab{id:productTab}
        style: TabViewStyle {
            frameOverlap: 1

            tab: Rectangle {
                gradient: Gradient {
                    GradientStop { position: 0 ; color: (styleData.selected) ?
                                                            Qt.darker("lightsteelblue", 1.05) :
                                                            Qt.darker("#DDD", 0.85) }
                    GradientStop { position: 1 ; color: (styleData.selected) ?
                                                            Qt.darker("lightsteelblue", 1.5) :
                                                            Qt.darker("#DDD", 1.3) }
                }
                implicitWidth: Math.max(text.width + 4, 70)
                implicitHeight: 60
                radius: 10
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: styleData.title
                    color: styleData.selected ? "white" : "black"
                }
            }
        }
    }
}
