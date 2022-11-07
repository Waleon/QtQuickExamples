import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 按钮
// 比较典型的按钮有：“确定”、“应用”、“取消”、“关闭”、“是”、“否”和“帮助”。
Rectangle {
    id: buttonWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 普通按钮
        Button {
            text: "Button"
            onClicked: {
                console.info("button clicked, x:" + pressX + ", y:" + pressY)
            }
            onDoubleClicked: {
                console.info("button double clicked")
            }
        }

        // 扁平按钮（默认无背景，除非按下或选中）
        Button {
            text: "Flat"
            flat: true
        }

        // 高亮按钮
        Button {
            text: "Highlighted"
            highlighted : true
        }

        // 文本图标按钮
        Button {
            text: qsTr("Text")
            icon.source: "qrc:/images/images/logo.jpg"
            icon.color: "transparent"
            icon.width: 30
            icon.height: 30
        }

        // 自定义按钮
        Button {
            id: control
            text: qsTr("Custom")

            contentItem: Text {
                text: control.text
                font: control.font
                opacity: enabled ? 1.0 : 0.3
                // 正常、划过、按下颜色
                color: control.down ? Qt.rgba(0, 0, 0, 0.8) : (control.hovered ? Qt.rgba(0, 0, 0, 0.7) : Qt.rgba(0, 0, 0, 0.6))
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                // 正常、划过、按下颜色
                color: control.down ? "Gray" : (control.hovered ? "Silver" : "LightGrey")
                border.color: "Silver"
                border.width: 1
                radius: 2
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
