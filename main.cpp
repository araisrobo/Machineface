#include <QApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QLibraryInfo>

#include "src/scriptlauncher.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("imports"));
    engine.addImportPath(QStringLiteral("assets:/imports"));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    // Add script launcher here so that we can call in QML
    ScriptLauncher launcher;
    engine.rootContext()->setContextProperty("scriptLauncher", &launcher);

    QTranslator translator;
    if (translator.load(QLocale(), QLatin1String("machineface"),
                          QLatin1String("_"), QLibraryInfo::location(QLibraryInfo::TranslationsPath)))
    {
        QCoreApplication::installTranslator(&translator);
    }

    return app.exec();
}

