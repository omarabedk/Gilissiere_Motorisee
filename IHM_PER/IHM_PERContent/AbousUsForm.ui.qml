

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Rectangle {
    width: 300
    height: 150

    Label {
        id: label
        x: 76
        y: 12
        text: qsTr("A propos de nous")
        font.pointSize: 13
    }

    Label {
        id: label1
        x: 15
        y: 62
        width: 271
        height: 71
        text: "Voici un projet réalisé par ABDEL KADER Omar \net MARCHADOUR Eugène pour un module \nintitulé « Projet Éco-Responsable » à l'ENIB."
        font.pointSize: 10
    }
}
