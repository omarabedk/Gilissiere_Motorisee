import QtQuick
import QtQuick.Controls

Rectangle {
    id: rectangle
    x: 0
    y: 0
    width: 280
    height: 360
    color: "#ffffff"
    property alias vitessemotInput: vitessemotInput
    property alias courantInput: courantInput
    property alias wpInput: wpInput

    Label {
        id: label
        x: 55
        y: 8
        width: 178
        height: 28
        text: qsTr("Paramètres du moteur")
        font.bold: true
        font.pointSize: 13
    }

    Label {
        id: label1
        x: 23
        y: 50
        text: qsTr("Vitesse du moteur :")
        font.pointSize: 10
    }

    Label {
        id: label2
        x: 234
        y: 50
        text: qsTr("tr/min")
        font.pointSize: 10
    }

    Label {
        id: label3
        x: 23
        y: 81
        text: qsTr("Courant du moteur :")
        font.pointSize: 10
    }

    Label {
        id: label4
        x: 233
        y: 81
        text: qsTr("A")
        font.pointSize: 10
    }

    Label {
        id: label5
        x: 23
        y: 114
        text: qsTr("T1 :")
        font.pointSize: 10
    }

    Label {
        id: label6
        x: 133
        y: 114
        text: qsTr("s")
        font.pointSize: 10
    }

    Label {
        id: label7
        x: 23
        y: 145
        text: qsTr("T2 :")
        font.pointSize: 10
    }

    Label {
        id: label8
        x: 133
        y: 145
        text: qsTr("s")
        font.pointSize: 10
    }

    Label {
        id: label9
        x: 23
        y: 177
        text: qsTr("p :")
        font.pointSize: 10
    }

    Label {
        id: label10
        x: 23
        y: 211
        text: qsTr("Wp :")
        font.pointSize: 10
    }

    Label {
        id: label11
        x: 145
        y: 211
        text: qsTr("tr/min")
        font.pointSize: 10
    }

    Label {
        id: label12
        x: 23
        y: 245
        text: qsTr("Cmax :")
        font.pointSize: 10
    }

    Label {
        id: label13
        x: 138
        y: 283
        text: qsTr("m")
        font.pointSize: 10
    }

    Label {
        id: label14
        x: 23
        y: 283
        text: qsTr("Cp :")
        font.pointSize: 10
    }

    Label {
        id: label15
        x: 143
        y: 321
        text: qsTr("m")
        font.pointSize: 10
    }

    Label {
        id: label16
        x: 23
        y: 321
        text: qsTr("Xmax :")
        font.pointSize: 10
    }

    Label {
        id: label17
        x: 157
        y: 245
        text: qsTr("m")
        font.pointSize: 10
    }

    TextField {
        id: vitessemotInput
        x: 140
        y: 50
        width: 88
        height: 20
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }

    TextField {
        id: courantInput
        x: 149
        y: 81
        width: 79
        height: 20
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }

    TextField {
        id: t1Label
        x: 52
        y: 115
        width: 75
        height: 20
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }

    TextField {
        id: t2Label
        x: 52
        y: 146
        width: 73
        height: 20
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }

    TextField {
        id: penteLabel
        x: 52
        y: 179
        width: 73
        height: 20
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }

    TextField {
        id: wpInput
        x: 55
        y: 212
        width: 84
        height: 20
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }

    TextField {
        id: cmaxLabel
        x: 67
        y: 246
        width: 85
        height: 20
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }

    TextField {
        id: cpLabel
        x: 52
        y: 285
        width: 82
        height: 20
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }

    TextField {
        id: xmaxLabel
        x: 67
        y: 322
        width: 72
        height: 20
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }
}
