set_source_files_properties(Constants.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

set_source_files_properties(Downlaod.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

set_source_files_properties(assetdownloader.cpp
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

set_source_files_properties(assetdownloader.h
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_add_library(CarRendering STATIC)
qt6_add_qml_module(CarRendering
    URI "CarRendering"
    VERSION 1.0
    RESOURCE_PREFIX "/qt/qml"
    QML_FILES
        Constants.qml
    SOURCES
        assetdownloader.h assetdownloader.cpp
)
