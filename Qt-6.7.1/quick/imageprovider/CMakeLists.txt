# Copyright (C) 2022 The Qt Company Ltd.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

cmake_minimum_required(VERSION 3.16)
project(qmlimageproviderplugin LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/examples/quick/imageprovider)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt6_add_qml_module(qmlimageproviderplugin
    URI "ImageProviderCore"
    PLUGIN_TARGET qmlimageproviderplugin
    NO_PLUGIN_OPTIONAL
    NO_GENERATE_PLUGIN_SOURCE
    CLASS_NAME ImageProviderExtensionPlugin
    SOURCES
        imageprovider.cpp
)

target_link_libraries(qmlimageproviderplugin PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
)

install(TARGETS qmlimageproviderplugin
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
