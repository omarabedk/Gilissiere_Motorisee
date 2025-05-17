import QtQuick
import QtQuick.Controls
import QtQuick.Window

Window {
    visible: true
    width: 470
    height: 300
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    title: "Connection Settings"

    ConnectionSettingsForm {
        id: form
    }

    Popup {
        id: errorPopup
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 300
        height: 150
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        z: 100

        background: Rectangle {
            color: "#f0f0f0"
            border.color: "#000000"
            border.width: 1
            radius: 5
        }

        Label {
            id: errorLabel
            anchors.centerIn: parent
            width: parent.width - 20
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Error"
        }

        property alias text: errorLabel.text
    }

    Connections {
        target: connectionHandler
        function onConnectionStatusChanged(isConnected) {
            form.connectBttn.text = isConnected ? qsTr("Déconnexion") : qsTr("Connexion")
            form.buttonBackground.color = isConnected ? "red" : "green"
        }

        function onErrorOccurred(message) {
            console.log("Error occurred: " + message)
            console.log("errorPopup exists: " + (errorPopup !== null))
            console.log("errorPopup visible before open: " + errorPopup.visible)
            errorPopup.text = message
            errorPopup.close() // Force close to reset state
            errorPopup.open()
            console.log("errorPopup visible after open: " + errorPopup.visible)
        }
    }

    Connections {
        target: form.connectBttn
        onClicked: {
            var ipParts = [form.ipAdd1Spinbx.value, form.ipAdd2Spinbx.value,
                           form.ipAdd3Spinbx.value, form.ipAdd4Spinbx.value]
            var portNumber = form.portSpinbx.value
            var serverAddressNumber = form.serverAddSpinbx.value
            connectionHandler.connect_button_clicked(ipParts, portNumber, serverAddressNumber)
        }
    }

    Component.onCompleted: {
        console.log("Window loaded, connectionHandler exists: " + (connectionHandler !== null))
    }
}
