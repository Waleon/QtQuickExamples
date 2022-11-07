import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 分割器
Rectangle {
    id: separatorWindow

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillHeight: true
        }
        // 菜单项分割器
        MenuBar {
            Layout.alignment: Qt.AlignCenter
            Menu {
                id: menu
                title: qsTr("File")
                MenuItem {
                    text: qsTr("New...")
                }
                MenuItem {
                    text: qsTr("Open...")
                }
                MenuSeparator {}
                MenuItem {
                    text: qsTr("Print")
                }
                MenuSeparator {}
                MenuItem {
                    text: qsTr("Exit")
                }
            }
        }

        // 工具栏分割器
        ToolBar {
            Layout.alignment: Qt.AlignCenter
            RowLayout {
                anchors.fill: parent
                ToolButton {
                    text: qsTr("Welcome")
                }
                ToolButton {
                    text: qsTr("Edit")
                }
                ToolSeparator {
                    padding: 0
                    leftPadding: 10
                    rightPadding: 10
                    contentItem: Rectangle {
                        implicitWidth: 2
                        implicitHeight: 50
                        color: "Blue"
                    }
                }
                ToolButton {
                    text: qsTr("Design")
                }
                ToolButton {
                    text: qsTr("Debug")
                }
            }
        }
        Item {
            Layout.fillHeight: true
        }
    }
}
