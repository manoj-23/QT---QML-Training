#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject {
    Q_OBJECT
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)

public:
    explicit Counter(QObject* parent = nullptr);
    // Counter cnt ;
    // Counter cnt(&parent)

    int value() const { return m_value; }
    void setValue(int value);

signals:
    void valueChanged();

public slots:
    void increment();
    void decrement();

private:
    int m_value;
};

#endif // COUNTER_H
