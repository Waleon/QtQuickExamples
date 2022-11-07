import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 分组框
Rectangle {
    id: groupBoxWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 普通分组框
        GroupBox {
             title: qsTr("Synchronize")  // 标题
             ColumnLayout {
                 anchors.fill: parent
                 CheckBox { text: qsTr("E-mail") }
                 CheckBox { text: qsTr("Calendar") }
                 CheckBox { text: qsTr("Contacts") }
             }
         }

        // 可选的分组框
        GroupBox {
            label: CheckBox {  // 标题项
                id: checkBox
                checked: true
                text: qsTr("Synchronize")
            }

            ColumnLayout {
                anchors.fill: parent
                enabled: checkBox.checked
                CheckBox { text: qsTr("E-mail") }
                CheckBox { text: qsTr("Calendar") }
                CheckBox { text: qsTr("Contacts") }
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
