import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 滑块
Rectangle {
    id: sliderWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        // 水平滑块
        Slider {
            from: 1
            to: 100
            value: 25

            onValueChanged: {
                console.info("slider value:" + value)
            }
        }

        // 步长
        Slider {
            from: 1
            to: 100
            value: 25
            stepSize: 5
            snapMode: Slider.SnapAlways

            onValueChanged: {
                console.info("slider value:" + value)
            }
        }

        // 垂直滑块
        Slider {
            from: 1
            to: 100
            value: 25
            orientation: Qt.Vertical
        }

        // 范围滑块
        RangeSlider {
            from: 1
            to: 100
            first.value: 25
            second.value: 75

            first.onValueChanged: {
                console.info("first.value changed to:" + first.value)
            }

            second.onValueChanged: {
                console.info("second.value changed to:" + second.value)
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
