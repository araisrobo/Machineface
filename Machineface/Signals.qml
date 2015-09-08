import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Machinekit.Controls 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.HalRemote 1.0
import Machinekit.Application 1.0

Tab {
    id: signaltab
    anchors.top:parent.top
    title: qsTr("SignalDemo")
    active: true

    HalApplicationWindow {//ex:5
        id: main
        title: "My HAL application"
        name: "signals"

        property int baseSize: Math.min(width, height)
        property int ledSize: baseSize * 0.04
        property int baseposY: 20  // input led pos
        property int baseposY1: 20 + baseposY // output led pos
        property int baseposY2: 20 + baseposY1 + (row_led1.height + 20) * 5  // parameter pos

        //***************************************************
        // GPIO (intput)
        //***************************************************


        RowLayout{
            id:row_led1
            y:baseposY
            HalLed{
                name:"gpio.in.31"
            }
            HalLed{
                name:"gpio.in.30"
            }
            HalLed{
                name:"gpio.in.29"
            }
            HalLed{
                name:"gpio.in.28"
            }
            HalLed{
                name:"gpio.in.27"
            }
            HalLed{
                name:"gpio.in.26"
            }
            HalLed{
                name:"gpio.in.25"
            }
            HalLed{
                name:"gpio.in.24"
            }
        }
        RowLayout{
            x:row_led1.width + 20
            y:baseposY
            HalLed{
                name:"gpio.in.23"
            }
            HalLed{
                name:"gpio.in.22"
            }
            HalLed{
                name:"gpio.in.21"
            }
            HalLed{
                name:"gpio.in.20"
            }
            HalLed{
                name:"gpio.in.19"
            }
            HalLed{
                name:"gpio.in.18"
            }
            HalLed{
                name:"gpio.in.17"
            }
            HalLed{
                name:"gpio.in.16"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 2
            y:baseposY
            HalLed{
                name:"gpio.in.15"
            }
            HalLed{
                name:"gpio.in.14"
            }
            HalLed{
                name:"gpio.in.13"
            }
            HalLed{
                name:"gpio.in.12"
            }
            HalLed{
                name:"gpio.in.11"
            }
            HalLed{
                name:"gpio.in.10"
            }
            HalLed{
                name:"gpio.in.09"
            }
            HalLed{
                name:"gpio.in.08"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 3
            y:baseposY
            HalLed{
                name:"gpio.in.07"
            }
            HalLed{
                name:"gpio.in.06"
            }
            HalLed{
                name:"gpio.in.05"
            }
            HalLed{
                name:"gpio.in.04"
            }
            HalLed{
                name:"gpio.in.03"
            }
            HalLed{
                name:"gpio.in.02"
            }
            HalLed{
                name:"gpio.in.01"
            }
            HalLed{
                name:"gpio.in.00"
            }
        }
        RowLayout{
            y:(row_led1.height + 20) + baseposY
            HalLed{
                name:"gpio.in.63"
            }
            HalLed{
                name:"gpio.in.62"
            }
            HalLed{
                name:"gpio.in.61"
            }
            HalLed{
                name:"gpio.in.60"
            }
            HalLed{
                name:"gpio.in.59"
            }
            HalLed{
                name:"gpio.in.58"
            }
            HalLed{
                name:"gpio.in.57"
            }
            HalLed{
                name:"gpio.in.56"
            }
        }
        RowLayout{
            x:(row_led1.width + 20)
            y:(row_led1.height + 20) + baseposY
            HalLed{
                name:"gpio.in.55"
            }
            HalLed{
                name:"gpio.in.54"
            }
            HalLed{
                name:"gpio.in.53"
            }
            HalLed{
                name:"gpio.in.52"
            }
            HalLed{
                name:"gpio.in.51"
            }
            HalLed{
                name:"gpio.in.50"
            }
            HalLed{
                name:"gpio.in.49"
            }
            HalLed{
                name:"gpio.in.48"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 2
            y:(row_led1.height + 20) + baseposY
            HalLed{
                name:"gpio.in.47"
            }
            HalLed{
                name:"gpio.in.46"
            }
            HalLed{
                name:"gpio.in.45"
            }
            HalLed{
                name:"gpio.in.44"
            }
            HalLed{
                name:"gpio.in.43"
            }
            HalLed{
                name:"gpio.in.42"
            }
            HalLed{
                name:"gpio.in.41"
            }
            HalLed{
                name:"gpio.in.40"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 3
            y:(row_led1.height + 20) + baseposY
            HalLed{
                name:"gpio.in.39"
            }
            HalLed{
                name:"gpio.in.38"
            }
            HalLed{
                name:"gpio.in.37"
            }
            HalLed{
                name:"gpio.in.36"
            }
            HalLed{
                name:"gpio.in.35"
            }
            HalLed{
                name:"gpio.in.34"
            }
            HalLed{
                name:"gpio.in.33"
            }
            HalLed{
                name:"gpio.in.32"
            }
        }
        RowLayout{
            y:(row_led1.height + 20) * 2 + baseposY
            HalLed{
                name:"gpio.in.95"
            }
            HalLed{
                name:"gpio.in.94"
            }
            HalLed{
                name:"gpio.in.93"
            }
            HalLed{
                name:"gpio.in.92"
            }
            HalLed{
                name:"gpio.in.91"
            }
            HalLed{
                name:"gpio.in.90"
            }
            HalLed{
                name:"gpio.in.89"
            }
            HalLed{
                name:"gpio.in.88"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 1
            y:(row_led1.height + 20) * 2 + baseposY
            HalLed{
                name:"gpio.in.87"
            }
            HalLed{
                name:"gpio.in.86"
            }
            HalLed{
                name:"gpio.in.85"
            }
            HalLed{
                name:"gpio.in.84"
            }
            HalLed{
                name:"gpio.in.83"
            }
            HalLed{
                name:"gpio.in.82"
            }
            HalLed{
                name:"gpio.in.81"
            }
            HalLed{
                name:"gpio.in.80"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 2
            y:(row_led1.height + 20) * 2 + baseposY
            HalLed{
                name:"gpio.in.79"
            }
            HalLed{
                name:"gpio.in.78"
            }
            HalLed{
                name:"gpio.in.77"
            }
            HalLed{
                name:"gpio.in.76"
            }
            HalLed{
                name:"gpio.in.75"
            }
            HalLed{
                name:"gpio.in.74"
            }
            HalLed{
                name:"gpio.in.73"
            }
            HalLed{
                name:"gpio.in.72"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 3
            y:(row_led1.height + 20) * 2 + baseposY
            HalLed{
                name:"gpio.in.71"
            }
            HalLed{
                name:"gpio.in.70"
            }
            HalLed{
                name:"gpio.in.69"
            }
            HalLed{
                name:"gpio.in.68"
            }
            HalLed{
                name:"gpio.in.67"
            }
            HalLed{
                name:"gpio.in.66"
            }
            HalLed{
                name:"gpio.in.65"
            }
            HalLed{
                name:"gpio.in.64"
            }
        }

        //***************************************************
        // GPIO (output)
        //***************************************************
        RowLayout{
            x:(row_led1.width + 20) * 3
            y:(row_led1.height + 20) * 3 + baseposY1
            HalLed{
                name:"gpio.out.07"
            }
            HalLed{
                name:"gpio.out.06"
            }
            HalLed{
                name:"gpio.out.05"
            }
            HalLed{
                name:"gpio.out.04"
            }
            HalLed{
                name:"gpio.out.03"
            }
            HalLed{
                name:"gpio.out.02"
            }
            HalLed{
                name:"gpio.out.01"
            }
            HalLed{
                name:"gpio.out.00"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 2
            y:(row_led1.height + 20) * 3 + baseposY1
            HalLed{
                name:"gpio.out.15"
            }
            HalLed{
                name:"gpio.out.14"
            }
            HalLed{
                name:"gpio.out.13"
            }
            HalLed{
                name:"gpio.out.12"
            }
            HalLed{
                name:"gpio.out.11"
            }
            HalLed{
                name:"gpio.out.10"
            }
            HalLed{
                name:"gpio.out.09"
            }
            HalLed{
                name:"gpio.out.08"
            }
        }
        RowLayout{
            x:(row_led1.width + 20)
            y:(row_led1.height + 20) * 3 + baseposY1
            HalLed{
                name:"gpio.out.23"
            }
            HalLed{
                name:"gpio.out.22"
            }
            HalLed{
                name:"gpio.out.21"
            }
            HalLed{
                name:"gpio.out.20"
            }
            HalLed{
                name:"gpio.out.19"
            }
            HalLed{
                name:"gpio.out.18"
            }
            HalLed{
                name:"gpio.out.17"
            }
            HalLed{
                name:"gpio.out.16"
            }
        }
        RowLayout{
            y:(row_led1.height + 20) * 3 + baseposY1
            HalLed{
                name:"gpio.out.31"
            }
            HalLed{
                name:"gpio.out.30"
            }
            HalLed{
                name:"gpio.out.29"
            }
            HalLed{
                name:"gpio.out.28"
            }
            HalLed{
                name:"gpio.out.27"
            }
            HalLed{
                name:"gpio.out.26"
            }
            HalLed{
                name:"gpio.out.25"
            }
            HalLed{
                name:"gpio.out.24"
            }
        }
        RowLayout{
            y:(row_led1.height + 20) * 4 + baseposY1
            HalLed{
                name:"gpio.out.71"
            }
            HalLed{
                name:"gpio.out.70"
            }
            HalLed{
                name:"gpio.out.69"
            }
            HalLed{
                name:"gpio.out.68"
            }
            HalLed{
                name:"gpio.out.67"
            }
            HalLed{
                name:"gpio.out.66"
            }
            HalLed{
                name:"gpio.out.65"
            }
            HalLed{
                name:"gpio.out.64"
            }
        }
        RowLayout{
            x:(row_led1.width + 20)
            y:(row_led1.height + 20) * 4 + baseposY1
            HalLed{
                name:"gpio.out.63"
            }
            HalLed{
                name:"gpio.out.62"
            }
            HalLed{
                name:"gpio.out.61"
            }
            HalLed{
                name:"gpio.out.60"
            }
            HalLed{
                name:"gpio.out.59"
            }
            HalLed{
                name:"gpio.out.58"
            }
            HalLed{
                name:"gpio.out.57"
            }
            HalLed{
                name:"gpio.out.56"
            }
        }
        RowLayout{
            x:(row_led1.width + 20)
            y:(row_led1.height + 20) * 4 + baseposY1
            HalLed{
                name:"gpio.out.55"
            }
            HalLed{
                name:"gpio.out.54"
            }
            HalLed{
                name:"gpio.out.53"
            }
            HalLed{
                name:"gpio.out.52"
            }
            HalLed{
                name:"gpio.out.51"
            }
            HalLed{
                name:"gpio.out.50"
            }
            HalLed{
                name:"gpio.out.49"
            }
            HalLed{
                name:"gpio.out.48"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 2
            y:(row_led1.height + 20) * 4 + baseposY1
            HalLed{
                name:"gpio.out.47"
            }
            HalLed{
                name:"gpio.out.46"
            }
            HalLed{
                name:"gpio.out.45"
            }
            HalLed{
                name:"gpio.out.44"
            }
            HalLed{
                name:"gpio.out.43"
            }
            HalLed{
                name:"gpio.out.42"
            }
            HalLed{
                name:"gpio.out.41"
            }
            HalLed{
                name:"gpio.out.40"
            }
        }
        RowLayout{
            x:(row_led1.width + 20) * 3
            y:(row_led1.height + 20) * 4 + baseposY1
            HalLed{
                name:"gpio.out.39"
            }
            HalLed{
                name:"gpio.out.38"
            }
            HalLed{
                name:"gpio.out.37"
            }
            HalLed{
                name:"gpio.out.36"
            }
            HalLed{
                name:"gpio.out.35"
            }
            HalLed{
                name:"gpio.out.34"
            }
            HalLed{
                name:"gpio.out.33"
            }
            HalLed{
                name:"gpio.out.32"
            }
        }
        //***************************************************
        // BP-TICK
        //***************************************************
        Label {//bptick
            id:bptick_value
            y:baseposY2
            text: "bp-tick : " + bptickPin.value
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
            y:baseposY2 + bptick_value.height
            text: "encposj0 : " + encposj0Pin.value
            HalPin {
                id: encposj0Pin
                name: "encposj0"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj1
            y:baseposY2 + bptick_value.height * 2
            text: "encposj1 : " + encposj1Pin.value
            HalPin {
                id: encposj1Pin
                name: "encposj1"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj2
            y:baseposY2 + bptick_value.height * 3
            text: "encposj2 : " + encposj2Pin.value
            HalPin {
                id: encposj2Pin
                name: "encposj2"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj3
            y:baseposY2 + bptick_value.height * 4
            text: "encposj3 : " + encposj3Pin.value
            HalPin {
                id: encposj3Pin
                name: "encposj3"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj4
            y:baseposY2 + bptick_value.height * 5
            text: "encposj4 : " + encposj4Pin.value
            HalPin {
                id: encposj4Pin
                name: "encposj4"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//encposj5

            y:baseposY2 + bptick_value.height * 6
            text: "encposj5 : " + encposj5Pin.value
            HalPin {
                id: encposj5Pin
                name: "encposj5"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        //***************************************************
        // cmd_fbs
        //***************************************************
        Label {//cmdfbsj0
            x:bptick_value.width
            y:baseposY2 + bptick_value.height
            text: "cmdfbsj0 : " + cmdfbsj0Pin.value
            HalPin {
                id: cmdfbsj0Pin
                name: "cmdfbsj0"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj1
            x:bptick_value.width
            y:baseposY2 + bptick_value.height * 2
            text: "cmdfbsj1 : " + cmdfbsj1Pin.value
            HalPin {
                id: cmdfbsj1Pin
                name: "cmdfbsj1"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj2
            x:bptick_value.width
            y:baseposY2 + bptick_value.height * 3
            text: "cmdfbsj2 : " + cmdfbsj2Pin.value
            HalPin {
                id: cmdfbsj2Pin
                name: "cmdfbsj2"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj3
            x:bptick_value.width
            y:baseposY2 + bptick_value.height * 4
            text: "cmdfbsj3 : " + cmdfbsj3Pin.value
            HalPin {
                id: cmdfbsj3Pin
                name: "cmdfbsj3"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj4
            x:bptick_value.width
            y:baseposY2 + bptick_value.height * 5
            text: "cmdfbsj4 : " + cmdfbsj4Pin.value
            HalPin {
                id: cmdfbsj4Pin
                name: "cmdfbsj4"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
        Label {//cmdfbsj5
            x:bptick_value.width
            y:baseposY2 + bptick_value.height * 6
            text: "cmdfbsj5 : " + cmdfbsj5Pin.value
            HalPin {
                id: cmdfbsj5Pin
                name: "cmdfbsj5"
                direction: HalPin.In
                type: HalPin.S32
            }
        }
    }
}
