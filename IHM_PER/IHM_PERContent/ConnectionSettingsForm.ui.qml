

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Rectangle {
    property alias connectBttn: connectBttn
    property alias buttonBackground: buttonBackground

    property alias ipAdd1Spinbx: ipAdd1Spinbx
    property alias ipAdd2Spinbx: ipAdd2Spinbx
    property alias ipAdd3Spinbx: ipAdd3Spinbx
    property alias ipAdd4Spinbx: ipAdd4Spinbx
    property alias portSpinbx: portSpinbx
    property alias serverAddSpinbx: serverAddSpinbx

    id: rectangle
    x: 0
    y: 0
    width: 470
    height: 300
    color: "#ffffff"

    Button {
        id: connectBttn
        x: 146
        y: 229
        width: 196
        height: 47

        hoverEnabled: true // Enable hover effects

        // Text color (white)
        contentItem: Text {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 15
            font.bold: true
            color: connectBttn.hovered ? "grey" : "white"
            text: connectionHandler.is_connected ? qsTr("Déconnexion") : qsTr(
                                                       "Connexion")
        }

        // Background styling (with hover effect)
        background: Rectangle {
            id: buttonBackground
            radius: 10
            color: connectionHandler.is_connected ? "red" : "green"
        }
    }

    Text {
        id: _text
        x: 146 //146
        y: 16
        text: qsTr("Paramètre du connexion")
        font.pixelSize: 20
        font.bold: true
    }

    Text {
        id: _text1
        x: 32
        y: 82
        width: 81
        height: 26
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
        id: serverAddSpinbx
        x: 156
        y: 170
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
    SpinBox {
        id: portSpinbx
        stepSize: 1
        x: 156
        y: 124
        width: 108
        height: 32
        value: 502
        to: 65535
        editable: true
    }

    SpinBox {
        id: ipAdd1Spinbx
        stepSize: 1
        x: 156
        y: 78
        width: 65
        height: 32
        value: 192
        from: 0
        to: 255
        editable: true
    }

    SpinBox {
        id: ipAdd2Spinbx
        stepSize: 1
        x: 232
        y: 78
        width: 65
        height: 32
        value: 168
        from: 0
        to: 255
        editable: true
    }

    SpinBox {
        id: ipAdd3Spinbx
        stepSize: 1
        x: 308
        y: 78
        width: 65
        height: 32
        value: 1
        from: 0
        to: 255
        editable: true
    }

    SpinBox {
        id: ipAdd4Spinbx
        stepSize: 1
        x: 383
        y: 78
        width: 65
        height: 32
        value: 2
        from: 0
        to: 255
        editable: true
    }

    Popup {
        id: errorPopup
        x: (parent.width - width) / 2 // Center horizontally
        y: (parent.height - height) / 2 // Center vertically
        width: 150
        height: 50
        modal: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        background: Rectangle {
            color: "#f0f0f0"
            border.color: "#000000"
            border.width: 1
            radius: 5
        }

        Label {
            id: errorLabel
            anchors.centerIn: parent // Center the label in the popup
            width: parent.width - 20 // Add padding
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Error"
        }

        property alias text: errorLabel.text
    }
}
