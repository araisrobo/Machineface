TEMPLATE = app
NAME = Machineface

QT += qml quick widgets \
    webengine

SOURCES += main.cpp \
    src/scriptlauncher.cpp

HEADERS += \
    src/scriptlauncher.h

RESOURCES += qml.qrc

QML_FILES = $$PWD/$$NAME/*.qml
OTHER_FILES += $$QML_FILES

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

ios: {
    LIBS += -L$$PROTOBUF_LIB_PATH
    LIBS += -L$$ZEROMQ_LIB_PATH
    LIBS += -L$$LIBSODIUM_LIB_PATH
    LIBS += -lsodium -lzmq -lprotobuf
}

android: {
    LIBS += -lmachinetalk-protobuf
}

TRANSLATIONS_PATH = $$PWD/translations
TRANSLATIONS_OUT_PATH = $$PWD/$$NAME/translations
include(translation.pri)
