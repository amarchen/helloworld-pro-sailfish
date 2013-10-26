TEMPLATE = app

# The name of your app
TARGET = tst-sailfish-app-with-qml-test

CONFIG += qmltestcase

TARGETPATH = /usr/bin
target.path = $$TARGETPATH

DEPLOYMENT_PATH = /usr/share/$$TARGET
qml.path = $$DEPLOYMENT_PATH

# defining QUICK_TEST_SOURCE_DIR here doesn't work QtCreator keeps injecting another definition to command line (from CONFIG += qmltestcase ?)
#DEFINES += QUICK_TEST_SOURCE_DIR=\"\\\"\"$${DEPLOYMENT_PATH}/\"\\\"\"
DEFINES += DEPLOYMENT_PATH=\"\\\"\"$${DEPLOYMENT_PATH}/\"\\\"\"

# C++ sources
SOURCES += main.cpp

# C++ headers
HEADERS +=

INSTALLS += target qml

# QML files and folders
qml.files = *.qml

OTHER_FILES += \
    tst_RealUiTest.qml \
    tst_NonUiTests.qml



