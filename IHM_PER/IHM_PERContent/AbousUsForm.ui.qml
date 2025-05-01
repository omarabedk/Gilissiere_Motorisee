

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Rectangle {
    width: 390
    height: 150

    Label {
        id: label
        x: 108
        y: 8
        text: qsTr("A propos de nous")
        font.bold: true
        font.pointSize: 13
    }

    Label {
        id: label1
        x: 12
        y: 45
        width: 367
        height: 90
        text: "Voici un projet réalisé par ABDEL KADER Omar, \n MARCHADOUR Eugène et WAHBI Ahmed-Amine\n pour un module intitulé « Projet Éco-Responsable »\n à l'ENIB."
        font.pointSize: 12
    }
}
