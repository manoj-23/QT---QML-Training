import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 600
    height: 400
    title: "QML Database with CRUD Operations"

    ColumnLayout {
        anchors.fill: parent
        width: 500

        TableView {
            id: tableView
            width: 500
          //  width: parent.width
            height: 400
            Layout.fillHeight: true
            Layout.fillWidth: true

            model: peopleModel  // Use the model from the DatabaseManager

            TableViewColumn {
                role: "id"
                title: "ID"
                width: 50
            }
            TableViewColumn {
                role: "name"
                title: "Name"
                width: 150
            }
            TableViewColumn {
                role: "age"
                title: "Age"
                width: 100
            }

            // On row click, fill the fields for editing
            onClicked: {
                let row = tableView.selectionModel.currentIndex.row;
                nameField.text = peopleModel.record(row).value("name").toString();
                ageField.text = peopleModel.record(row).value("age").toString();
                idField.text = peopleModel.record(row).value("id").toString();

            }
        }

        RowLayout {
            TextField {
                id: nameField
                placeholderText: "Name"
            }
            TextField {
                id: ageField
                placeholderText: "Age"
            }
            TextField {
                id: idField
                visible: false
            }
        }

        RowLayout {
            Button {
                text: "Add"
                onClicked: {
                    dbManager.addRecord(nameField.text, parseInt(ageField.text));
                    nameField.text = "";
                    ageField.text = "";
                }
            }

            Button {
                text: "Update"
                onClicked: {
                    dbManager.updateRecord(parseInt(idField.text), nameField.text, parseInt(ageField.text));
                    nameField.text = "";
                    ageField.text = "";
                }
            }

            Button {
                text: "Delete"
                onClicked: {
                    dbManager.deleteRecord(parseInt(idField.text));
                    nameField.text = "";
                    ageField.text = "";
                }
            }
        }
    }
}
