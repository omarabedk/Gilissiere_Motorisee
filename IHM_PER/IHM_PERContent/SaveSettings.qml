import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 700
    height: 200
    visible: true
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    title: "Save Settings"
    SaveSettingsForm{
    }
}
