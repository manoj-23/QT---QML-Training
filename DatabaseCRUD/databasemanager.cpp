#include "databasemanager.h"

DatabaseManager::DatabaseManager(QObject *parent) : QObject(parent) {
    // Initialize the database
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("example.db");

    if (!db.open()) {
        qDebug() << "Error: Could not open database.";
        return;
    }

    // Initialize the table model
    model = new QSqlTableModel(this, db);
    model->setTable("people");
    model->select();

    // Create a table if it doesn't exist
    initializeDatabase();
}

DatabaseManager::~DatabaseManager() {
    db.close();
}

void DatabaseManager::initializeDatabase() {
    QSqlQuery query;
    query.exec("CREATE TABLE IF NOT EXISTS people ("
               "id INTEGER PRIMARY KEY AUTOINCREMENT, "
               "name TEXT, "
               "age INTEGER)");
}

QSqlTableModel* DatabaseManager::getModel() {
    QSqlQueryModel* model1 = new QSqlQueryModel();

    model1->setQuery("SELECT * FROM people");  // Only select the 'id' column

    return model1;
}



void DatabaseManager::addRecord(const QString &name, int age) {
    QSqlQuery query;
    query.prepare("INSERT INTO people (name, age) VALUES (:name, :age)");
    query.bindValue(":name", name);
    query.bindValue(":age", age);
    if (!query.exec()) {
        qDebug() << "Error inserting record:" << query.lastError();
    }

     model->setTable("people");
    model->select();  // Refresh model
}

void DatabaseManager::updateRecord(int id, const QString &name, int age) {
    QSqlQuery query;
    query.prepare("UPDATE people SET name = :name, age = :age WHERE id = :id");
    query.bindValue(":name", name);
    query.bindValue(":age", age);
    query.bindValue(":id", id);
    if (!query.exec()) {
        qDebug() << "Error updating record:" << query.lastError();
    }
    model->select();  // Refresh model
}

void DatabaseManager::deleteRecord(int id) {
    QSqlQuery query;
    query.prepare("DELETE FROM people WHERE id = :id");
    query.bindValue(":id", id);
    if (!query.exec()) {
        qDebug() << "Error deleting record:" << query.lastError();
    }
    model->select();  // Refresh model
}
