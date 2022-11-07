import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 滚轮
Rectangle {
    id: tumblerWindow

    function formatText(count, modelData) {
        // count 为 12 时，显示 01 ~ 12； count 为 60 时，显示 00 ~ 59
        var data = (count === 12 ? modelData + 1 : modelData);
        return data.toString().length < 2 ? "0" + data : data;
    }

    FontMetrics {
        id: fontMetrics
    }

    Component {
        id: delegateComponent

        Label {
            text: formatText(Tumbler.tumbler.count, modelData)

            // Tumbler.displacement 表示该项与当前项的距离，范围：[-visibleItemCount/2, visibleItemCount/2]。
            // 求绝对值，越往两边，绝对值越大，透明度越低
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            // 当前选中项字体变大
            font.pixelSize: Math.abs(Tumbler.displacement) === 0 ? fontMetrics.font.pixelSize * 1.5 : fontMetrics.font.pixelSize
            color: Math.abs(Tumbler.displacement) === 0 ? "green" : "black"
        }
    }

    Frame {
        id: frame
        padding: 0
        anchors.centerIn: parent

        RowLayout {
            id: row

            Tumbler {
                id: hoursTumbler
                model: 12
                delegate: delegateComponent
            }

            Tumbler {
                id: minutesTumbler
                model: 60
                delegate: delegateComponent
            }

            Tumbler {
                id: amPmTumbler
                model: ["AM", "PM"]
                delegate: delegateComponent

                // 索引改变后，输出选中项
                onCurrentIndexChanged: {
                    var items = amPmTumbler.model
                    console.info("amPm tumbler current item:" + items[currentIndex])
                }
            }
        }
    }
}
