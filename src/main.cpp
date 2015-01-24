#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include <QScopedPointer>
#include <QQuickView>
#include <QQmlEngine>
#include <QGuiApplication>


int main(int argc, char *argv[])
{
    // For this example, wizard-generates single line code would be good enough,
    // but very soon it won't be enough for you anyway, so use this more detailed example from start
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> view(SailfishApp::createView());

    // That is how you can access version strings in C++. And pass them on to QML
    view->rootContext()->setContextProperty("appVersion", APP_VERSION);
    view->rootContext()->setContextProperty("appBuildNum", APP_BUILDNUM);


//    Here's how you will add QML components whenever you start using them
//    Check https://github.com/amarchen/Wikipedia for a more full example
//    view->engine()->addImportPath(SailfishApp::pathTo("qml/components").toString());
    view->setSource(SailfishApp::pathTo("qml/main.qml"));

    view->show();

    return app->exec();
}
