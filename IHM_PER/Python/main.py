import os
import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from autogen.settings import url, import_paths
from Connection import ConnectionHandler  # Import our new handler

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine() #connection between python and QML project

    # Create and expose connection handler to QML
    connection_handler = ConnectionHandler()
    engine.rootContext().setContextProperty("connectionHandler", connection_handler) #send the connection_handler object to the QML

    app_dir = Path(__file__).parent.parent
    engine.addImportPath(os.fspath(app_dir))
    for path in import_paths:
        engine.addImportPath(os.fspath(app_dir / path))

    engine.load(os.fspath(app_dir/url))
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())