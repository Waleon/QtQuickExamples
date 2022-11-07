import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 圆形按钮
Rectangle {
    id: roundButtonWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 图标按钮
        RoundButton {
            id: control
            text: "\u2713"  // Unicode 字符图标（对勾）

            contentItem: Text {
                text: control.text
                font: control.font
                color: "Green"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        // 文本按钮（自动计算圆角）
        RoundButton {
            Layout.preferredWidth: 120
            Layout.preferredHeight: 120
            text: qsTr("Round")
        }

        // 文本按钮（自动计算圆角）
        RoundButton {
            Layout.preferredWidth: 120
            Layout.preferredHeight: 40
            text: qsTr("Round")
        }

        // 文本按钮（手动指定圆角大小）
        RoundButton {
            Layout.preferredWidth: 120
            Layout.preferredHeight: 40
            text: qsTr("Round")
            radius: 8  // 圆角大小
        }

        // 文本图标按钮
        RoundButton {
            Layout.preferredWidth: 120
            Layout.preferredHeight: 120
            text: qsTr("Round")
            icon.source: "qrc:/images/images/logo.jpg"  // 图标
            icon.color: "transparent"
            icon.width: 50
            icon.height: 50
            display: AbstractButton.TextUnderIcon  // 文本位于图标之下
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
