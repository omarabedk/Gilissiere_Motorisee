import os
import sys
from pathlib import Path

from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QIcon

from autogen.settings import url, import_paths
from Connection import ConnectionHandler
from Graph import GraphController
from SaveCSV import SaveCSV

if __name__ == '__main__':
    app = QApplication(sys.argv)
    
    # Set application icon
    app_dir = Path(__file__).parent.parent
    icon_path = os.fspath(app_dir / "IHM_PERContent" / "Ressources" / "logo.png")
    
    icon = QIcon(icon_path)
    app.setWindowIcon(icon)
    
    engine = QQmlApplicationEngine()
    
    # Create and expose connection handler to QML
    connection_handler = ConnectionHandler()
    engine.rootContext().setContextProperty("connectionHandler", connection_handler)
    
    # Create and expose graph controller to QML
    graph_controller = GraphController()
    engine.rootContext().setContextProperty("graphController", graph_controller)

    # Create and expose SaveCSV controller to QML
    savecsv_controller = SaveCSV()
    engine.rootContext().setContextProperty("SaveCSV", savecsv_controller)

    # Connect vitesseReel updates to graph controller
    connection_handler.vitesseReelUpdated.connect(graph_controller.setVitesse)
    # Connect courantReel updates to graph controller
    connection_handler.courantReelUpdated.connect(graph_controller.setCourant)
    
    engine.addImportPath(os.fspath(app_dir))
    for path in import_paths:
        engine.addImportPath(os.fspath(app_dir / path))
    
    engine.load(os.fspath(app_dir / url))
    if not engine.rootObjects():
        sys.exit(-1)
    
    sys.exit(app.exec())