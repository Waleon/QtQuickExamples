import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 滑动视图
Rectangle {
    id: swipeViewWindow

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillHeight: true
        }

        // 滑动视图（可横向滑动）
        SwipeView {
            id: view
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 300
            Layout.preferredHeight: 300
            currentIndex: pageIndicator.currentIndex
            interactive: true  // 可交互的
            clip: true

            Image {
                id: firstPage
                sourceSize.width: view.width
                sourceSize.height: view.height
                source: "qrc:/images/images/logo.jpg"
            }
            Image {
                id: secondPage
                sourceSize.width: view.width
                sourceSize.height: view.height
                source: "qrc:/images/images/logo2.jpg"
            }
            Image {
                id: thirdPage
                sourceSize.width: view.width
                sourceSize.height: view.height
                source: "qrc:/images/images/logo3.jpg"
            }
        }

        // 页面指示器
        PageIndicator {
            id: pageIndicator
            Layout.alignment: Qt.AlignCenter
            interactive: true  // 可交互的
            count: view.count
            currentIndex: view.currentIndex
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
