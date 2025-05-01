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

        browseBttn.onClicked: {
            fileDialog.open()
        }

        FileDialog {
            id: fileDialog
            title: "Select CSV File"
            nameFilters: ["CSV files (*.csv)"]
            fileMode: FileDialog.OpenFile
            onAccepted: {
                if (selectedFiles.length > 0) {
                    var filePath = selectedFiles[0]
                    saveSettingsForm.pathTxt.text = filePath.toString().replace(/^file:\/\//, "")
                }
            }
        }
    }
}
