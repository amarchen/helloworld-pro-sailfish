/**
 * Tests that operate with instantiated QML components, yet don't really need Application Window to be created
 * That will produce a lot of warnings, UI utilities such as mouseClick won't work, but the test code becomes simpler
 * and runs faster
 * And if you do want to operate on the muse level, you can get almost there via e.g. triggering clicked(null) signal handler
 *
 */

import QtQuick 2.0
import QtTest 1.0

// At runtime proper folder to import is "../harbour-helloworld-pro-sailfish/qml/pages"
// You can check the main app deployment folder from it's DEPLOYMENT_PATH qmake var in .pro
// Faster to check from .spec file, however

// At design-time I uncomment import "../src/qml/pages" so that QtCreator auto-completion would work

//import "../src/qml/pages"
import "../harbour-helloworld-pro-sailfish/qml/pages"

TestCase {
    name: "SailCalcTest"

    SailCalc {
        id: bigCalc
    }

    function test_addition() {
        bigCalc._aText = "7"
        bigCalc._bText = "8"
        compare(bigCalc._sumText, "A+B = 15", "7 + 8 should make 15")
    }

    function test_subtractionAfterMenuAction() {
        bigCalc._substrText = ""
        bigCalc._aText = "19"
        bigCalc._bText = "9"

        // mouseClick will not work, because no window is shown. And not even created maybe
        // mouseClick(bigCalc._subtractMenuAction)

        // click simulation via signals works just fine, however
        bigCalc._subtractMenuAction.clicked(null)
        compare(bigCalc._substrText, "A-B = 10", "expected 19 - 9 to equal 10")
    }
}


