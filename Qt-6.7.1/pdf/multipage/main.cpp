// Copyright (C) 2020 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#include "pdfapplication.h"
#include <QDir>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[])
{
    QCoreApplication::setApplicationName("Qt Quick Multi-page PDF Viewer Example");
    QCoreApplication::setOrganizationName("QtProject");
    QCoreApplication::setApplicationVersion(QT_VERSION_STR);
    PdfApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///multipage/viewer.qml")));
    app.setFileOpener(engine.rootObjects().constFirst());
    if (app.arguments().count() > 1) {
        // alternatively, use QUrl::fromLocalFile(): network loading is not supported yet
        QUrl toLoad = QUrl::fromUserInput(app.arguments().at(1), QDir::currentPath(), QUrl::AssumeLocalFile);
        engine.rootObjects().constFirst()->setProperty("source", toLoad);
    } else {
        engine.rootObjects().constFirst()->setProperty("source", QStringLiteral("resources/test.pdf"));
    }

    return app.exec();
}
