import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    // Version strings are injected to the QML context in main.cpp and are accessible from anywhere in
    // the app via appVersion and appBuildNum
    // it is a bit more QMLiish (and also more modular and testable) to put them insto some QML object property
    // and access from it later
    readonly property string _APP_VERSION: appVersion
    readonly property string _APP_BUILD_NUMBER: appBuildNum

    initialPage: sailCalcComponent
    Component {
        id: sailCalcComponent
        SailCalc { version: _APP_VERSION; buildNum: _APP_BUILD_NUMBER }
    }
}


