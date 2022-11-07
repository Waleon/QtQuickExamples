import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 多行文本输入框（继承自 TextEdit）
Rectangle {
    id: textAreaWindow

    property string longText: "One, two and three miles to go; Four or five hamlets in haze. Six, seven arbors or so; Eight, nine and ten budding sprays."

    property string richText: "<html> \
                               <head> \
                               <style> \
                               font{color:green;} \
                               </style> \
                               </head> \
                               <body>\
                               <font>I am a Qter</font> \
                               <br/> \
                               <img src=\"qrc:/images/images/logo.jpg\" width=\"100\" height=\"100\"> \
                               <br/> \
                               See the <a href=\"https://waleon.blog.csdn.net\">Waleon blog</a> \
                               </body> \
                               </html>";

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 占位提示
        TextArea {
            placeholderText: qsTr("Enter name")

            // 当按下 Return/Enter 键或者文本框失去焦点时触发
            onEditingFinished: {
                console.info("text area editing finished:" + text)
            }

            // 每当文本变化时触发
            onTextChanged: {
                console.info("text area text changed:" + text)
            }
        }

        // 滚动区域
        ScrollView {
            Layout.preferredWidth: 150
            Layout.preferredHeight: 100

            TextArea {
                text: longText
            }
        }

        // 自动换行
        ScrollView {
            Layout.preferredWidth: 150
            Layout.preferredHeight: 100

            TextArea {
                text: longText
                wrapMode: TextArea.Wrap  // 换行
                selectByMouse: true
                background: Rectangle {
                    border.color: "Gray"
                }
            }
        }

        // 文本格式（纯文本：TextEdit.PlainText， 富文本：TextEdit.PlainText）
        ScrollView {
            Layout.preferredWidth: 150
            Layout.preferredHeight: 100

            TextArea {
                text: richText
                textFormat: TextEdit.AutoText  // 自动决定是富文本
                wrapMode: TextArea.Wrap
                selectByMouse: true
                background: Rectangle {
                    border.color: "Gray"
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
