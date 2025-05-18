
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    property alias fileDialog: fileDialog
    property alias browseBttn: browseBttn
    property alias appliqueBttn: appliqueBttn
    property alias pathTxt: pathTxt
    width: 700
    height: 200

    Button {
        id: appliqueBttn
        x: 236
        y: 135
        width: 196
        height: 47
        text: "Appliquer"
        font.pointSize: 15
        font.bold: true
        palette.buttonText: hovered ? "grey" : "white"
        background: Rectangle {
            color: "#6b6b6b"
            radius: 10
        }
    }

    Label {
        id: label
        x: 210
        y: 14
        width: 280
        height: 37
        text: qsTr("Paramètres de sauvegarde")
        font.bold: true
        font.pointSize: 17
    }

    Label {
        id: label1
        x: 16
        y: 82
        text: qsTr("Chemin vers CSV")
        font.pointSize: 14
    }

    TextField {
        id: pathTxt
        x: 170
        y: 85
        width: 453
        height: 24
        font.pixelSize: 14
    }

    Button {
        id: browseBttn
        x: 644
        y: 79
        width: 38
        height: 33
        text: "..."
        font.pointSize: 11
        font.bold: true
        palette.buttonText: hovered ? "grey" : "white"
        background: Rectangle {
            color: "#6b6b6b"
            radius: 10
        }
    }

    FileDialog {
        id: fileDialog
        title: "Select CSV File"
        nameFilters: ["CSV files (*.csv)", "All files (*)"]
        fileMode: FileDialog.OpenFile
    }
}
