import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.PathView 1.0

Tab {
    title: qsTr("GPIO")

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Screen.pixelDensity * 1
        SourceViewGPIO {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
