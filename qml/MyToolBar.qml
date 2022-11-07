import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 工具栏
Rectangle {
    id: toolBarWindow

    Button {
        id: button
        anchors.centerIn: parent
        text: qsTr("Click me")

        onClicked: {
            appWindow.show()
        }
    }

    // ToolBar 常用作 ApplicationWindow 的页眉或页脚
    ApplicationWindow {
        id: appWindow
        title: "Application Window"
        width: 600
        height: 400
        visible: false

        // 页眉
        header: ToolBar {
            RowLayout {
                anchors.fill: parent
                ToolButton {
                    text: qsTr("‹")
                }
                Label {
                    text: "Message (99+)"
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                }
                ToolButton {
                    text: qsTr("⋮")
                }
            }
        }

        // 滚动列表
        ScrollView {
            anchors.fill: parent
            ListView {
                model: 20
                delegate: ItemDelegate {
                    text: "Item " + index
                }
            }
        }

        // 页脚
        footer: ToolBar {
            RowLayout {
                anchors.fill: parent
                Item {
                    Layout.fillWidth: true
                }
                ToolButton {
                    display : AbstractButton.TextUnderIcon
                    text: qsTr("Contacts")
                    icon.source: "qrc:///images/images/logo.jpg"
                    icon.color: "transparent"
                    icon.width: 30
                    icon.height: 30
                }
                Item {
                    Layout.fillWidth: true
                }
                ToolButton {
                    display : AbstractButton.TextUnderIcon
                    text: qsTr("Discover")
                    icon.source: "qrc:/images/images/logo2.jpg"
                    icon.color: "transparent"
                    icon.width: 30
                    icon.height: 30
                }
                Item {
                    Layout.fillWidth: true
                }
                ToolButton {
                    display : AbstractButton.TextUnderIcon
                    text: qsTr("Me")
                    icon.source: "qrc:/images/images/logo3.jpg"
                    icon.color: "transparent"
                    icon.width: 30
                    icon.height: 30
                }
                Item {
                    Layout.fillWidth: true
                }
            }
        }
    }
}
