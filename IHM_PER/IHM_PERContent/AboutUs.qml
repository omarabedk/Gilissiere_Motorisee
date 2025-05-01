import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 390
    height: 150
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    title: "A propos de nous"

    AbousUsForm {
    }
}





