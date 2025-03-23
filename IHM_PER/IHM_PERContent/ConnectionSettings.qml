import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 400
    height: 300
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    title: "Connection Settings"

    ConnectionSettingsForm {
        button.onClicked: console.log("Button Pressed")
    }
}


