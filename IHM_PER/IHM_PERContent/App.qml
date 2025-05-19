import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import IHM_PER_Design
import QtCharts 2.15

Window {
    width: 1550
    height: 950
    minimumWidth: 1550
    minimumHeight: 950

    visible: true
    title: "IHM_PER"

    // Properties to store the frozen x-axis range
    property real frozenXAxisMin: 0
    property real frozenXAxisMax: 10



    Screen01 {
        id: mainScreen


        ChartView {
            id: chartView
            x: 19
            y: 250
            width: 1502
            height: 587
            titleColor: "#a6a6b4"
            antialiasing: true
            backgroundColor: "#c1baba"
            legend.visible: true
            z: 10

            ValuesAxis {
                id: xAxis
                min: graphController.running ? Math.max(0, (graphController.time || 0) - 10) : frozenXAxisMin
                max: graphController.running ? (graphController.time || 10) : frozenXAxisMax
                titleText: "Temps (s)"
                labelsVisible: true
                gridVisible: true
            }

            ValuesAxis {
                id: yAxis
                min: -100  // Initial min to allow negative values
                max: 100   // Initial max
                titleText: "Valeurs"
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
                style: Qt.DashLine // Dotted line
            }

            LineSeries {
                id: negWpSeries
                axisX: xAxis
                axisY: yAxis
                name: "-WP (tr/min)"
                color: "green"
                width: 2
                pointsVisible: true
                style: Qt.DashLine // Dotted line
            }
        }
    }

    // Update frozen x-axis range when running state changes
    Connections {
        target: graphController
        function onRunningChanged() {
            if (!graphController.running) {
                // Store the current x-axis range when stopping
                frozenXAxisMin = Math.max(0, (graphController.time || 0) - 10)
                frozenXAxisMax = graphController.time || 10
                console.log("Graph stopped, xAxis frozen: min =", frozenXAxisMin, ", max =", frozenXAxisMax)
            }
        }
    }

    // Reset x-axis and y-axis on graph reset
    Connections {
        target: graphController
        function onResetOccurred() {
            console.log("Reset occurred, resetting axes")
            frozenXAxisMin = 0
            frozenXAxisMax = 10
            yAxis.min = -100
            yAxis.max = 100
            chartView.update()
        }
    }

    Connections {
        target: graphController
        function onDataUpdated() {
            // Always update series on reset, otherwise only when running
            if (graphController.running) {
                console.log("Data updated in QML, updating series")
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

                var negWpPoints = graphController.getNegWpPoints()
                negWpSeries.clear()
                for (i = 0; i < negWpPoints.length; i++) {
                    negWpSeries.append(negWpPoints[i].x, negWpPoints[i].y)
                }
                console.log("NegWp points:", negWpPoints.length)

                // Adjust yAxis min and max dynamically
                var minValue = -100
                var maxValue = 100
                if (vitessePoints.length > 0) {
                    var vitesseMin = Math.min(...vitessePoints.map(p => p.y))
                    var vitesseMax = Math.max(...vitessePoints.map(p => p.y))
                    minValue = Math.min(minValue, vitesseMin)
                    maxValue = Math.max(maxValue, vitesseMax)
                }
                if (courantPoints.length > 0) {
                    var courantMin = Math.min(...courantPoints.map(p => p.y))
                    var courantMax = Math.max(...courantPoints.map(p => p.y))
                    minValue = Math.min(minValue, courantMin)
                    maxValue = Math.max(maxValue, courantMax)
                }
                if (wpPoints.length > 0) {
                    var wpMin = Math.min(...wpPoints.map(p => p.y))
                    var wpMax = Math.max(...wpPoints.map(p => p.y))
                    minValue = Math.min(minValue, wpMin)
                    maxValue = Math.max(maxValue, wpMax)
                }
                if (negWpPoints.length > 0) {
                    var negWpMin = Math.min(...negWpPoints.map(p => p.y))
                    var negWpMax = Math.max(...negWpPoints.map(p => p.y))
                    minValue = Math.min(minValue, negWpMin)
                    maxValue = Math.max(maxValue, negWpMax)
                }
                yAxis.min = minValue * 1.1
                yAxis.max = maxValue * 1.1
                console.log("yAxis.min set to:", yAxis.min, "yAxis.max set to:", yAxis.max)
                chartView.update()
            } else {
                console.log("Data updated in QML, but graph is stopped, checking for reset")
                // Update series only if triggered by reset
                var vitessePoints = graphController.getVitessePoints()
                if (vitessePoints.length <= 1 && vitessePoints[0]?.x === 0 && vitessePoints[0]?.y === 0) {
                    console.log("Reset detected, updating series")
                    vitesseSeries.clear()
                    for (var i = 0; i < vitessePoints.length; i++) {
                        vitesseSeries.append(vitessePoints[i].x, vitessePoints[i].y)
                    }

                    var courantPoints = graphController.getCourantPoints()
                    courantSeries.clear()
                    for (i = 0; i < courantPoints.length; i++) {
                        courantSeries.append(courantPoints[i].x, courantPoints[i].y)
                    }

                    var wpPoints = graphController.getWpPoints()
                    wpSeries.clear()
                    for (i = 0; i < wpPoints.length; i++) {
                        wpSeries.append(wpPoints[i].x, wpPoints[i].y)
                    }

                    var negWpPoints = graphController.getNegWpPoints()
                    negWpSeries.clear()
                    for (i = 0; i < negWpPoints.length; i++) {
                        negWpSeries.append(negWpPoints[i].x, negWpPoints[i].y)
                    }

                    // Reset yAxis min and max
                    yAxis.min = -100
                    yAxis.max = 100
                    chartView.update()
                    console.log("Series reset: Vitesse points:", vitessePoints.length, "Courant points:", courantPoints.length, "Wp points:", wpPoints.length, "NegWp points:", negWpPoints.length)
                } else {
                    console.log("No reset, skipping series update")
                }
            }
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
                chartView.x = 300
                chartView.width = 1221
                mainScreen.sideMenu.x = 0
                mainScreen.sideMenu.opacity = 1
            }
        }
    }

    Connections {
        target: mainScreen.backMenuBttn
        function onClicked() {
            if (mainScreen.sideMenu.x === 0) {
                chartView.x = 19
                chartView.width = 1490
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
            var path = SaveCSV.read_file("path.txt");
            if (path) {
                SaveCSV.apply_button_clicked(path);
                console.log("Path loaded from path.txt:", path);
            } else {
                console.log("Failed to read path.txt");
            }
            SaveCSV.toggle_pause()
            mainScreen.startBttn.text = graphController.running ? qsTr("Arrêter") : qsTr("Commencer")
            mainScreen.startBttnBackground.color = graphController.running ? "#ff6363" : "#5ee65e"
            console.log("Start button clicked, running:", graphController.running)
        }
    }

    Timer {
        interval: 1000 // 1 second
        running: true // Always run, even when graph is stopped
        repeat: true
        onTriggered: {
            let randomWp = ((Math.random() * 160) - 80).toFixed(2); // -80 to 80
            graphController.setWp(parseFloat(randomWp));
            let randomCourant = ((Math.random() * 160) - 80).toFixed(2); // -80 to 80
            graphController.setCourant(parseFloat(randomCourant));
            let randomVitesse = ((Math.random() * 160) - 80).toFixed(2); // -80 to 80
            graphController.setVitesse(parseFloat(randomVitesse));
        }
    }
}
