import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.2

import Assets 1.0
import Components 1.0

Window {
    id: root
    visible: true
    width: Style.screenWidth
    height: Style.screenHeight
    title: qsTr("Showcase")
    color: Style.backgroundColor

    MainStack {
        id: mainStack
    }
}
