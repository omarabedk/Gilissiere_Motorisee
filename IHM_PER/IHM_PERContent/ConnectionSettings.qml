import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15

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

    Connections {
        target: connectionHandler
        function onConnectionStatusChanged(isConnected) {
            form.connectBttn.text = isConnected ? qsTr("Disconnect") : qsTr("Connect")
            form.buttonBackground.color = isConnected ? "green" : "grey"
        }

        function onErrorOccurred(message) {
            form.errorPopup.text = message
            form.errorPopup.open()
        }
    }

    Connections {
        target: form.connectBttn
        onClicked: {
            form.buttonBackground.color = "green"
            var ipParts = [form.ipAdd1Spinbx.value, form.ipAdd2Spinbx.value,
                           form.ipAdd3Spinbx.value, form.ipAdd4Spinbx.value]
            var portNumber = form.portSpinbx.value
            var serverAddressNumber = form.serverAddSpinbx.value
            connectionHandler.connect_button_clicked(ipParts, portNumber, serverAddressNumber)
        }
    }
}


