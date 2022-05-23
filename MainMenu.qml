import QtQuick 2.4
import QtQuick.Window 2.0

Rectangle {
    property int golds: game.getGolds() //bude property alias
    property int woods: game.getWoods()
    property int workers: game.getWorkers()
    id: mainMenu
    x: 0
    y: 0
    width: 1026
    height: 50
    color: "lightGray"
    radius: 0
    anchors.verticalCenter: parent
    border.width: 3
    border.color: "dimGray"





    Image {
        id: image
        x: 653
        y: 8
        width: 67
        height: 34
        source: "images/coins.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: textGolds
        x: 597
        y: 11
        text: golds
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        font.italic: false
        font.bold: true
        minimumPixelSize: 12
    }

    Image {
        id: image1
        x: 791
        y: 6
        width: 64
        height: 38
        source: "images/wood.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: textWoods
        x: 738
        y: 11
        text: woods
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        minimumPixelSize: 12
    }

    Text {
        id: textWorkers
        x: 877
        y: 11
        text: workers
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        minimumPixelSize: 12
    }

    Image {
        id: image2
        x: 906
        y: 7
        width: 46
        height: 37
        source: "images/worker.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image3
        x: 19
        y: -18
        width: 179
        height: 87
        source: "images/mainTitle.png"
        fillMode: Image.PreserveAspectFit
    }
MouseArea{
    width: 2000
    height: 2000
    //anchors.fill: parent
    hoverEnabled: true


    onPositionChanged: {
        textWoods.text = game.getWoods()
        textGolds.text = game.getGolds()
        textWorkers.text = game.getWorkers()
    }


}
}

