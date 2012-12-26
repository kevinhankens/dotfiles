// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 360
    height: 360
    Text {
        x: 146
        y: 19
        anchors.centerIn: parent
        text: "Hello World"
        anchors.verticalCenterOffset: -153
        anchors.horizontalCenterOffset: 1
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }

        GridView {
            id: grid_view1
            x: 74
            y: 82
            width: 155
            height: 140
            flickableDirection: Flickable.AutoFlickDirection
            cellHeight: 70
            cellWidth: 70
            delegate: Item {
                x: 5
                height: 50
                Column {
                    x: 14
                    y: 13
                    spacing: 5
                    Rectangle {
                        width: 40
                        height: 40
                        color: colorCode
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        x: 5
                        text: name
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                    }
                }
            }
            model: ListModel {
                ListElement {
                    name: "Black"
                    colorCode: "black"
                }

                ListElement {
                    name: "Red"
                    colorCode: "red"
                }

                ListElement {
                    name: "Blue"
                    colorCode: "blue"
                }

                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
            }
        }
    }
}
