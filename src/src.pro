TEMPLATE=app
# The name of your app binary (and it's better if you think it is the whole app name as it's referred to many times)
# Must start with "harbour-"
TARGET = harbour-helloworld-pro-sailfish

# In the bright future this config line will do a lot of stuff to you
#CONFIG += sailfishapp

# Start of temporary fix for the icon for the Nov 2013 harbour requirements, basically reimplements
# what CONFIG += sailfishapp is supposed to do manually (with small corrections)
# QML files and folders
QT += quick qml
CONFIG += link_pkgconfig
PKGCONFIG += sailfishapp

INCLUDEPATH += /usr/include/sailfishapp

TARGETPATH = /usr/bin
target.path = $$TARGETPATH

DEPLOYMENT_PATH = /usr/share/$$TARGET
qml.files = qml
qml.path = $$DEPLOYMENT_PATH

desktop.files = harbour-helloworld-pro-sailfish.desktop
desktop.path = /usr/share/applications

# Icon is donated by Artem Marchenko from his Wikipedia project - https://github.com/amarchen/Wikipedia
# Please, treat it as if it is under BSD-3-clause license.. unless you really need more
# TODO: to be replaced with an icon that communicates the helloworld idea better and is wholeheartedly in the public domain
icon.files = harbour-helloworld-pro-sailfish.png
icon.path = /usr/share/icons/hicolor/86x86/apps

INSTALLS += target icon desktop  qml
# End of Nov 2013 fix

SOURCES += main.cpp

OTHER_FILES = \
# You DO NOT want .yaml be listed here as Qt Creator's editor is completely not ready for multi package .yaml's
#
# Also Qt Creator as of Nov 2013 will anyway try to rewrite your .yaml whenever you change your .pro
# Well, you will just have to restore .yaml from version control again and again unless you figure out
# how to kill this particular Creator's plugin
#    ../rpm/harbour-helloworld-pro-sailfish.yaml \
    ../rpm/harbour-helloworld-pro-sailfish.spec \
    qml/pages/SailCalc.qml \
    qml/main.qml

INCLUDEPATH += $$PWD
