import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 延迟按钮
Rectangle {
    id: delayButtonWindow

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillWidth: true
        }

        DelayButton {
            id:delaybutton
            text: "Delay Button"
            delay: 2000  // 进度达到 1.0 以及触发 activated() 信号所需的时间（单位：ms）

            onActivated: {
                delayButtonWindow.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                delaybutton.progress = 0.0  // 初始化进度为 0
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
