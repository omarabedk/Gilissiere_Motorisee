

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Item {
    width: 400
    height: 300
    opacity: 1

    property alias button: button

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 400
        height: 300
        color: "#ffffff"

        Button {
            id: button
            x: 102
            y: 238
            width: 196
            height: 40
            text: qsTr("Connect")
        }

        Text {
            id: _text
            x: 111
            y: 15
            text: qsTr("Connection Settings")
            font.pixelSize: 20
        }

        Text {
            id: _text1
            x: 39
            y: 82
            width: 65
            height: 16
            text: qsTr("IP Address")
            font.pixelSize: 17
        }

        Text {
            id: _text2
            x: 39
            y: 128
            text: qsTr("Port")
            font.pixelSize: 17
        }

        Text {
            id: _text3
            x: 39
            y: 172
            text: qsTr("Server Settings")
            font.pixelSize: 17
        }

        TextEdit {
            id: textEdit
            x: 187
            y: 82
            width: 165
            height: 28
            text: qsTr("Text Edit")
            font.pixelSize: 12
            selectedTextColor: "#000000"
            selectionColor: "#ffffff"
        }

        TextEdit {
            id: textEdit1
            x: 187
            y: 126
            width: 165
            height: 28
            text: qsTr("Text Edit")
            font.pixelSize: 12
        }

        TextEdit {
            id: textEdit2
            x: 187
            y: 170
            width: 165
            height: 28
            text: qsTr("Text Edit")
            font.pixelSize: 12
        }
    }
}
