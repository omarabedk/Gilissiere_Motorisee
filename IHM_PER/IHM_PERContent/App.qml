import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import IHM_PER_Design
import QtCharts 2.15

Window {
    width: 1550
    height: 950
    minimumWidth: 1550
    maximumWidth: 1550
    minimumHeight: 950
    maximumHeight: 950
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    visible: true
    title: "IHM_PER"

    Screen01 {
        id: mainScreen

        ChartView {
            id: chartView
            x: 286
            y: 250
            width: 1235
            height: 600
            antialiasing: true
            backgroundColor: "#ffffff"
            legend.visible: true
            z: 10

            ValuesAxis {
                id: xAxis
                min: graphController.running ? Math.max(0, (graphController.time || 0) - 10) : 0
                max: graphController.running ? (graphController.time || 10) : 10
                titleText: "Time (s)"
                labelsVisible: true
                gridVisible: true
            }

            ValuesAxis {
                id: yAxis
                min: 0
                max: 100  // Initial max, will be adjusted dynamically
                titleText: "Value"
                labelsVisible: true
                gridVisible: true
            }

            LineSeries {
                id: vitesseSeries
                axisX: xAxis
                axisY: yAxis
                name: "Vitesse (tr/min)"
                color: "blue"
                width: 2
                pointsVisible: true
            }

            LineSeries {
                id: courantSeries
                axisX: xAxis
                axisY: yAxis
                name: "Courant (A)"
                color: "red"
                width: 2
                pointsVisible: true
            }

            LineSeries {
                id: wpSeries
                axisX: xAxis
                axisY: yAxis
                name: "WP (tr/min)"
                color: "green"
                width: 2
                pointsVisible: true
            }
        }
    }

    Connections {
        target: graphController
        function onDataUpdated() {
            console.log("Data updated in QML")
            // Update series data
            var vitessePoints = graphController.getVitessePoints()
            vitesseSeries.clear()
            for (var i = 0; i < vitessePoints.length; i++) {
                vitesseSeries.append(vitessePoints[i].x, vitessePoints[i].y)
            }
            console.log("Vitesse points:", vitessePoints.length)

            var courantPoints = graphController.getCourantPoints()
            courantSeries.clear()
            for (i = 0; i < courantPoints.length; i++) {
                courantSeries.append(courantPoints[i].x, courantPoints[i].y)
            }
            console.log("Courant points:", courantPoints.length)

            var wpPoints = graphController.getWpPoints()
            wpSeries.clear()
            for (i = 0; i < wpPoints.length; i++) {
                wpSeries.append(wpPoints[i].x, wpPoints[i].y)
            }
            console.log("Wp points:", wpPoints.length)

            // Adjust yAxis max dynamically
            var maxValue = 100
            if (vitessePoints.length > 0) {
                var vitesseMax = Math.max(...vitessePoints.map(p => p.y))
                maxValue = Math.max(maxValue, vitesseMax)
            }
            if (courantPoints.length > 0) {
                var courantMax = Math.max(...courantPoints.map(p => p.y))
                maxValue = Math.max(maxValue, courantMax)
            }
            if (wpPoints.length > 0) {
                var wpMax = Math.max(...wpPoints.map(p => p.y))
                maxValue = Math.max(maxValue, wpMax)
            }
            yAxis.max = maxValue * 1.1
            console.log("yAxis.max set to:", yAxis.max)
            chartView.update()
        }
    }

    Connections {
        target: mainScreen.connectSettBttn
        property var connectionSettingsWindow
        function onClicked() {
            if (!connectionSettingsWindow) {
                var component = Qt.createComponent("ConnectionSettings.qml")
                if (component.status === Component.Ready) {
                    connectionSettingsWindow = component.createObject(mainScreen)
                    connectionSettingsWindow.show()
                    connectionSettingsWindow.closing.connect(function () {
                        connectionSettingsWindow.destroy()
                        connectionSettingsWindow = null
                    })
                } else {
                    console.log("Erreur de chargement du ConnectionSettings.qml")
                }
            } else {
                connectionSettingsWindow.requestActivate()
            }
        }
    }

    Connections {
        target: mainScreen.motorSettBttn
        property var motorSettingsWindow
        function onClicked() {
            if (!motorSettingsWindow) {
                var component = Qt.createComponent("MotorSettings.qml")
                if (component.status === Component.Ready) {
                    motorSettingsWindow = component.createObject(mainScreen)
                    motorSettingsWindow.show()
                    motorSettingsWindow.closing.connect(function () {
                        motorSettingsWindow.destroy()
                        motorSettingsWindow = null
                    })
                } else {
                    console.log("Erreur de chargement du MotorSettings.qml")
                }
            } else {
                motorSettingsWindow.requestActivate()
            }
        }
    }

    Connections {
        target: mainScreen.saveSettBttn
        property var saveSettingsWindow
        function onClicked() {
            if (!saveSettingsWindow) {
                var component = Qt.createComponent("SaveSettings.qml")
                if (component.status === Component.Ready) {
                    saveSettingsWindow = component.createObject(mainScreen)
                    saveSettingsWindow.show()
                    saveSettingsWindow.closing.connect(function () {
                        saveSettingsWindow.destroy()
                        saveSettingsWindow = null
                    })
                } else {
                    console.log("Erreur de chargement du SaveSettings.qml")
                }
            } else {
                saveSettingsWindow.requestActivate()
            }
        }
    }

    Connections {
        target: mainScreen.aboutUsSett
        property var aboutUsWindow
        function onClicked() {
            if (!aboutUsWindow) {
                var component = Qt.createComponent("AboutUs.qml")
                if (component.status === Component.Ready) {
                    aboutUsWindow = component.createObject(mainScreen)
                    aboutUsWindow.show()
                    aboutUsWindow.closing.connect(function () {
                        aboutUsWindow.destroy()
                        aboutUsWindow = null
                    })
                } else {
                    console.log("Erreur de chargement du AboutUs.qml")
                }
            } else {
                aboutUsWindow.requestActivate()
            }
        }
    }

    Connections {
        target: mainScreen.menuBttn
        function onClicked() {
            if (mainScreen.sideMenu.x !== 0) {
                mainScreen.sideMenu.x = 0
                mainScreen.sideMenu.opacity = 1
            }
        }
    }

    Connections {
        target: mainScreen.backMenuBttn
        function onClicked() {
            if (mainScreen.sideMenu.x === 0) {
                mainScreen.sideMenu.x = -mainScreen.sideMenu.width
                mainScreen.sideMenu.opacity = 0
            }
        }
    }

    Connections {
        target: mainScreen.resetGraphBttn
        function onClicked() {
            graphController.reset_graph()
        }
    }

    Connections {
        target: mainScreen.startBttn
        function onClicked() {
            graphController.running = !graphController.running
            mainScreen.startBttn.text = graphController.running ? qsTr("Arrêter") : qsTr("Commencer")
            console.log("Start button clicked, running:", graphController.running)
        }
    }
    Timer {
            interval: 1000 // 1 second
            running: true
            repeat: true
            onTriggered: {
                let randomValue = (Math.random() * 100).toFixed(2);
                let randomCourant = (Math.random() * 30).toFixed(2);
                let randomWp = (Math.random() * 80).toFixed(2);
                graphController.setVitesse(parseFloat(randomValue));
                graphController.setCourant(parseFloat(randomCourant));
                graphController.setWp(parseFloat(randomWp));
            }
        }
}
