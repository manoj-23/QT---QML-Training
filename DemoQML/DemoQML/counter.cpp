#include "counter.h"

Counter::Counter(QObject* parent) : QObject(parent), m_value(0) {}

void Counter::setValue(int value) {
    if (m_value != value) {
        m_value = value;
        emit valueChanged();  // Emit signal to notify QML of property changes
    }
}

void Counter::increment() {
    setValue(m_value + 1);
}

void Counter::decrement() {
    setValue(m_value - 1);
}
