import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: motorSettingsWindow
    visible: true
    width: 280
    height: 360

    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    title: "Motor Settings"

    MotorSettingsForm {
        id: motorSettingsForm
        anchors.fill: parent
    }

    Connections {
        target: graphController
        function onDataUpdated() {
            motorSettingsForm.vitessemotInput.text = graphController.getVitesse().toFixed(2)
            console.log("onDataUpdated VITESSE: ", graphController.getVitesse().toFixed(2))
            motorSettingsForm.courantInput.text = graphController.getCourant().toFixed(2)
            console.log("onDataUpdated COURANT: ", graphController.getCourant().toFixed(2))
            motorSettingsForm.wpInput.text = graphController.getWp().toFixed(2)
            console.log("onDataUpdated WP: ", graphController.getWp().toFixed(2))
        }
    }

    Component.onCompleted: {
        // Initialize TextField values with current graphController values
        motorSettingsForm.vitessemotInput.text = graphController.getVitesse().toFixed(2)
        motorSettingsForm.courantInput.text = graphController.getCourant().toFixed(2)
        motorSettingsForm.wpInput.text = graphController.getWp().toFixed(2)
    }
}
