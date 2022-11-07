import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4

// 侧滑抽屉（可以滑动打开和关闭）
Rectangle {
    id: drawWindow

    Button {
        id: button1
        anchors.centerIn: parent
        text: qsTr("Left drawer")

        onClicked: {
            if (leftDrawer.visible) {
                leftDrawer.close()
            } else {
                leftDrawer.open()
            }
        }
    }

    Button {
        anchors.top: button1.bottom
        anchors.left: button1.left
        anchors.topMargin: 10
        text: qsTr("Right drawer")

        onClicked: {
            if (rightDrawer.visible) {
                rightDrawer.close()
            } else {
                rightDrawer.open()
            }
        }
    }

    // 左侧抽屉（带导航）
    Drawer {
        id: leftDrawer
        width: 200
        height: drawWindow.height
        // 非交互式的
        interactive : false

        ColumnLayout {
            anchors.fill: parent
            ItemDelegate {
                text: qsTr("Home")
                Layout.fillWidth: true
                onClicked: {
                    leftDrawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Settings")
                Layout.fillWidth: true
            }
            ItemDelegate {
                text: qsTr("About")
                Layout.fillWidth: true
            }
            Item {
                Layout.fillHeight: true
            }
        }
    }

    // 右侧抽屉（带样式）
    Drawer {
        id: rightDrawer
        width: 200
        height: drawWindow.height
        // 到屏幕边缘的距离（在该距离内拖动将打开抽屉）
        dragMargin: 100
        // 抽屉起始方向
        edge: Qt.RightEdge

        background: Rectangle {
            anchors.fill: parent
            color: "SeaGreen"
        }
    }
}
