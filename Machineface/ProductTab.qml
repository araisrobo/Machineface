import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
// import QtWebEngine 1.0
import QtQuick.Controls.Styles 1.0

Tab {
    title: qsTr("Prod")
    property string ipaddress: ''

    TabView{
        id:productPage
        tabsVisible: false
        ProductData{address: ipaddress}
        ProductCreate{address: ipaddress}
    }
}
