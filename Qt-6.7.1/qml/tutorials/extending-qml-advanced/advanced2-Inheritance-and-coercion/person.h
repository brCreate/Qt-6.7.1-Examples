// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#ifndef PERSON_H
#define PERSON_H

#include <QtQml/qqml.h>
#include <QObject>

class Person : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(int shoeSize READ shoeSize WRITE setShoeSize NOTIFY shoeSizeChanged FINAL)
    QML_ELEMENT
    QML_UNCREATABLE("Person is an abstract base class.")
public:
    using QObject::QObject;

    QString name() const;
    void setName(const QString &);

    int shoeSize() const;
    void setShoeSize(int);

signals:
    void nameChanged();
    void shoeSizeChanged();

private:
    QString m_name;
    int m_shoeSize = 0;
};

class Boy : public Person
{
    Q_OBJECT
    QML_ELEMENT
public:
    using Person::Person;
};

class Girl : public Person
{
    Q_OBJECT
    QML_ELEMENT
public:
    using Person::Person;
};

#endif // PERSON_H
