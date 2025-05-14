from PySide6.QtCore import QObject, QTimer, Signal, Slot, Property
from PySide6.QtSerialBus import QModbusTcpClient, QModbusDevice, QModbusDataUnit
import struct


class ConnectionHandler(QObject):
    connectionStatusChanged = Signal(bool)
    errorOccurred = Signal(str)
    vitesseReelUpdated = Signal(float)
    courantReelUpdated = Signal(float)

    def __init__(self, parent=None):
        super().__init__(parent)
        self._modbus_device = QModbusTcpClient(self)
        self._is_connected = False
        self._connection_check_timer = QTimer(self)
        self._connection_check_timer.setInterval(1000)
        self._connection_check_timer.timeout.connect(self.read_modbus_data)

        # Connect state change and error signals
        self._modbus_device.stateChanged.connect(self._on_state_changed)
        self._modbus_device.errorOccurred.connect(self._on_error)
    
   
    @Property(bool, notify=connectionStatusChanged)
    def is_connected(self):
        return self._is_connected

    @Slot(list, int, int)
    def connect_button_clicked(self, ip_parts, port, server_address):
        self._server_address = server_address
        ip_parts_clean = [str(int(float(p))) for p in ip_parts[:4]]  # force only 4, and clean them up
        ip_address = ".".join(ip_parts_clean)
        
        if self._modbus_device.state() == QModbusDevice.ConnectedState:
            print("[PY] Disconnecting from Modbus...")
            self._modbus_device.disconnectDevice()
            return

        print(f"[PY] Connecting to {ip_address}:{port}")
        self._modbus_device.setConnectionParameter(QModbusDevice.NetworkAddressParameter, ip_address)
        self._modbus_device.setConnectionParameter(QModbusDevice.NetworkPortParameter, port)
        self._modbus_device.setTimeout(200)
        self._modbus_device.setNumberOfRetries(5)

        if not self._modbus_device.connectDevice():
            self.errorOccurred.emit("Failed to initiate connection.")
            print("[PY] connectDevice() failed to initiate.")
        else:
            print("[PY] connectDevice() initiated.")

    def _on_state_changed(self, state):
        print(f"[PY] Modbus state changed: {state}")
        connected = (state == QModbusDevice.ConnectedState)
        if self._is_connected != connected:
            self._is_connected = connected
            self.connectionStatusChanged.emit(connected)

        if connected:
            print("[PY] Connection successful, starting read timer.")
            self._connection_check_timer.start()
        else:
            print("[PY] Connection closed.")
            self._connection_check_timer.stop()

    def _on_error(self, error):
        if error != QModbusDevice.NoError:
            msg = self._modbus_device.errorString()
            print(f"[PY] Modbus error: {msg}")
            self.errorOccurred.emit(msg)

    


    def read_modbus_data(self):
        if not self._modbus_device or self._modbus_device.state() != QModbusDevice.ConnectedState:
            print("[PY] Not connected, skipping read.")
            return

        # Read 2 registers starting at address 1 (vitesseReel)
        vitesse = QModbusDataUnit(QModbusDataUnit.HoldingRegisters, 1, 2)
        replyVitesse = self._modbus_device.sendReadRequest(vitesse, self._server_address)
        if not replyVitesse:
            print("[PY] Read request failed to start.")
            return

        if not replyVitesse.isFinished():
            replyVitesse.finished.connect(lambda: self._handle_read_reply(replyVitesse, self.vitesseReelUpdated))
        else:
            replyVitesse.deleteLater()

        courant = QModbusDataUnit(QModbusDataUnit.HoldingRegisters, 3, 2)
        replyCourant = self._modbus_device.sendReadRequest(courant, self._server_address)
        if not replyCourant:
            print("[PY] Read request failed to start.")
            return

        if not replyCourant.isFinished():
            replyCourant.finished.connect(lambda: self._handle_read_reply(replyCourant, self.courantReelUpdated))
        else:
            replyCourant.deleteLater()



    def _handle_read_reply(self, reply, signal):
        if reply.error() == QModbusDevice.NoError:
            registers = reply.result().values()
            if len(registers) >= 2:
                raw_value = (registers[1] << 16) | registers[0]
                value = struct.unpack('<f', struct.pack('<I', raw_value))[0]
                print(f"[PY] Read value to: {value}")
                signal.emit(value)
        else:
            print(f"[PY] Read error: {reply.errorString()}")
            self.errorOccurred.emit(f"Read error: {reply.errorString()}")
        reply.deleteLater()