import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 菜单
Rectangle {
    id: menuWindow

    property int selectStart
    property int selectEnd
    property int curPos

    property var recentFiles: ["123", "456"]

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 上下文菜单（例如：右键单击后显示），推荐使用 popup()
        TextField {
            id: textField
            placeholderText : qsTr("Context menu")
            selectByMouse: true

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.RightButton
                onClicked: {
                    selectStart = textField.selectionStart;
                    selectEnd = textField.selectionEnd;
                    curPos = textField.cursorPosition;
                    contextMenu.x = mouse.x;
                    contextMenu.y = mouse.y;
                    contextMenu.popup();
                    textField.cursorPosition = curPos;
                    textField.select(selectStart,selectEnd);
                }

                Menu {
                    id: contextMenu
                    MenuItem {
                        text: qsTr("Cu&t")
                        onTriggered: {
                            textField.cut()
                        }
                    }
                    MenuItem {
                        text: qsTr("&Copy")
                        onTriggered: {
                            textField.copy()
                        }
                    }
                    MenuItem {
                        text: qsTr("&Paste")
                        onTriggered: {
                            textField.paste()
                        }
                    }
                }
            }
        }

        // 弹出菜单（例如：单击按钮后显示）
        Button {
            id: fileButton
            text: "File"
            onClicked: fileMenu.open()

            Menu {
                id: fileMenu
                y: fileButton.height

                MenuItem {
                    text: qsTr("&New...")
                }
                MenuItem {
                    text: qsTr("&Open...")
                }
                MenuItem {
                    text: qsTr("&Save")
                }
            }
        }

        // 级联菜单
        MenuBar {
            Menu {
                title : "Edit"

                Action { text: "Undo" }
                Action { text: "Redo" }

                MenuSeparator { }

                Menu {
                    title: "Find/Replace"
                    Action { text: "Find Next" }
                    Action { text: "Find Previous" }
                    Action { text: "Replace" }
                }
            }
            // 动态添加、插入、移动、删除菜单项
            Menu {
                title: qsTr("Tool")
                Action {
                    text: "Add"
                    onTriggered: helpMenu.addEntry("Add" + helpMenu.count)
                }
                Action {
                    text: "Insert"
                    onTriggered: helpMenu.insertEntry(0, "Insert" + helpMenu.count)
                }
                Action {
                    text: "Move"
                    onTriggered: helpMenu.moveItem(0, 1)
                }
                Action {
                    text: "Remove"
                    onTriggered: helpMenu.removeEntry(0)
                }
            }
            Menu {
                id: helpMenu
                title: qsTr("Help")
                Action {
                    id: aboutAction
                    text: "About"
                }

                function addEntry(title) {
                    helpMenu.addItem(menuItem.createObject(helpMenu, { text: title }))
                }

                function insertEntry(index, title) {
                    helpMenu.insertItem(index, menuItem.createObject(helpMenu, { text: title }))
                }

                function removeEntry(index) {
                    if (index < helpMenu.count) {
                        var item = helpMenu.itemAt(index)
                        helpMenu.removeItem(item)
                    }
                }

                Component {
                    id: menuItem
                    MenuItem {

                    }
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
