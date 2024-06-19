// Copyright (C) 2013 BlackBerry Limited. All rights reserved.
// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#include "deviceinfo.h"

#ifdef Q_OS_DARWIN
#  include <QBluetoothUuid>
#else
#  include <QBluetoothAddress>
#endif

DeviceInfo::DeviceInfo(const QBluetoothDeviceInfo &d)
{
    device = d;
}

QString DeviceInfo::getAddress() const
{
#ifdef Q_OS_DARWIN
    // On OS X and iOS we do not have addresses,
    // only unique UUIDs generated by Core Bluetooth.
    return device.deviceUuid().toString();
#else
    return device.address().toString();
#endif
}

QString DeviceInfo::getName() const
{
    return device.name();
}

QBluetoothDeviceInfo DeviceInfo::getDevice()
{
    return device;
}

void DeviceInfo::setDevice(const QBluetoothDeviceInfo &dev)
{
    device = QBluetoothDeviceInfo(dev);
    Q_EMIT deviceChanged();
}
