import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 单行文本输入框（继承自 TextInput）
Rectangle {
    id: textFieldWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 占位提示
        TextField {
            placeholderText: qsTr("Enter name")

            // 当按下 Return/Enter 键或者文本框失去焦点时触发
            onEditingFinished: {
                console.info("text field editing finished:" + text)
            }

            // 每当编辑文本时触发
            onTextEdited: {
                console.info("text field text edited:" + text)
            }
        }

        // 回显方式
        TextField {
            placeholderText: qsTr("Enter password")
            echoMode: TextInput.Password
            text: "123456"
            selectByMouse: true  // 可使用鼠标选择文本
        }

        // 输入掩码
        TextField {
            inputMask: "0000-00-00"  // 类似 2022-10-01 的日期格式
            selectByMouse: true
        }

        // 验证器（IntValidator、DoubleValidator、DoubleValidator 等）
        TextField {
            selectByMouse: true
            placeholderText: qsTr("0 ~ 65535")
            validator: IntValidator {
                bottom: 0
                top: 65535
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
