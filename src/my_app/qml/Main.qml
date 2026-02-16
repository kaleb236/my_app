import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 800
    title: "Lessons"

    Column {
        anchors.fill: parent
        spacing: 10

        Text {
            text: "Available Lessons"
            font.pixelSize: 28
            font.bold: true
        }

        ListView {
            id: lessonList
            anchors.fill: parent
            model: appControl.lessons ? appControl.lessons.lessons : []

            delegate: Rectangle {
                width: lessonList.width
                height: 120
                radius: 8
                color: "#f5f5f5"
                border.color: "#cccccc"
                border.width: 1

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 5

                    Text {
                        text: modelData.title
                        font.pixelSize: 20
                        font.bold: true
                    }

                    Text {
                        text: modelData.description
                        wrapMode: Text.WordWrap
                    }

                    Text {
                        text: "Duration: " + modelData.duration
                        font.italic: true
                    }
                }
            }
        }

    }

    // Refresh automatically when backend emits lesson_changed
    Connections {
        target: appControl
        function onLesson_changed() {
            console.log("Lessons updated, refreshing list", appControl.lessons.lessons.length + " lessons available")
        }
    }
}
