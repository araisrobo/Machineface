import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Machinekit.Controls 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.HalRemote 1.0
import Machinekit.Application 1.0
import QtQuick.Window 2.0

Tab {
    id: signaltab
    anchors.top:parent.top
    title: qsTr("Signals")
    active: true

    HalApplicationWindow {
        id: main
        title: "My HAL application"
        name: "signals"

        property int baseSize: Math.min(width, height)
        property int ledSize: width * 0.033
        property int fontSize: baseSize * 0.03
        property int topMargin : height * 0.01
        property int ledspacing : ledSize * 0.2
        //***************************************************
        // GPIO (intput)
        //***************************************************
        RowLayout{
            id:rowLayout1_1
            anchors.top : parent.top
            anchors.topMargin : topMargin
            spacing :ledspacing
            x : 0
            y : 0
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.31"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.30"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.29"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.28"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.27"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.26"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.25"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.24"
            }
        }
        RowLayout{
            id:rowLayout1_2
            anchors.top: parent.top
            anchors.topMargin: topMargin
            spacing :ledspacing
            x:rowLayout1_1.x + rowLayout1_1.width + ledSize
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.23"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.22"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.21"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.20"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.19"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.18"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.17"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.16"
            }
        }
        RowLayout{
            id:rowLayout1_3
            anchors.top: parent.top
            anchors.topMargin: topMargin
            spacing :ledspacing
            x:rowLayout1_2.x + rowLayout1_2.width + ledSize
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.15"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.14"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.13"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.12"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.11"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.10"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.9"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.8"
            }
        }
        RowLayout{
            id:rowLayout1_4
            anchors.top: parent.top
            anchors.topMargin: topMargin
            spacing :ledspacing
            x:rowLayout1_3.x + rowLayout1_3.width + ledSize
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.7"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.6"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.5"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.4"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.3"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.2"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.1"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.0"
            }
        }
        RowLayout{
            id:rowLayout2_1
            anchors.top : rowLayout1_1.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_1.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.63"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.62"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.61"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.60"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.59"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.58"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.57"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.56"
            }
        }
        RowLayout{
            id:rowLayout2_2
            anchors.top : rowLayout1_2.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_2.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.55"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.54"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.53"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.52"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.51"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.50"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.49"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.48"
            }
        }
        RowLayout{
            id:rowLayout2_3
            anchors.top : rowLayout1_3.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_3.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.47"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.46"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.45"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.44"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.43"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.42"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.41"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.40"
            }
        }
        RowLayout{
            id:rowLayout2_4
            anchors.top : rowLayout1_4.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_4.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.39"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.38"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.37"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.36"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.35"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.34"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.33"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.32"
            }
        }
        RowLayout{
            id:rowLayout3_1
            anchors.top : rowLayout2_1.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_1.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.95"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.94"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.93"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.92"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.91"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.90"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.89"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.88"
            }
        }
        RowLayout{
            id:rowLayout3_2
            anchors.top : rowLayout2_2.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_2.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.87"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.86"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.85"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.84"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.83"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.82"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.81"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.80"
            }
        }
        RowLayout{
            id:rowLayout3_3
            anchors.top : rowLayout2_3.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_3.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.79"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.78"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.77"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.76"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.75"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.74"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.73"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.72"
            }
        }
        RowLayout{
            id:rowLayout3_4
            anchors.top : rowLayout2_4.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_4.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.71"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.70"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.69"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.68"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.67"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.66"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.65"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.in.64"
            }
        }

        //***************************************************
        // GPIO (output)
        //***************************************************
        RowLayout{
            id:rowLayout4_1
            anchors.top : rowLayout3_1.bottom
            anchors.topMargin : topMargin + ledSize
            spacing :ledspacing
            x:rowLayout1_1.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.31"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.30"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.29"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.28"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.27"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.26"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.25"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.24"
            }
        }
        RowLayout{
            id:rowLayout4_2
            anchors.top : rowLayout3_2.bottom
            anchors.topMargin : topMargin + ledSize
            spacing :ledspacing
            x:rowLayout1_2.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.23"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.22"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.21"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.20"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.19"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.18"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.17"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.16"
            }
        }
        RowLayout{
            id:rowLayout4_3
            anchors.top : rowLayout3_3.bottom
            anchors.topMargin : topMargin + ledSize
            spacing :ledspacing
            x:rowLayout1_3.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.15"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.14"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.13"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.12"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.11"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.10"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.9"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.8"
            }
        }

        RowLayout{
            id:rowLayout4_4
            anchors.top : rowLayout3_4.bottom
            anchors.topMargin : topMargin + ledSize
            spacing :ledspacing
            x:rowLayout1_4.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.7"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.6"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.5"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.4"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.3"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.2"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.1"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.0"
            }
        }
        RowLayout{
            id:rowLayout5_1
            anchors.top : rowLayout4_1.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_1.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.63"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.62"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.61"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.60"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.59"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.58"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.57"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.56"
            }
        }
        RowLayout{
            id:rowLayout5_2
            anchors.top : rowLayout4_2.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_2.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.55"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.54"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.53"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.52"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.51"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.50"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.49"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.48"
            }
        }
        RowLayout{
            id:rowLayout5_3
            anchors.top : rowLayout4_3.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_3.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.47"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.46"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.45"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.44"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.43"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.42"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.41"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.40"
            }
        }
        RowLayout{
            id:rowLayout5_4
            anchors.top : rowLayout4_4.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_4.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.39"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.38"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.37"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.36"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.35"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.34"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.33"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.32"
            }
        }
        RowLayout{
            id:rowLayout6_4
            anchors.top : rowLayout5_4.bottom
            anchors.topMargin : topMargin
            spacing :ledspacing
            x:rowLayout1_4.x
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.71"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.70"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.69"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.68"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.67"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.66"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.65"
            }
            HalLed{
                Layout.preferredWidth : ledSize
                Layout.preferredHeight : ledSize
                name:"gpio.out.64"
            }
        }
        //***************************************************
        // BP-TICK
        //***************************************************
        Label {//bptick
            id: bptickValue
            x: rowLayout1_1.x
            y: rowLayout6_4.y + topMargin + ledSize
            text: "bp-tick : " + bptickPin.value
            font.pixelSize: fontSize
            HalPin {
                id: bptickPin
                name: "bptick"
                direction: HalPin.In
                type: HalPin.U32
            }
        }
        //***************************************************
        // enc_pos
        //***************************************************
        Label {//encposj0
            x: rowLayout1_1.x
            y: rowLayout6_4.y + topMargin + ledSize * 2
            text: "encposj0 : " + encposj0Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: encposj0Pin
                name: "joint.0.encpos"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj1
            x: rowLayout1_1.x
            y: rowLayout6_4.y + topMargin + ledSize * 3
            text: "encposj1 : " + encposj1Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: encposj1Pin
                name: "joint.1.encpos"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj2
            x: rowLayout1_1.x
            y: rowLayout6_4.y + topMargin + ledSize * 4
            text: "encposj2 : " + encposj2Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: encposj2Pin
                name: "joint.2.encpos"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj3
            x: rowLayout1_1.x
            y: rowLayout6_4.y + topMargin + ledSize * 5
            text: "encposj3 : " + encposj3Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: encposj3Pin
                name: "joint.3.encpos"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj4
            x: rowLayout1_1.x
            y: rowLayout6_4.y + topMargin + ledSize * 6
            text: "encposj4 : " + encposj4Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: encposj4Pin
                name: "joint.4.encpos"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj5
            x: rowLayout1_1.x
            y: rowLayout6_4.y + topMargin + ledSize * 7
            text: "encposj5 : " + encposj5Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: encposj5Pin
                name: "joint.5.encpos"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        //***************************************************
        // cmd_fbs
        //***************************************************
        Label {//cmdfbsj0
            x: rowLayout1_2.x
            y: rowLayout6_4.y + topMargin + ledSize * 2
            text: "cmdfbsj0 : " + cmdfbsj0Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: cmdfbsj0Pin
                name: "joint.0.cmdfbs"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj1
            x: rowLayout1_2.x
            y: rowLayout6_4.y + topMargin + ledSize * 3
            text: "cmdfbsj1 : " + cmdfbsj1Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: cmdfbsj1Pin
                name: "joint.1.cmdfbs"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj2
            x: rowLayout1_2.x
            y: rowLayout6_4.y + topMargin + ledSize * 4
            text: "cmdfbsj2 : " + cmdfbsj2Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: cmdfbsj2Pin
                name: "joint.2.cmdfbs"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj3
            x: rowLayout1_2.x
            y: rowLayout6_4.y + topMargin + ledSize * 5
            text: "cmdfbsj3 : " + cmdfbsj3Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: cmdfbsj3Pin
                name: "joint.3.cmdfbs"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj4
            x: rowLayout1_2.x
            y: rowLayout6_4.y + topMargin + ledSize * 6
            text: "cmdfbsj4 : " + cmdfbsj4Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: cmdfbsj4Pin
                name: "joint.4.cmdfbs"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj5
            x: rowLayout1_2.x
            y: rowLayout6_4.y + topMargin + ledSize * 7
            text: "cmdfbsj5 : " + cmdfbsj5Pin.value
            font.pixelSize: fontSize
            HalPin {
                id: cmdfbsj5Pin
                name: "joint.5.cmdfbs"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
    }
}
