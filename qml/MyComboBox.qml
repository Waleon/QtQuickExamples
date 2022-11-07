import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 下拉框
Rectangle {
    id: comboBoxWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 利用数据模型填充
        ComboBox {
            model: ["Apple", "Orange", "Banana"]
        }

        // 可编辑的下拉框
        ComboBox {
            editable: true
            model: ListModel {
                id: model
                ListElement { text: "Apple" }
                ListElement { text: "Orange" }
                ListElement { text: "Banana" }
            }
            onAccepted: {
                if (find(editText) === -1)
                    model.append({text: editText})  // 追加一个
            }
        }

        // 下拉框模型角色
        ComboBox {
            id: comboBox
            textRole: "name"  // 当存在多个命名角色时，需指定 textRole（利用 name 数据填充下拉框）。
            model: ListModel {
                ListElement { name: "Apple"; cost: 4.00 }
                ListElement { name: "Orange"; cost: 3.25 }
                ListElement { name: "Banana"; cost: 2.45 }
            }
            onActivated: {
                console.info("index:" + index + ", text:" + comboBox.textAt(index))
                var item = comboBox.model.get(index)  // 获取当前下拉选项
                console.info("name:" + item.name + ", cost:" + item.cost)
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
