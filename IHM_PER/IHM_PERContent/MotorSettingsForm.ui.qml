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
        width: 170
        height: 28
        text: qsTr("Paramètres du moteur")
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
        x: 217
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
        x: 217
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
        x: 111
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
        x: 111
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
        y: 213
        text: qsTr("Wp :")
        font.pointSize: 10
    }

    Label {
        id: label11
        x: 106
        y: 213
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
        x: 106
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
        x: 123
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
        x: 123
        y: 245
        text: qsTr("m")
        font.pointSize: 10
    }

    TextField {
        id: vitessemotInput
        x: 140
        y: 50
        width: 71
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
        width: 60
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
        y: 116
        width: 50
        height: 16
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
        y: 147
        width: 50
        height: 16
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
        width: 50
        height: 16
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
        y: 213
        width: 47
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
        y: 247
        width: 50
        height: 16
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
        width: 50
        height: 16
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
        y: 323
        width: 50
        height: 16
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        validator: DoubleValidator {
            bottom: 0
            top: 100
            decimals: 2
        }
    }
}
