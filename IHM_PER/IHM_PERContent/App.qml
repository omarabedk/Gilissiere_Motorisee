import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import IHM_PER_Design

Window {
    width: mainScreen.width
    height: mainScreen.height

    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height

    // Remove the resize handle from the window
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    visible: true
    title: "IHM_PER"

    Screen01 {
            id: mainScreen
        }


    Connections {
        target: mainScreen.menuBttn
        onClicked: {
            if (mainScreen.sideMenu.x !== 0) {
                mainScreen.sideMenu.x = 0
                mainScreen.sideMenu.opacity = 1
            }
        }
    }

    Connections {
        target: mainScreen.backMenuBttn
        onClicked: {
            if (mainScreen.sideMenu.x === 0) {
                mainScreen.sideMenu.x = -mainScreen.sideMenu.width
                mainScreen.sideMenu.opacity = 0
            }
        }
    }
}
