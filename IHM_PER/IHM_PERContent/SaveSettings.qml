import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Dialogs

Window {
    width: 700
    height: 200
    visible: true
    title: "Save Settings"

    SaveSettingsForm {
        id: saveSettingsForm

        Component.onCompleted: {
            console.log("SaveSettingsForm loaded, SaveCSV available:", SaveCSV);
        }

        browseBttn.onClicked: {
            console.log("Browse button clicked, opening FileDialog");
            fileDialog.open();
        }

        FileDialog {
            id: fileDialog
            title: "Select CSV File"
            nameFilters: ["CSV files (*.csv)"]
            fileMode: FileDialog.OpenFile
            onAccepted: {
                if (selectedFiles.length > 0) {
                    var filePath = selectedFiles[0];
                    saveSettingsForm.pathTxt.text = filePath.toString().replace(/^file:\/\//, "");
                    console.log("File selected, path set to:", saveSettingsForm.pathTxt.text);
                }
            }
        }

        Connections {
            target: saveSettingsForm.appliqueBttn
            function onClicked() {
                var path = saveSettingsForm.pathTxt.text;
                console.log("Applique button clicked with path:", path);

                if (path && path.toLowerCase().endsWith(".csv")) {
                    SaveCSV.apply_button_clicked(path);
                    successDialog.text = "Path applied: " + path;
                    successDialog.open();
                } else {
                    errorDialog.text = "Please enter a valid CSV file path (must end with .csv)";
                    errorDialog.open();
                }
            }
        }
    }

    Dialog {
        id: successDialog
        title: "Confirmation"
        // Position dialog, e.g., 100 pixels from top-left of the window
        x: 100
        y: 50
        property alias text: successLabel.text
        standardButtons: Dialog.Ok

        Label {
            id: successLabel
            text: ""
        }
    }

    Dialog {
        id: errorDialog
        title: "Invalid Path"
        // Position dialog, e.g., 100 pixels from top-left of the window
        x: 100
        y: 50
        property alias text: errorLabel.text
        standardButtons: Dialog.Ok

        Label {
            id: errorLabel
            text: ""
        }
    }
}
