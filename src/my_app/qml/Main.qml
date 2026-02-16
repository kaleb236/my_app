import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 800
    height: 800
    title: "Lessons"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        // 🔹 Header Section
        Rectangle {
            Layout.fillWidth: true
            height: 80
            color: "transparent"

            Row {
                id: contentRow
                spacing: 8

                Image {
                    source: ASSETS_PATH + "/icons/orbit.png"
                    width: 52; height: 52
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    text: "Lessons"
                    color: "black"
                    font.pixelSize: 28
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

        // 🔹 Lessons List
        ListView {
            id: lessonList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 10

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
                    anchors.margins: 12
                    spacing: 6

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
                        color: "#555555"
                    }
                }
            }
        }
    }

    // 🔹 Refresh when backend updates
    Connections {
        target: appControl
        function onLesson_changed() {
            console.log("Lessons updated:",
                        appControl.lessons.lessons.length,
                        "lessons available")
        }
    }
}
