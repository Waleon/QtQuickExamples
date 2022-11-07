import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

// 弹出对话框
Rectangle {
    id: dialogWindow

    Button {
        id: informationButton
        anchors.centerIn: parent
        text: qsTr("Information")

        onClicked: {
            informationDialog.open()
        }
    }

    Button {
        id: questionButton
        anchors.top: informationButton.bottom
        anchors.left: informationButton.left
        anchors.topMargin: 10
        text: qsTr("Question")

        onClicked: {
            questionDialog.open()
        }
    }

    Button {
        id: customButton
        anchors.top: questionButton.bottom
        anchors.left: questionButton.left
        anchors.topMargin: 10
        text: qsTr("Custom")

        onClicked: {
            customDialog.open()
        }
    }

    // 消息对话框
    Dialog {
        id: informationDialog
        title: "Information"
        width: 400
        height: 200
        standardButtons: Dialog.Ok
        visible: false

        Label {
            text: "This is a information dialog"
        }

        onAccepted: console.info("Ok clicked")
    }

    // 询问对话框
    Dialog {
        id: questionDialog
        title: "Question"
        width: 400
        height: 200
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        visible: false
        // 仅在手动关闭时才会关闭
        closePolicy: Popup.NoAutoClose

        Label {
            text: "Are you sure you want to exit the program?"
        }

        onAccepted: console.info("Ok clicked")
        onRejected: console.info("Cancel clicked")
    }

    // 自定义对话框
    Dialog {
        id: customDialog
        width: 400
        height: 200
        modal: true
        visible: false
        // 居中显示
        x: parent ? ((parent.width - width) / 2) : 0
        y: parent ? ((parent.height - height) / 2) : 0
        // 按 Esc 键或者点击对话框外时均可关闭
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        // 页眉
        header: Label {
            text: "Hamlets in Haze"
            font.pointSize: 14
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment : Text.AlignVCenter
        }

        // 内容
        contentItem: RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Item {
                Layout.fillWidth: true
            }
            Image {
                sourceSize.width: 80
                sourceSize.height: 80
                source: "qrc:/images/images/logo.jpg"
            }
            Label {
                Layout.preferredWidth: 260
                wrapMode: Text.WordWrap
                text: "One, two and three miles to go; Four or five hamlets in haze. Six, seven arbors or so; Eight, nine and ten budding sprays."
            }
            Item {
                Layout.fillWidth: true
            }
        }

        // 页脚
        footer: Button {
            text: "Ok"
            onClicked: customDialog.accept()
        }
    }
}
