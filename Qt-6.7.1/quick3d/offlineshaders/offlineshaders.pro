QT += quick quick3d

target.path = $$[QT_INSTALL_EXAMPLES]/quick3d/offlineshaders
INSTALLS += target

SOURCES += \
    main.cpp

RESOURCES += \
    qml.qrc \
    materials.qrc

OTHER_FILES += \
    doc/src/*.*
