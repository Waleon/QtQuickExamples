import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4

// Qt Quick Controls 2 中的一系列控件示例
ApplicationWindow  {
    id: rootWindow
    title: "QML Examples"
    width: 800
    height: 600
    visible: true

    // 页眉
    header: ToolBar {
        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                icon.name: "back"
                onClicked: {
                    if (stackView.depth > 1) {
                        stackView.pop()
                        listView.currentIndex = -1
                    }
                }
            }

            Label {
                id: titleLabel
                text: listView.currentItem ? listView.currentItem.text : ""
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                text: "menu"
                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Settings"
                        onTriggered: settingsDialog.open()
                    }
                    MenuItem {
                        text: "About"
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }

    SettingsDialog {
        id: settingsDialog
        x: parent ? ((parent.width - width) / 2) : 0
        y: parent ? ((parent.height - height) / 2) : 0
    }

    AboutDialog {
        id: aboutDialog
        x: parent ? ((parent.width - width) / 2) : 0
        y: parent ? ((parent.height - height) / 2) : 0
    }

    RowLayout {
        anchors.fill: parent

        ListView {
            id: listView
            Layout.preferredWidth: 150
            Layout.fillHeight: true
            focus: true
            currentIndex: -1

            model: ListModel {
                ListElement { title: "Label"; source: "qrc:/qml/qml/MyLabel.qml" }
                // 按钮
                ListElement { title: "Button"; source: "qrc:/qml/qml/MyButton.qml" }
                ListElement { title: "RoundButton"; source: "qrc:/qml/qml/MyRoundButton.qml" }
                ListElement { title: "CheckBox"; source: "qrc:/qml/qml/MyCheckBox.qml" }
                ListElement { title: "RadioButton"; source: "qrc:/qml/qml/MyRadioButton.qml" }
                ListElement { title: "Switch"; source: "qrc:/qml/qml/MySwitch.qml" }
                ListElement { title: "DelayButton"; source: "qrc:/qml/qml/MyDelayButton.qml" }
                // 弹出控件
                ListElement { title: "ToolTip"; source: "qrc:/qml/qml/MyToolTip.qml" }
                ListElement { title: "Drawer"; source: "qrc:/qml/qml/MyDrawer.qml" }
                ListElement { title: "Menu"; source: "qrc:/qml/qml/MyMenu.qml" }
                ListElement { title: "Dialog"; source: "qrc:/qml/qml/MyDialog.qml" }
                // 分割器
                ListElement { title: "Separator"; source: "qrc:/qml/qml/MySeparator.qml" }
                // 导航控件
                ListElement { title: "SwipeView"; source: "qrc:/qml/qml/MySwipeView.qml" }
                ListElement { title: "StackView"; source: "qrc:/qml/qml/MyStackView.qml" }
                // 容器
                ListElement { title: "ScrollView"; source: "qrc:/qml/qml/MyScrollView.qml" }
                ListElement { title: "GroupBox"; source: "qrc:/qml/qml/MyGroupBox.qml" }
                ListElement { title: "TabBar"; source: "qrc:/qml/qml/MyTabBar.qml" }
                ListElement { title: "ToolBar"; source: "qrc:/qml/qml/MyToolBar.qml" }
                // 指示器
                ListElement { title: "BusyIndicator"; source: "qrc:/qml/qml/MyBusyIndicator.qml" }
                ListElement { title: "ProgressBar"; source: "qrc:/qml/qml/MyProgressBar.qml" }
                // 输入控件
                ListElement { title: "ComboBox"; source: "qrc:/qml/qml/MyComboBox.qml" }
                ListElement { title: "Slider"; source: "qrc:/qml/qml/MySlider.qml" }
                ListElement { title: "TextField"; source: "qrc:/qml/qml/MyTextField.qml" }
                ListElement { title: "TextArea"; source: "qrc:/qml/qml/MyTextArea.qml" }
                ListElement { title: "Tumbler"; source: "qrc:/qml/qml/MyTumbler.qml" }
            }

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                }
            }

            onCurrentIndexChanged: {
                var item = model.get(currentIndex)
                if (item)
                    stackView.push(item.source)
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        // 在实例化后触发
        Component.onCompleted: {
            listView.currentIndex = 0
        }
    }
}
