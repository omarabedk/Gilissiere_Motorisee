from PySide6.QtCore import QObject, Slot, QTimer, Signal, QPointF, Property
from PySide6.QtCharts import QLineSeries, QChart, QValueAxis

class GraphController(QObject):
    seriesInitialized = Signal()  # Signal to indicate series are ready
    runningChanged = Signal()    # Signal for running state changes
    dataUpdated = Signal()       # Signal for data updates
    resetOccurred = Signal()     # Signal for graph reset
    xAxisRangeChanged = Signal() # Signal for x-axis range updates

    def __init__(self, parent=None):
        super().__init__(parent)
        
        # Initialize data series
        self._series1 = QLineSeries()
        self._series2 = QLineSeries()
        self._threshold = QLineSeries()
        self._negThreshold = QLineSeries()
        
        # Initialize data points
        self._max_points = 100  # Number of points to display
        self._time = 0
        self._series1.append(0, 0)
        self._series2.append(0, 0)
        self._wp = 50  # Initialize _wp to avoid undefined access
        self._threshold.append(0, self._wp)
        self._threshold.append(100, self._wp)
        self._negThreshold.append(0, -self._wp)
        self._negThreshold.append(100, -self._wp)

        self._points1 = []
        self._points2 = []
        
        # Motor settings
        self._running = False  # Graph update state
        self._x_axis_min = 0   # Track x-axis range
        self._x_axis_max = 10  # Initial range: 10 seconds

        # Emit signal to indicate series are ready
        self.seriesInitialized.emit()

        # Timer for real-time updates
        self._timer = QTimer(self)
        self._timer.timeout.connect(self.update_data)
        
    @Property(bool, notify=runningChanged)
    def running(self):
        return self._running

    @running.setter
    def running(self, value):
        if self._running != value:
            self._running = value
            if self._running:
                self._timer.start(100)  # Update every 100ms
                print("Graph started")
            else:
                self._timer.stop()
                print("Graph stopped")
            self.runningChanged.emit()

    @Property('QVariant', notify=dataUpdated)
    def series1(self):
        return self._series1

    @Property('QVariant', notify=dataUpdated)
    def series2(self):
        return self._series2

    @Property('QVariant', notify=dataUpdated)
    def threshold(self):
        return self._threshold

    @Property('QVariant', notify=dataUpdated)
    def negThreshold(self):
        return self._negThreshold

    @Property(float, notify=dataUpdated)
    def time(self):
        return self._time

    @Property(float, notify=xAxisRangeChanged)
    def xAxisMin(self):
        return self._x_axis_min

    @Property(float, notify=xAxisRangeChanged)
    def xAxisMax(self):
        return self._x_axis_max

    @Slot(result='QVariant')
    def getVitessePoints(self):
        points = self._series1.points()
        return [{"x": p.x(), "y": p.y()} for p in points]

    @Slot(result='QVariant')
    def getCourantPoints(self):
        points = self._series2.points()
        return [{"x": p.x(), "y": p.y()} for p in points]

    @Slot(result='QVariant')
    def getWpPoints(self):
        points = self._threshold.points()
        return [{"x": p.x(), "y": p.y()} for p in points]

    @Slot(result='QVariant')
    def getNegWpPoints(self):
        points = self._negThreshold.points()
        return [{"x": p.x(), "y": p.y()} for p in points]

    @Slot(float)
    def setVitesse(self, value):
        self._vitesse = value
        print(f"Vitesse set to: {value}")
        self.dataUpdated.emit()

    @Slot(float)
    def setCourant(self, value):
        self._courant = value
        print(f"Courant set to: {value}")
        self.dataUpdated.emit()

    @Slot(float)
    def setWp(self, value):
        self._wp = value
        if self._running:
            # Update threshold series
            self._threshold.clear()
            self._negThreshold.clear()
            if self._points1:
                x_start = self._points1[0].x()
                x_end = self._time
                self._threshold.append(x_start, self._wp)
                self._threshold.append(x_end, self._wp)
                self._negThreshold.append(x_start, -self._wp)
                self._negThreshold.append(x_end, -self._wp)
            else:
                self._threshold.append(0, self._wp)
                self._threshold.append(100, self._wp)
                self._negThreshold.append(0, -self._wp)
                self._negThreshold.append(100, -self._wp)
        self.dataUpdated.emit()
        print(f"Wp set to: {value}")

    @Slot(result=float)
    def getVitesse(self):
        return self._vitesse
    
    @Slot(result=float)
    def getCourant(self):
        return self._courant
    
    @Slot(result=float)
    def getWp(self):
        return self._wp

    def update_data(self):
        if not self._running:
            return

        self._time += 0.1
        # Use provided values
        value1 = self._vitesse
        value2 = self._courant

        self._points1.append(QPointF(self._time, value1))
        self._points2.append(QPointF(self._time, value2))

        if len(self._points1) > self._max_points:
            self._points1.pop(0)
            self._points2.pop(0)

        self._series1.replace(self._points1)
        self._series2.replace(self._points2)

        # Update x-axis range (show last 10 seconds)
        self._x_axis_min = max(0, self._time - 10)  # Window of 10 seconds
        self._x_axis_max = self._time
        self.xAxisRangeChanged.emit()

        # Update threshold lines to span the visible x-range
        self._threshold.clear()
        self._negThreshold.clear()
        x_start = self._x_axis_min
        x_end = self._x_axis_max
        self._threshold.append(x_start, self._wp)
        self._threshold.append(x_end, self._wp)
        self._negThreshold.append(x_start, -self._wp)
        self._negThreshold.append(x_end, -self._wp)

        self.dataUpdated.emit()
        print(f"Data updated: time={self._time:.1f}, x_range=[{x_start:.1f}, {x_end:.1f}], vitesse={value1}, courant={value2}, wp={self._wp}, threshold_points={self._threshold.points()}")

    @Slot()
    def reset_graph(self):
        """Reset the graph data."""
        self._time = 0
        self._x_axis_min = 0
        self._x_axis_max = 10
        self._series1.clear()
        self._series2.clear()
        self._series1.append(0, 0)
        self._series2.append(0, 0)
        self._threshold.clear()
        self._negThreshold.clear()
        self._threshold.append(0, self._wp)
        self._threshold.append(10, self._wp)
        self._negThreshold.append(0, -self._wp)
        self._negThreshold.append(10, -self._wp)
        self._points1 = []
        self._points2 = []
        self.dataUpdated.emit()
        self.xAxisRangeChanged.emit()
        self.resetOccurred.emit()
        print("Graph reset")