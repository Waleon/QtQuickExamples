import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 单选框
Rectangle {
    id: radioButtonWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 同一 parent 中的单选按钮，一次只能选中一个
        ColumnLayout {
            RadioButton {
                checked: true
                text: qsTr("First")
                onCheckedChanged: {
                    console.info("first button checked:" + checked)
                }
            }
            RadioButton {
                text: qsTr("Second")
            }
            RadioButton {
                text: qsTr("Third")
            }
        }

        // 非同一 parent 的，需要使用 ButtonGroup 管理互斥性
        ButtonGroup {
            id: buttonGroup
            exclusive: true  // 互斥
            onCheckedButtonChanged: {
                console.info("checked button:" + checkedButton.text)
            }
        }

        ColumnLayout {
            RadioButton {
                text: qsTr("Option 1")
                checked: true
                ButtonGroup.group: buttonGroup
            }
        }

        ColumnLayout {
            RadioButton {
                text: qsTr("Option 2")
                ButtonGroup.group: buttonGroup
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
