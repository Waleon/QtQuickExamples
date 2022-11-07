import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 复选框
Rectangle {
    id: checkBoxWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 复选框
        CheckBox {
            text: "First"
        }

        // 复选框
        CheckBox {
            text: "Second"
            tristate: true  // 三态
            onCheckStateChanged: {
                console.info("check state:" + checkState)
            }
        }

        // 按钮组管理
        ColumnLayout {
            ButtonGroup {
                id: childGroup
                exclusive: false  // 非互斥
                checkState: parentBox.checkState
            }

            CheckBox {
                id: parentBox
                text: qsTr("Parent")
                checkState: childGroup.checkState
            }

            CheckBox {
                checked: true
                text: qsTr("Child 1")
                leftPadding: indicator.width
                ButtonGroup.group: childGroup
            }

            CheckBox {
                text: qsTr("Child 2")
                leftPadding: indicator.width
                ButtonGroup.group: childGroup
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
