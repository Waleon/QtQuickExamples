import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 提示条
Rectangle {
    id: toolTipWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 显示效果1（按下显示）
        Button {
            text: qsTr("Press")

            ToolTip.visible: pressed  // 按下时可见
            ToolTip.text: qsTr("This tool tip is shown after the button is pressed")
        }

        // 显示效果2（划过后1秒再显示，共显示5秒）
        Button {
            text: qsTr("Hover")
            hoverEnabled: true

            ToolTip.delay: 1000  // 延时 1 秒显示
            ToolTip.timeout: 5000  // 显示的总时长
            ToolTip.visible: hovered  // 划过时可见
            ToolTip.text: qsTr("This tool tip is shown after hovering the button for a second")
        }

        // 显示效果3（包含样式风格）
        Button {
            id: button
            text: qsTr("Style")
            hoverEnabled: true

            ToolTip {
                id: styleToolTip
                visible: button.hovered
                text: qsTr("This is a tool tip with a style")

                contentItem: Text {
                    text: styleToolTip.text
                    font: styleToolTip.font
                    color: "White"
                }

                background: Rectangle {
                    color: "DimGray"
                }
            }
        }

        // 显示效果4（划过后显示长文本，可自动换行）
        Label {
            text: qsTr("Word wrap")

            ToolTip {
                id: toolTip
                implicitWidth: 200  // 提示条宽度
                timeout: 5000
                visible: mouseArea.containsMouse  // 鼠标划过时可见
                text: qsTr("This is a tool tip that contains long text and can wrap lines automatically")

                contentItem: Text {
                    text: toolTip.text
                    font: toolTip.font
                    wrapMode: Text.WordWrap  // 换行方式
                }
            }

            // 鼠标区域
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
