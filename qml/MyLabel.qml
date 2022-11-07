import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 文本、标签
Rectangle {
    id: labelWindow

    property string longText: "One, two and three miles to go; Four or five hamlets in haze. Six, seven arbors or so; Eight, nine and ten budding sprays."

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        // 文本
        Text {
            text: qsTr("Hello World!")  // 文本
        }

        // 文本字体
        Text {
            text: qsTr("Hello World!")
            color: "blue"  // 颜色
            font.family: "Helvetica"  // 字体
            font.pointSize: 20  // 字体大小
            font.bold: true    // 粗体
            font.italic: true  // 斜体
            font.underline: true  // 下划线
            font.capitalization: Font.AllLowercase  // 大小写（文本自动转小写）
        }

        // 文本格式
        Text {
            textFormat: Text.RichText  // HTML 富文本
            text: "<b>Hello</b> <i>World!</i>"
        }

        Text {
            textFormat: Text.PlainText  // 纯文本
            text: "<b>Hello</b> <i>World!</i>"
        }

        // 文本截断（换行，超出部分会被截断）
        Text {
            Layout.preferredWidth: 150
            clip: true
            text: longText
        }

        // 文本省略（不换行，超出部分显示为省略号）
        Text {
            Layout.preferredWidth: 150
            elide: Text.ElideRight
            text: longText
        }

        // 文本换行（自动换行）
        Text {
            Layout.preferredWidth: 150
            wrapMode: Text.WordWrap
            text: longText
        }

        // 文本样式
        RowLayout {
            spacing: 10
            Text { font.pointSize: 20; text: "Normal" }
            Text { font.pointSize: 20; text: "Raised"; style: Text.Raised; styleColor: "#AAAAAA" }
            Text { font.pointSize: 20; text: "Outline"; style: Text.Outline; styleColor: "red" }
            Text { font.pointSize: 20; text: "Sunken"; style: Text.Sunken; styleColor: "#AAAAAA" }
        }

        // 超链接
        Text {
            linkColor: "green"  // 超链接颜色
            text: "See the <a href=\"https://waleon.blog.csdn.net\">Waleon blog</a>."
            onLinkHovered: console.info(link + " link hovered")
            onLinkActivated: {
                Qt.openUrlExternally(link)
                console.info(link + " link activated")
            }
        }

        // 显示图片
        Text {
            text: "<img src=\"qrc:/images/images/logo.jpg\" width=\"200\" height=\"200\">"
        }

        // 标签（继承自 Text）
        Label {
            text: qsTr("Label")
        }

        // 标签（包含样式风格）
        Label {
            text: qsTr("Style Label")
            color: "White"

            background: Rectangle {
                color: "SteelBlue"
            }
        }

        // 标签（圆形背景）
        Label {
            Layout.preferredWidth: 100
            Layout.preferredHeight: 100
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment : Text.AlignVCenter
            text: qsTr("Round Label")
            color: "White"

            background: Rectangle {
                color: "MediumSlateBlue"
                radius: 50
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
