pragma Singleton
import QtQuick 2.12

Item
{
    id: style
    /************* Screen ***************/
    property int screenWidth: 820
    property int screenHeight: 820

    /************* Colors ***************/
    property color backgroundColor: "#89113c"
    property color componentColor:   "#d0507e"
    property color textColor:       "#FFFFFF"
    property color lighterComponentColor : "#ffb4d8"

    /************* Text *****************/
    property int   chartTitleFontSize: 40
    property int   buttonFontSize: 40
    property int   menuFontSize: 40

    /************* Components ***********/
    property int   buttonWidth: 200
    property int   buttonHeight: 70

    property int   menuItemWidth: 300
    property int   menuItemHeight: 100
    property int   menuItemTextWidth: 140

    /************* Animations ***********/
    property int defaultAnimationTime: 200
}
