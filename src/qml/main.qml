import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    initialPage: sailCalcComponent
    Component {
        id: sailCalcComponent
        SailCalc { }
    }
}


