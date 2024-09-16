#ifndef DISPATCHER_H
#define DISPATCHER_H

#include <QThread>
#include <QDebug>

class Worker : public QThread
{
    Q_OBJECT
    Q_PROPERTY(int data READ getData WRITE setData NOTIFY dataChanged )
    /*      it is based on the Meta-Object System
            that also provides inter-object communication
             via signals and slots.
     */
public:
    explicit Worker() = default;
    ~Worker() = default;

    void run() {
        qDebug() << "Inside the worker thread!";
        for ( int i = 0; i < 100; ++i ) {
            setData(i);
            sleep( 1 );
        }
    }

    Q_INVOKABLE int getData() const { return data_; }

// TODO: add signals for each type of received message by the worker thread?
signals:
    void dataChanged( const int data );

public slots:
    void setData( const int data ) {
        if ( data != data_ ) {
            data_ = data;
            emit dataChanged( data_ );
        }
    }

private:
    int data_{ 0 };
};

#endif // DISPATCHER_H
