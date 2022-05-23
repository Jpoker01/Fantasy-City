import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


ApplicationWindow {

    id: root
    width: 1024
    height: 768
    opacity: 1
    maximumHeight: height
    maximumWidth: width
    visible: true
    title: qsTr("Fantasy City")

    menuBar: MenuBar {
            Menu {
                title: qsTr("&File")
                Action { text: qsTr("&New...")
                onTriggered: game.loadGame("save1")}
                Action { text: qsTr("&Open...")
                onTriggered: {
                    var component = Qt.createComponent("Open.qml")
                    var window = component.createObject(root)
                    window.show()
                }}
                Action { text: qsTr("&Save")
                    onTriggered: save.saveFile()
                }
                Action { text: qsTr("Save &As...")
                onTriggered: {
                    var component = Qt.createComponent("SaveAs.qml")
                    var window = component.createObject(root)
                    window.show()
                }}
                MenuSeparator { }
                Action { text: qsTr("&Quit")
                onTriggered: game.quitGame()}
            }
            Menu {
                title: qsTr("&Help")
                Action { text: qsTr("&About")
                    onTriggered: {
                        var component = Qt.createComponent("About.qml")
                        var window = component.createObject(root)
                        window.show()
                    }
                }
            }
        }

    MainMenu{

    }

    Image {
        id: background
        x: 0
        y: 140
        source: "images/mapLayout.png"
        anchors.topMargin: 50
        anchors.fill: parent
    }

    MapField{
        anchors.fill: parent
        anchors.topMargin: 55
        anchors.bottomMargin: 15
        anchors.leftMargin: 3
    }


}
