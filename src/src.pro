TEMPLATE=app
# The name of your app
TARGET = sailfish-app-with-qml-test

# C++ sources
SOURCES += main.cpp

# C++ headers
HEADERS +=

# QML files and folders
qml.files = *.qml pages cover main.qml

# The .desktop file
desktop.files = sailfish-app-with-qml-test.desktop

# Please do not modify the following line.
include(sailfishapplication/sailfishapplication.pri)

# .yaml and .gitignore are actually a part of the parent project for both this component and it's test
# keeping. They are listed here only for convenience - then it will be visible in QtCreator project explorer
# .spec file you should not touch at all. I would even delete it and add it to .gitignore, but build process stops
# without it
OTHER_FILES = \
    ../rpm/sailfish-app-with-qml-test.spec
