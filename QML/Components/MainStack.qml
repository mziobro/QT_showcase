import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.2

import Assets 1.0
Item {

    StackView {
        id: totallyMainStackViewSelectorPusher
        width: Style.screenWidth
        height: Style.screenHeight
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
        }

        property Item chart: Charts { }
        property Item settings: Settings { }
        property Item addNote: AddNote { }

        property Item home: Home {
            onMenuItemClicked: {
                switch(label){
                case "Add note":
                    totallyMainStackViewSelectorPusher.replace(totallyMainStackViewSelectorPusher.addNote)
                    break;
                case "Charts":
                    totallyMainStackViewSelectorPusher.replace(totallyMainStackViewSelectorPusher.chart)
                    break;
                case "Settings":
                    totallyMainStackViewSelectorPusher.replace(totallyMainStackViewSelectorPusher.settings)
                }
            }
        }
        initialItem: home

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: Style.defaultAnimationTime
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: Style.defaultAnimationTimes
            }
        }
    }

    RoundButton  {
        id: backToHomePushButton
        opacity: {
            totallyMainStackViewSelectorPusher.currentItem ===
                    totallyMainStackViewSelectorPusher.home ? 0 : 1
        }

        icon.source: "qrc:/Assets/Images/BackArrow.png"
        palette.button: Style.componentColor

        onPressed: totallyMainStackViewSelectorPusher.replace(totallyMainStackViewSelectorPusher.home)

        Behavior on opacity { NumberAnimation{ duration: Style.defaultAnimationTime }}
    }
}
