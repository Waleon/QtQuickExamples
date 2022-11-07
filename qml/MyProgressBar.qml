import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 进度条
Rectangle {
    id: progressBarWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 默认范围（0.0 ~ 1.0）
        ProgressBar {
            value: 0.5
        }

        // 不确定模式
        ProgressBar {
            indeterminate: true
        }

        // 自定义进度条
        ProgressBar {
            id: progressBar
            padding: 2
            from : 0  // 进度范围
            to: 100

            // 背景
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 16
                color: "#e6e6e6"
                radius: 8
            }

            // 进度
            contentItem: Item {
                implicitWidth: 200
                implicitHeight: 14

                Rectangle {
                    width: progressBar.visualPosition * parent.width
                    height: parent.height
                    radius: 7
                    color: "#17a81a"
                }
            }

            // 文本显示
            Label {
                id: prograssLabel
                anchors.fill: parent
                color: "White"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment : Text.AlignVCenter
                z: 100
            }

            onValueChanged: {
                prograssLabel.text = value.toString() + "%"
            }
        }

        // 定时器
        Timer {
            id: timer
            interval: 100
            repeat: true
            onTriggered: {
                if (progressBar.value < 100) {
                    progressBar.value += 1
                } else {
                    stop()
                }
            }
        }

        // 普通按钮
        Button {
            text: "Start"
            onClicked: {
                timer.start()
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
