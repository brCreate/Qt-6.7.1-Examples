// Copyright (C) 2020 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#include <QtInsightTracker/QInsightTracker>
#include <QtCore/QLoggingCategory>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setApplicationVersion(QLatin1String(qVersion()));

    QLoggingCategory::setFilterRules("qt.insight*=true");

    QInsightTracker tracker;
    tracker.setEnabled(false);
    tracker.configuration()->setSyncInterval(60);

    QQmlApplicationEngine engine;
    engine.addImportPath(":/imports");
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    //! [0]
    tracker.transition("initial");
    //! [0]

    return app.exec();
}
