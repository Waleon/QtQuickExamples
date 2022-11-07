import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 堆叠视图

/**
    给定 stack 为 [A, B, C]：
    - push([D, E, F]) => [A, B, C, D, E, F]  “push” C 和 F 之间的过渡动画
    - replace([D, E, F]) => [A, B, D, E, F]  “replace” C 和 F 之间的过渡动画
    - clear() 后紧接着 push([D, E, F]) => [D, E, F]  当 stack 为空时，push 时没有过渡动画。
**/
Rectangle {
    id: stackViewWindow

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillHeight: true
        }

        // 滑动视图（可横向滑动）
        StackView {
            id: stackView
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 300
            Layout.preferredHeight: 300
            initialItem: firstPage  // 默认初始项

            // 动画可以通过 pushEnter/pushExit、popEnter/popExit、replaceEnter/replaceExit 属性控制
//            pushEnter: Transition {
//                PropertyAnimation {
//                    property: "opacity"
//                    from: 0
//                    to:1
//                    duration: 200
//                }
//            }
//            pushExit: Transition {
//                PropertyAnimation {
//                    property: "opacity"
//                    from: 1
//                    to:0
//                    duration: 200
//                }
//            }
//            popEnter: Transition {
//                PropertyAnimation {
//                    property: "opacity"
//                    from: 0
//                    to:1
//                    duration: 200
//                }
//            }
//            popExit: Transition {
//                PropertyAnimation {
//                    property: "opacity"
//                    from: 1
//                    to:0
//                    duration: 200
//                }
//            }
        }

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
        Rectangle {
            id: fourthPage
            visible: false
            color: "Purple"
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter
            spacing: 10

            // push 将页面添加到顶部（类似于“前进”）
            Button {
                text: "Push"
                onClicked: {
                    var item = stackView.currentItem
                    if (item === firstPage) {
                        stackView.push(secondPage)
                    } else if (item === secondPage) {
                        stackView.push(thirdPage)
                    } else if (item === thirdPage) {
                        stackView.push(fourthPage)
                    }
                    // 输出深度
                    console.info("[Push] stack view depth:" + stackView.depth)
                }
            }

            // pop 删除顶部页面（类似于“返回”）
            Button {
                text: "Pop"
                onClicked: {
                    stackView.pop()
                    console.info("[Pop] stack view depth:" + stackView.depth)
                }
            }

            // 展开至指定项
            Button {
                text: "Unwind"
                onClicked: {
                    // 直接跳转至第二页，若要跳转至第一页，可使用 pop(null)
                    stackView.pop(secondPage)
                    console.info("[Unwind] stack view depth:" + stackView.depth)
                }
            }

            // 替换页面
            Button {
                text: "Replace"
                onClicked: {
                    // 将当前页替换为第四页
                    var item = stackView.currentItem
                    if (item !== fourthPage)
                        stackView.replace(item, fourthPage)
                    console.info("[Replace] stack view depth:" + stackView.depth)
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
