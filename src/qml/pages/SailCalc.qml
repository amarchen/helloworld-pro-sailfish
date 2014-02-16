import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Silica 1.0


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
    property alias _subtrText: subtrLabel.text
    property alias _subtractMenuAction: subtractMenuAction

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            id: pullDownMenu
            MenuItem {
                id: subtractMenuAction
                text: "Subtract!"
                onClicked: {
                    console.log("subtractMenuAction clicked")
                    subtrLabel.text = "A-B = " + (parseInt(a.text) - parseInt(b.text))
                }

            }
        }
        
        // Tell SilicaFlickable the height of its content.
        contentHeight: childrenRect.height
        
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            anchors.fill: parent
            anchors.margins: Theme.paddingLarge
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Calculator"
            }
            Label {
                width: parent.width
                anchors.leftMargin: Theme.paddingLarge
                anchors.rightMargin: Theme.paddingLarge

                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                text: "Demo calculator. <a href='https://github.com/amarchen/helloworld-pro-sailfish'>Visit GitHub</a> for details"

                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
            Item {
                width: parent.width
                height: a.height

                Label {
                    id: aLabel
                    text: "A:"
                }

                TextField {
                    id: a
                    anchors.left: aLabel.right
                    anchors.right: parent.horizontalCenter
                    text: "8"
                    validator: IntValidator {}
                    // Show a numpad only, instead of a full keyboard
                    inputMethodHints: Qt.ImhDigitsOnly
                }

                Label {
                    id: bLabel
                    anchors.left: parent.horizontalCenter
                    text: "B:"
                }

                TextField {
                    id: b
                    anchors.left: bLabel.right
                    anchors.right: parent.right
                    text: "3"
                    validator: IntValidator {}
                    // Show a numpad only, instead of a full keyboard
                    inputMethodHints: Qt.ImhDigitsOnly
                }
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
                id: subtrLabel
                text: "A-B = ?"
            }
        }
    }

}


