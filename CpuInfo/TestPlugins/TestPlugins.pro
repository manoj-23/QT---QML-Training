TEMPLATE = app

QT += qml quick
CONFIG += c++11

DESTDIR = ../

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

#win32: LIBS += -L$$PWD/../CpuInfo/ -lCpuInfoPlugins

#INCLUDEPATH += $$PWD/../CpuInfo
#DEPENDPATH += $$PWD/../CpuInfo
