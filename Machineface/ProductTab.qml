import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import QtWebEngine 1.0
import QtQuick.Controls.Styles 1.0

Tab {
    title: qsTr("Product")
    ToolBar {
            id: navigationBar
    RowLayout {
        id:toolLayout
        anchors.left: parent.left
        anchors.right: parent.right

        ToolButton {
            id: backButton
            iconSource: "qrc:MachineKit/../../icons/go-previous.png"
            onClicked: currentWebView.goBack()
            enabled: currentWebView && currentWebView.canGoBack
        }
        ToolButton {
            id: forwardButton
            iconSource: "qrc:MachineKit/../../icons/go-next.png"
            onClicked: currentWebView.goForward()
            enabled: currentWebView && currentWebView.canGoForward
        }
        ToolButton {
            id: reloadButton
            iconSource: currentWebView && currentWebView.loading ? "qrc:MachineKit/../icons/process-stop.png" : "qrc:MachineKit/../icons/view-refresh.png"
            onClicked: currentWebView && currentWebView.loading ? currentWebView.stop() : currentWebView.reload()
        }
        TextField {
            id: addressBar
            Image {
                anchors.verticalCenter: addressBar.verticalCenter;
                x: 5
                z: 2
                id: faviconImage
                width: 16; height: 16
                source: currentWebView && currentWebView.icon
            }
            style: TextFieldStyle {
                padding {
                    left: 26;
                }
            }
            focus: true
            Layout.fillWidth: true
            text: currentWebView && currentWebView.url
            onAccepted: currentWebView.url = utils.fromUserInput(text)
        }
    }
    WebEngineView {
        id:currentWebView
        anchors.top:toolLayout.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        url: "http://google.com"
    }

}
}
