import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtWebEngine 1.0

Tab {
    title: qsTr("Product")

    WebEngineView {
        anchors.fill: parent
        url: "http://www.google.com"
    }
}
