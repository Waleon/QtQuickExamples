#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QSettings>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("QMLExamples");
    QGuiApplication::setOrganizationName("Waleon");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QSettings settings;
    QString style = settings.value("style").toString();
    QQuickStyle::setStyle(style);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("availableStyles", QQuickStyle::availableStyles());
    engine.load(QUrl("qrc:/qml/qml/main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
