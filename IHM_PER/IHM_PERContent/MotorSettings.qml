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
            // Update TextField values with the latest from graphController
            motorSettingsForm.vitessemotInput.text = graphController.getVitesse().toFixed(2)
            motorSettingsForm.courantInput.text = graphController.getCourant().toFixed(2)
            motorSettingsForm.wpInput.text = graphController.getWp().toFixed(2)
        }
    }

    Component.onCompleted: {
        // Initialize GraphController with default values
        graphController.setVitesse(parseFloat(motorSettingsForm.vitessemotInput.text) || 0)
        graphController.setCourant(parseFloat(motorSettingsForm.courantInput.text) || 0)
        graphController.setWp(parseFloat(motorSettingsForm.wpInput.text) || 0)
    }
}
