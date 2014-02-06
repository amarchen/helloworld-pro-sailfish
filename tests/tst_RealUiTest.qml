/**
 * Tests that operate on the UI level. They expect window to be shown. All the mouseClick-like test utilities can be used then
 */
import QtQuick 2.0
import QtTest 1.0
import Sailfish.Silica 1.0

//import "../src/qml/pages"
import "../harbour-helloworld-pro-sailfish/qml/pages"


// Putting TestCase into the full app structure to test UI interactions and probably page transitions too
ApplicationWindow {
    id: wholeApp
    initialPage: SailCalc {
        id: bigCalc
    }

    TestCase {
        name: "test on the very UI level"

        // You want see anything yet at this moment, but UI is actually constructed already and e.g. mouseClick will work
        // Painting happens later, you can set up timer to wait for it (painting happens some 50-100ms after ApplicationWindow's
        // applicationActive becomes true), then you might be able to
        // see graphics update when test is clicking through buttons, though you might need to yield control from time to time then
        when: windowShown

        function test_menuAction() {
            bigCalc._subtrText = ""
            bigCalc._aText = "19"
            bigCalc._bText = "9"

            // You will still see no UI except for a short moment when test is about to exit
            // UI is actually created - that's why mouseClick works, but for some reason isn't rendered until after the test case methods

            bigCalc._subtractMenuAction.clicked(null)
            compare(bigCalc._subtrText, "A-B = 10", "expected 19 - 9 to equal 10")
        }
    }

}

