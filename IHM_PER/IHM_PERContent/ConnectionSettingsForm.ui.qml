

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Item {
    width: 470
    height: 300
    opacity: 1

    property alias button: button

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 470
        height: 300
        color: "#ffffff"

        Button {
            id: button
            x: 146
            y: 229
            width: 196
            height: 47
            text: qsTr("Connect")
            hoverEnabled: true // Enable hover effects

            // Text color (white)
            contentItem: Text {
                text: button.text
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
                color: button.hovered ? "grey" : "#white"
            }

            // Background styling (with hover effect)
            background: Rectangle {
                id: buttonBackground
                radius: 10
                color: "grey" // Hover turns grey, default is dark
            }
        }

        Text {
            id: _text
            x: 146
            y: 16
            text: qsTr("Connection Settings")
            font.pixelSize: 20
        }

        Text {
            id: _text1
            x: 32
            y: 82
            width: 65
            height: 16
            text: qsTr("IP Address")
            font.pixelSize: 17
        }

        Text {
            id: _text2
            x: 32
            y: 128
            text: qsTr("Port")
            font.pixelSize: 17
        }

        Text {
            id: _text3
            x: 32
            y: 172
            text: qsTr("Server Address")
            font.pixelSize: 17
        }

        SpinBox {
            id: spinBox1
            x: 156
            y: 172
            width: 109
            height: 32
            value: 1
        }

        Label {
            id: label
            x: 300
            y: 72
            text: qsTr(".")
            font.pointSize: 20
        }

        Label {
            id: label1
            x: 224
            y: 72
            text: qsTr(".")
            font.pointSize: 20
        }

        Label {
            id: label2
            x: 375
            y: 72
            text: qsTr(".")
            font.pointSize: 20
        }
    }

    SpinBox {
        id: spinBox
        x: 156
        y: 124
        width: 108
        height: 32
        value: 502
        to: 65535
        editable: true
    }

    SpinBox {
        id: spinBox2
        x: 156
        y: 78
        width: 65
        height: 32
        value: 192
        to: 255
        editable: true
    }

    SpinBox {
        id: spinBox3
        x: 232
        y: 78
        width: 65
        height: 32
        value: 162
        to: 255
        editable: true
    }

    SpinBox {
        id: spinBox4
        x: 308
        y: 78
        width: 65
        height: 32
        value: 1
        to: 255
        editable: true
    }

    SpinBox {
        id: spinBox5
        x: 383
        y: 78
        width: 65
        height: 32
        value: 2
        to: 255
        editable: true
    }
}
