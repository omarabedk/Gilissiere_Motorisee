import os
import sys
from pathlib import Path

from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine

from autogen.settings import url, import_paths
from Connection import ConnectionHandler
from Graph import GraphController

if __name__ == '__main__':
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Create and expose connection handler to QML
    connection_handler = ConnectionHandler()
    engine.rootContext().setContextProperty("connectionHandler", connection_handler)

    # Create and expose graph controller to QML
    graph_controller = GraphController()
    engine.rootContext().setContextProperty("graphController", graph_controller)

    app_dir = Path(__file__).parent.parent
    engine.addImportPath(os.fspath(app_dir))
    for path in import_paths:
        engine.addImportPath(os.fspath(app_dir / path))

    engine.load(os.fspath(app_dir / url))
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())