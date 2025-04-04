

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
    id: mainPage
    width: 1550
    height: Constants.height
    opacity: 1
    visible: true
    color: "#292929"
    antialiasing: false

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
        text: qsTr("Connected")
        font.pointSize: 15
        anchors.verticalCenterOffset: -373
        anchors.horizontalCenterOffset: 669
        anchors.centerIn: parent
        font.family: Constants.font.family
    }

    Button {
        id: resetGraphBttn
        x: 847
        y: 133
        width: 185
        height: 63
        text: qsTr("Reset Graphs")
        font.bold: true
        font.pointSize: 15
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
        x: 461
        y: 133
        width: 185
        height: 63
        text: qsTr("Start")
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
                text: "Back"
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
                text: "Connection Settings"
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
                text: "Motor Settings"
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
                text: "Save Settings"
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
                text: "About Us"
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
                    console.log("Error loading ConnectionSettings.qml")
                }
            } else {
                // Bring the existing window to the front
                connectionSettingsWindow.requestActivate()
            }
        }
    }

    Connections {
        target: menuBttn
        onClicked: {


            /*if (sideMenu.x === 0) {
                sideMenu.x = -sideMenu.width
                sideMenu.opacity = 0
            }*/
            if (sideMenu.x !== 0) {
                sideMenu.x = 0
                sideMenu.opacity = 1
            }
        }
    }
    Connections {
        target: backMenuBttn
        onClicked: {
            if (sideMenu.x === 0) {
                sideMenu.x = -sideMenu.width
                sideMenu.opacity = 0
            }
        }
    }
    Connections {
        target: mainPage
        onClicked: {
            if (sideMenu.x === 0) {
                sideMenu.x = -sideMenu.width
                sideMenu.opacity = 0
            }
        }
    }
}
