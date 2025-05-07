
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import IHM_PER_Data
import IHM_PER_Design
import QtQuick.Timeline 1.0
import QtCharts 2.9

Rectangle {
    property alias menuBttn: menuBttn
    property alias sideMenu: sideMenu
    property alias backMenuBttn: backMenuBttn
    property alias connectSettBttn: connectSettBttn
    property alias motorSettBttn: motorSettBttn
    property alias saveSettBttn: saveSettBttn
    property alias aboutUsSett: aboutUsSett
    property alias startBttn: startBttn
    property alias resetGraphBttn: resetGraphBttn
    property alias startBttnBackground: startBttnBackground

    id: mainPage
    width: 1550
    height: Constants.height
    opacity: 1
    visible: true
    color: "#292929"
    antialiasing: false

    // Connection status indicator
    Rectangle {
        id: connectionIndicator
        x: 1349
        y: 157
        width: 20
        height: 20
        radius: 10
        color: connectionHandler.is_connected ? "green" : "red"
        border.width: 1
        border.color: "black"
    }

    Text {
        id: _text
        x: 561
        y: 38
        color: "#ffffff"
        text: qsTr("IHM Glissière ModBus TCP ")
        font.pixelSize: 36
    }

    Text {
        x: 1357
        y: 151
        width: 137
        height: 27
        color: "#ffffff"
        text: connectionHandler.is_connected ? qsTr("Connecté") : qsTr(
                                                   "Pas Connecté")
        font.pointSize: 15
        anchors.verticalCenterOffset: -373
        anchors.horizontalCenterOffset: 669
        anchors.centerIn: parent
        font.family: Constants.font.family
    }

    Button {
        id: resetGraphBttn
        x: 799
        y: 133
        width: 378
        height: 63
        text: qsTr("Réinitialisation des graphs")
        font.bold: true
        font.pointSize: 20
        background: Rectangle {
            id: resetGraphBttnBackground
            radius: 20
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            onEntered: resetGraphBttnBackground.color = "grey"
            onExited: resetGraphBttnBackground.color = "white"
        }
    }

    Button {
        id: menuBttn
        x: 29
        y: 133
        width: 75
        height: 75
        icon.width: 29
        icon.source: "Ressources/MenuBttn.png"
        icon.cache: true
        font.pointSize: 15
        hoverEnabled: true

        background: Rectangle {
            id: menuBttnBackground
            radius: 20
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            onEntered: menuBttnBackground.color = "grey"
            onExited: menuBttnBackground.color = "white"
        }
    }

    Button {
        id: startBttn
        x: 419
        y: 133
        width: 299
        height: 63
        text: qsTr("Commencer")
        font.bold: true
        font.pointSize: 20
        background: Rectangle {
            id: startBttnBackground
            radius: 20
            color: "#5ee65e"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
        }
    }

    Rectangle {
        id: sideMenu
        width: 300
        height: 950
        color: "#ffffff"
        x: -width
        opacity: 0
        radius: 20

        Behavior on x {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }
        y: 130
        Behavior on opacity {
            NumberAnimation {
                duration: 300
            }
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 0
            z: 0
            scale: 1
            layoutDirection: Qt.LeftToRight

            Button {
                id: backMenuBttn
                Image {
                    id: backIcon
                    source: "Ressources/retour.png"
                    anchors.centerIn: parent
                    width: 60
                    height: 60
                    fillMode: Image.PreserveAspectFit
                }
                Layout.preferredHeight: 60
                font.pointSize: 12
                Layout.fillWidth: true
                background: Rectangle {
                    id: backMenuBttnBackground
                    radius: 10
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.NoButton
                    onEntered: backMenuBttnBackground.color = "grey"
                    onExited: backMenuBttnBackground.color = "white"
                }
            }
            Button {
                id: connectSettBttn
                Layout.preferredHeight: 60
                text: "Paramètres de connexion"
                font.pointSize: 14
                Layout.fillWidth: true
                background: Rectangle {
                    id: connectSettBttnBackground
                    radius: 10
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.NoButton
                    onEntered: connectSettBttnBackground.color = "grey"
                    onExited: connectSettBttnBackground.color = "white"
                }
            }
            Button {
                id: motorSettBttn
                Layout.preferredHeight: 60
                text: "Paramètres du moteur"
                font.pointSize: 14
                Layout.fillWidth: true
                background: Rectangle {
                    id: motorSettBttnBackground
                    radius: 10
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.NoButton
                    onEntered: motorSettBttnBackground.color = "grey"
                    onExited: motorSettBttnBackground.color = "white"
                }
            }
            Button {
                id: saveSettBttn
                Layout.preferredHeight: 60
                text: "Paramètres du sauvegarde"
                font.pointSize: 14
                Layout.fillWidth: true
                background: Rectangle {
                    id: saveSettBttnBackground
                    radius: 10
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.NoButton
                    onEntered: saveSettBttnBackground.color = "grey"
                    onExited: saveSettBttnBackground.color = "white"
                }
            }
            Button {
                id: aboutUsSett
                Layout.preferredHeight: 60
                text: "A propos de nous"
                font.pointSize: 14
                Layout.fillWidth: true
                background: Rectangle {
                    id: aboutUsSettBackground
                    radius: 10
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.NoButton
                    onEntered: aboutUsSettBackground.color = "grey"
                    onExited: aboutUsSettBackground.color = "white"
                }
            }
            Text {
                padding: 150
                x: 1357
                y: 151
                width: 137
                height: 27
                color: "#ffffff"
            }
        }
    }
}
