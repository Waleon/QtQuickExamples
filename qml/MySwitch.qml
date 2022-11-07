import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 开关按钮
Rectangle {
    id: switchWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        Switch {
            text: qsTr("Wifi")

            onCheckedChanged: {
                console.info("wifi checked:" + checked)
            }
        }

        // 自定义样式
        Switch {
             id: control
             text: qsTr("Bluetooth")

             indicator: Rectangle {
                 implicitWidth: 48
                 implicitHeight: 26
                 x: control.leftPadding
                 y: parent.height / 2 - height / 2
                 radius: 13
                 color: control.checked ? "#17a81a" : "#ffffff"
                 border.color: control.checked ? "#17a81a" : "#cccccc"

                 // 圆环
                 Rectangle {
                     x: control.checked ? parent.width - width : 0
                     width: 26
                     height: 26
                     radius: 13
                     color: control.down ? "#cccccc" : "#ffffff"
                     border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
                 }
             }

             // 文本
             contentItem: Text {
                 text: control.text
                 font: control.font
                 opacity: enabled ? 1.0 : 0.3
                 color: control.down ? "#17a81a" : "#21be2b"
                 verticalAlignment: Text.AlignVCenter
                 leftPadding: control.indicator.width + control.spacing
             }
         }

        Item {
            Layout.fillWidth: true
        }
    }
}
