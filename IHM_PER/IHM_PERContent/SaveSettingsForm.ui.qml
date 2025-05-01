

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Rectangle {

    //property alias button: button
    width: 700
    height: 200
    Button {
        id: appliqueBttn
        x: 236
        y: 135
        width: 196
        height: 47
        hoverEnabled: true // Enable hover effects

        // Text color (white)
        contentItem: Text {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 15
            font.bold: true
            color: button.hovered ? "grey" : "#white"
            text: "Appliquer"
        }

        // Background styling (with hover effect)
        background: Rectangle {
            id: appliqueBttnBackground
            radius: 10
            color: "#c1c1c1" // Hover turns grey, default is dark
        }
    }

    Label {
        id: label
        x: 210
        y: 14
        width: 280
        height: 37
        text: qsTr("Paramètres de sauvegarde")
        font.pointSize: 17
    }

    Label {
        id: label1
        x: 27
        y: 86
        text: qsTr("Chemin vers CSV")
        font.pointSize: 14
    }

    TextEdit {
        id: pathTxt
        x: 160
        y: 79
        width: 453
        height: 38
        font.pixelSize: 12
    }

    Button {
        id: browseBttn
        x: 644
        y: 79
        width: 38
        height: 33
        //text: qsTr("Appliquer")
        hoverEnabled: true // Enable hover effects

        // Text color (white)
        contentItem: Text {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 11
            font.bold: true
            color: button.hovered ? "grey" : "#white"
            text: "..."
        }

        // Background styling (with hover effect)
        background: Rectangle {
            id: browseBttnBackground
            radius: 10
            color: "#c1c1c1" // Hover turns grey, default is dark
        }
    }
}
