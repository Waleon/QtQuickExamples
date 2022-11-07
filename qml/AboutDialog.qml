import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4

Dialog {
    id: aboutDialog
    modal: true
    focus: true
    title: "About"
    width: 400
    height: 240
    contentHeight: aboutColumn.height

    // 内容
    ColumnLayout {
        id: aboutColumn
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            Layout.fillHeight: true
        }

        Image {
            Layout.alignment: Qt.AlignCenter
            sourceSize.width: 80
            sourceSize.height: 80
            source: "qrc:/images/images/logo.jpg"
        }

        Label {
            Layout.alignment: Qt.AlignCenter
            width: aboutDialog.availableWidth
            text: "QML Examples"
        }

        Label {
            Layout.alignment: Qt.AlignCenter
            text: "About me: <a href=\"https://waleon.blog.csdn.net\">Waleon blog</a>"
            onLinkActivated: {
                Qt.openUrlExternally(link)
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
