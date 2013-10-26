import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Silica.theme 1.0


// Just a simple example to demo both property binding and doing something via pulley menu action
// to provide a sample of Sailfish-specific UI testing
Page {
    id: page

    // Exposing properties for testing. In real app you might like to hide it behind a single interface
    // e.g. via "property variant internals" and then put a QtObject with the individual properties to it
    // @TODO: implement exposing via single internals property
    property alias _aText: a.text
    property alias _bText: b.text
    property alias _sumText: sumLabel.text
    property alias _substrText: substrLabel.text
    property alias _substractMenuAction: substractMenuAction

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            id: pullDownMenu
            MenuItem {
                id: substractMenuAction
                text: "Substract!"
                onClicked: {
                    console.log("substractMenuAction clicked")
                    substrLabel.text = "A-B = " + (parseInt(a.text) - parseInt(b.text))
                }

            }
        }
        
        // Tell SilicaFlickable the height of its content.
        contentHeight: childrenRect.height
        
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Calculator"
            }
            Label { 
                text: "AAA"
            }
            TextField {
                id: a
                text: "8"
                validator: IntValidator {}
            }
            Label {
                text: "B"
            }

            TextField {
                id: b
                text: "3"
                validator: IntValidator {}
            }
            Label {
                id: sumLabel
                text: "A+B = " + (parseInt(a.text) + parseInt(b.text))
            }
            Label {
                width: parent.width
                text: "For getting A-B use action in the pulley menu"
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            }
            Label {
                id: substrLabel
                text: "A-B = ?"
            }
        }
    }

}


