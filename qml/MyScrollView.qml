import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 滚动视图
Rectangle {
    id: scrollViewWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 滚动图片
        ScrollView {
            id: scrollView
            Layout.preferredWidth: 200
            Layout.preferredHeight: 200
            // ScrollView 不会自动裁剪，若不全屏的话，需要将 clip 设置为 true
            clip: true

            Image {
                id: firstPage
                sourceSize.width: scrollView.width * 1.5
                sourceSize.height: scrollView.height * 1.5
                source: "qrc:/images/images/logo.jpg"
            }
        }

        // 滚动列表
        ScrollView {
            Layout.preferredWidth: 100
            Layout.preferredHeight: 200

            ListView {
                model: 20
                delegate: ItemDelegate {
                    text: "Item " + index
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
