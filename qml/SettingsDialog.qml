import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import Qt.labs.settings 1.0

Dialog {
    Settings {
        id: settings
        property string style: "Default"
    }

    id: settingsDialog
    modal: true
    focus: true
    title: "Settings"
    width: 400
    height: 240

    standardButtons: Dialog.Ok | Dialog.Cancel

    onAccepted: {
        settings.style = styleBox.displayText
        settingsDialog.close()
    }
    onRejected: {
        styleBox.currentIndex = styleBox.styleIndex
        settingsDialog.close()
    }

    contentItem: ColumnLayout {
        id: settingsColumn
        spacing: 20

        RowLayout {
            spacing: 10

            Label {
                text: "Style:"
            }

            ComboBox {
                id: styleBox
                Layout.fillWidth: true

                property int styleIndex: -1
                model: availableStyles
                Component.onCompleted: {
                    styleIndex = find(settings.style, Qt.MatchFixedString)
                    if (styleIndex !== -1)
                        currentIndex = styleIndex
                }
            }
        }

        Label {
            text: "Restart required"
            color: "#e41e25"
            opacity: styleBox.currentIndex !== styleBox.styleIndex ? 1.0 : 0.0
            horizontalAlignment: Label.AlignHCenter
            verticalAlignment: Label.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
