import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Application.Controls 1.0

Tab {
    title: qsTr("Set")
    property string ipaddress: ''

    TabView{
        id:setttingsPage
        tabsVisible: false
        ChangeUserTab{id: changeUserTab; address: ipaddress}
        SetDroTab { address: ipaddress }
    }
}
