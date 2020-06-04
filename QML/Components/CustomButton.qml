import QtQuick 2.12
import QtQuick.Controls 2.12

import Assets 1.0

Item {
    id: root
    width: 200
    height: 70

    property string text: ""

    signal clicked()

    Rectangle {
        width: root.width
        height: root.height
        color: Style.componentColor
        radius: 20
        Text {
            id: buttonText
            text: root.text
            color: Style.textColor
            anchors.centerIn: parent
            font.pixelSize: Style.buttonFontSize
            font.bold: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                onClickedAnimation.start()
                root.clicked();
            }
        }

        SequentialAnimation {
            id: onClickedAnimation
            PropertyAnimation {
                target: root
                property: "scale"
                to: 0.9
                duration: Style.defaultAnimationTime/2
            }
            PropertyAnimation {
                target: root
                property: "scale"
                to: 1
                duration: Style.defaultAnimationTime/2
            }
        }

    }
}
