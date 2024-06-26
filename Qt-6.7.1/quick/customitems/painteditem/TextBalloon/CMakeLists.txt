# Copyright (C) 2022 The Qt Company Ltd.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    message(FATAL_ERROR "TextBalloon should be built as part of the 'painteditem' project, and not in isolation.")
endif()

qt_add_qml_module(qmltextballoon
    URI "TextBalloon"
    PLUGIN_TARGET qmltextballoon
    SOURCES
        textballoon.cpp textballoon.h
)

target_link_libraries(qmltextballoon PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
)

install(TARGETS qmltextballoon
    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}/TextBalloon"
    LIBRARY DESTINATION "${CMAKE_INSTALL_BINDIR}/TextBalloon"
)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/qmldir
    DESTINATION "${CMAKE_INSTALL_BINDIR}/TextBalloon"
)
