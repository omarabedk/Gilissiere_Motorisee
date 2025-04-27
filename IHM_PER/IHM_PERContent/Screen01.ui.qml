

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

Rectangle {
    property alias menuBttn: menuBttn
    property alias sideMenu: sideMenu
    property alias backMenuBttn: backMenuBttn

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
        font.pointSize: 22
        background: Rectangle {
            id: resetGraphBttnBackground // Give the background an ID
            radius: 20
            color: "white" // Default color
        }

        MouseArea {
            anchors.fill: parent
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            hoverEnabled: true // Enable hover support for the MouseArea
            acceptedButtons: Qt.NoButton
            onEntered: resetGraphBttnBackground.color = "grey" // Change color on hover
            onExited: resetGraphBttnBackground.color = "white" // Reset color on exit
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
        hoverEnabled: true // Enable hover support for the button

        background: Rectangle {
            id: menuBttnBackground // Give the background an ID
            radius: 20
            color: "white" // Default color
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true // Enable hover support for the MouseArea
            acceptedButtons: Qt.NoButton
            onEntered: menuBttnBackground.color = "grey" // Change color on hover
            onExited: menuBttnBackground.color = "white" // Reset color on exit
        }
    }

    Button {
        id: startBttn
        x: 419
        y: 133
        width: 299
        height: 63
        text: qsTr("Commencer/Arreter")
        font.bold: true
        font.pointSize: 22
        background: Rectangle {
            id: startBttnBackground // Give the background an ID
            radius: 20
            color: "white" // Default color
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true // Enable hover support for the MouseArea
            acceptedButtons: Qt.NoButton
            onEntered: startBttnBackground.color = "grey" // Change color on hover
            onExited: startBttnBackground.color = "white" // Reset color on exit
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
                text: "Retour"
                height: 200
                font.pointSize: 12
                Layout.fillWidth: true
                padding: 20
                background: Rectangle {
                    id: backMenuBttnBackground // Give the background an ID
                    radius: 10
                    color: "white" // Default color
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true // Enable hover support for the MouseArea
                    acceptedButtons: Qt.NoButton
                    onEntered: backMenuBttnBackground.color = "grey" // Change color on hover
                    onExited: backMenuBttnBackground.color = "white" // Reset color on exit
                }
            }
            Button {
                id: connectSettBttn
                text: "Paramètres de connexion"
                font.pointSize: 12
                Layout.fillWidth: true
                padding: 20
                background: Rectangle {
                    id: connectSettBttnBackground // Give the background an ID
                    radius: 10
                    color: "white" // Default color
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true // Enable hover support for the MouseArea
                    acceptedButtons: Qt.NoButton
                    onEntered: connectSettBttnBackground.color = "grey" // Change color on hover
                    onExited: connectSettBttnBackground.color = "white" // Reset color on exit
                }
            }
            Button {
                id: motorSettBttn
                text: "Paramètres du moteur"
                font.pointSize: 12
                Layout.fillWidth: true
                padding: 20
                background: Rectangle {
                    id: motorSettBttnBackground // Give the background an ID
                    radius: 10
                    color: "white" // Default color
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true // Enable hover support for the MouseArea
                    acceptedButtons: Qt.NoButton
                    onEntered: motorSettBttnBackground.color = "grey" // Change color on hover
                    onExited: motorSettBttnBackground.color = "white" // Reset color on exit
                }
            }
            Button {
                id: saveSettBttn
                text: "Paramètres du sauvegarde"
                font.pointSize: 12
                Layout.fillWidth: true
                padding: 20
                background: Rectangle {
                    id: saveSettBttnBackground // Give the background an ID
                    radius: 10
                    color: "white" // Default color
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true // Enable hover support for the MouseArea
                    acceptedButtons: Qt.NoButton
                    onEntered: saveSettBttnBackground.color = "grey" // Change color on hover
                    onExited: saveSettBttnBackground.color = "white" // Reset color on exit
                }
            }
            Button {
                id: aboutUsSett
                text: "A propos de nous"
                font.pointSize: 12
                Layout.fillWidth: true
                padding: 20
                background: Rectangle {
                    id: aboutUsSettBackground // Give the background an ID
                    radius: 10
                    color: "white" // Default color
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true // Enable hover support for the MouseArea
                    acceptedButtons: Qt.NoButton
                    onEntered: aboutUsSettBackground.color = "grey" // Change color on hover
                    onExited: aboutUsSettBackground.color = "white" // Reset color on exit
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

    Connections {
        target: connectSettBttn

        property var connectionSettingsWindow

        // Track the window instance
        function onClicked() {
            if (!connectionSettingsWindow) {
                // Check if already open
                var component = Qt.createComponent("ConnectionSettings.qml")
                if (component.status === Component.Ready) {
                    connectionSettingsWindow = component.createObject(parent)
                    connectionSettingsWindow.show()

                    // Handle window closing
                    connectionSettingsWindow.closing.connect(function () {
                        connectionSettingsWindow.destroy()
                        connectionSettingsWindow = null // Reset reference when closed
                    })
                } else {
                    console.log("Erreur de chargement du ConnectionSettings.qml")
                }
            } else {
                // Bring the existing window to the front
                connectionSettingsWindow.requestActivate()
            }
        }
    }

    Connections {
        target: motorSettBttn

        property var motorSettingsWindow

        // Track the window instance
        function onClicked() {
            if (!motorSettingsWindow) {
                // Check if already open
                var component = Qt.createComponent("MotorSettings.qml")
                if (component.status === Component.Ready) {
                    motorSettingsWindow = component.createObject(parent)
                    motorSettingsWindow.show()

                    // Handle window closing
                    motorSettingsWindow.closing.connect(function () {
                        motorSettingsWindow.destroy()
                        motorSettingsWindow = null // Reset reference when closed
                    })
                } else {
                    console.log("Erreur de chargement du MotorSettings.qml")
                }
            } else {
                // Bring the existing window to the front
                motorSettingsWindow.requestActivate()
            }
        }
    }

    Connections {
        target: saveSettBttn

        property var saveSettingsWindow

        // Track the window instance
        function onClicked() {
            if (!saveSettingsWindow) {
                // Check if already open
                var component = Qt.createComponent("SaveSettings.qml")
                if (component.status === Component.Ready) {
                    saveSettingsWindow = component.createObject(parent)
                    saveSettingsWindow.show()

                    // Handle window closing
                    saveSettingsWindow.closing.connect(function () {
                        saveSettingsWindow.destroy()
                        saveSettingsWindow = null // Reset reference when closed
                    })
                } else {
                    console.log("Erreur de chargement du SaveSettings.qml")
                }
            } else {
                // Bring the existing window to the front
                saveSettingsWindow.requestActivate()
            }
        }
    }

    Connections {
        target: aboutUsSett

        property var aboutUsWindow

        // Track the window instance
        function onClicked() {
            if (!aboutUsWindow) {
                // Check if already open
                var component = Qt.createComponent("AboutUs.qml")
                if (component.status === Component.Ready) {
                    aboutUsWindow = component.createObject(parent)
                    aboutUsWindow.show()

                    // Handle window closing
                    aboutUsWindow.closing.connect(function () {
                        aboutUsWindow.destroy()
                        aboutUsWindow = null // Reset reference when closed
                    })
                } else {
                    console.log("Erreur de chargement du AboutUs.qml")
                }
            } else {
                // Bring the existing window to the front
                aboutUsWindow.requestActivate()
            }
        }
    }
}
