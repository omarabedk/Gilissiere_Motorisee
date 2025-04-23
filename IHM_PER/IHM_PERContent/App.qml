// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

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

}
