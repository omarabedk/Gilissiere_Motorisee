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
                console.log("Applique button clicked, calling SaveCSV.apply_button_clicked with path:", saveSettingsForm.pathTxt.text);
                SaveCSV.apply_button_clicked(saveSettingsForm.pathTxt.text);
            }
        }
    }
}
