import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 标签栏
Rectangle {
    id: tabBarWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillHeight: true
        }

        ColumnLayout {
            Layout.preferredWidth: parent.width / 2
            TabBar {
                id: tabBar
                TabButton {
                    text: qsTr("Home")
                }
                TabButton {
                    text: qsTr("Discover")
                }
                TabButton {
                    text: qsTr("Activity")
                }
            }

            StackLayout {
                currentIndex: tabBar.currentIndex
                Rectangle {
                    id: firstPage
                    visible: false
                    color: "Orange"
                }
                Rectangle {
                    id: secondPage
                    visible: false
                    color: "Green"
                }
                Rectangle {
                    id: thirdPage
                    visible: false
                    color: "Blue"
                }
            }
        }

        // Tab 支持拖动和轻弹（当按钮的总宽度超过标签栏的可用宽度时）
        ColumnLayout {
            Layout.preferredWidth: parent.width / 2
            TabBar {
                id: tabBar2
                implicitWidth: parent.width

                background: Rectangle {
                    color: "#eeeeee"
                }

                Repeater {
                    id: repeater
                    model: ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"]

                    TabButton {
                        text: modelData
                        width: Math.max(100, tabBar2.width / repeater.count)
                    }
                }
            }

            StackLayout {
                currentIndex: tabBar2.currentIndex

                Repeater {
                    model: ["Orange", "Green", "Blue", "Purple", "Yellow", "Red", "Gold", "Brown", "Gray", "Black"]

                    Rectangle {
                        color: modelData
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
