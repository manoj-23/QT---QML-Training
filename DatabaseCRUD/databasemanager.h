#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

class DatabaseManager : public QObject {
    Q_OBJECT
public:
    explicit DatabaseManager(QObject *parent = nullptr);
    ~DatabaseManager();

    Q_INVOKABLE void addRecord(const QString &name, int age);
    Q_INVOKABLE void updateRecord(int id, const QString &name, int age);
    Q_INVOKABLE void deleteRecord(int id);

    QSqlTableModel* getModel();

private:
    QSqlDatabase db;
    QSqlTableModel *model;
    QSqlTableModel *model1;
    void initializeDatabase();
};

#endif // DATABASEMANAGER_H
