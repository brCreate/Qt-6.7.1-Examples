// Copyright (C) 2019 Julian Sherollari <jdotsh@gmail.com>
// Copyright (C) 2019 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtPositioning
import QtLocation
import Qt.labs.qmlmodels 1.0

//! [DelegateChooser]
DelegateChooser {
    id: dc
    role: "type"
//! [DelegateChooser]
    property color defaultColor: "#46a2da"
    property real defaultOpacity: 0.6

    //! [DelegateChoice Point]
    DelegateChoice {
        roleValue: "Point"
        delegate: MapCircle {
            property string geojsonType: "Point"
            property var props: modelData.properties
            geoShape: modelData.data
            radius: (props && props.radius) || 20*1000
            border.width: 2
            border.color: hh.hovered ? "magenta" : Qt.darker(color)
            opacity: dc.defaultOpacity
            color: (props && props.color) || (parent && parent.props && parent.props.color) || dc.defaultColor
    //! [DelegateChoice Point]
            autoFadeIn: view.autoFadeIn
            referenceSurface: view.referenceSurface

            //! [Handler Point]
            TapHandler {
                onTapped: {
                    if (props !== undefined)
                        console.log(props.name)
                    else if (parent.parent.geojsonType == "MultiPoint")
                        console.log(parent.parent.props.name)
                    else
                        console.log("NO NAME!", props)
                }
            }
            HoverHandler {
                id: hh
            }
            //! [Handler Point]
    //! [DelegateChoice Point1]
        }
    }
    //! [DelegateChoice Point1]

    DelegateChoice {
        roleValue: "LineString"
        delegate: MapPolyline {
            property string geojsonType: "LineString"
            property var props: modelData.properties
            geoShape: modelData.data
            line.width: 2
            opacity: dc.defaultOpacity
            line.color: hh.hovered ? "magenta" : (props && props.color) || (parent && parent.props && parent.props.color) || Qt.darker(dc.defaultColor)
            autoFadeIn: view.autoFadeIn
            referenceSurface: view.referenceSurface

            TapHandler {
                onTapped: {
                    if (props !== undefined)
                        console.log(props.name)
                    else if (parent.parent.geojsonType == "MultiLineString")
                        console.log(parent.parent.props.name)
                    else
                        console.log("NO NAME!", props)
                }
            }
            HoverHandler {
                id: hh
            }
        }
    }

    DelegateChoice {
        roleValue: "Polygon"
        delegate: MapPolygon {
            property string geojsonType: "Polygon"
            property var props: modelData.properties
            geoShape: modelData.data
            opacity: dc.defaultOpacity
            color: (props && props.color) || (parent && parent.props && parent.props.color) || dc.defaultColor
            border.width: 2
            border.color: hh.hovered ? "magenta" : Qt.darker(color)
            autoFadeIn: view.autoFadeIn
            referenceSurface: view.referenceSurface

            TapHandler {
                onTapped: {
                    if (props !== undefined)
                        console.log(props.name)
                    else if (parent.parent.geojsonType == "MultiPolygon")
                        console.log(parent.parent.props.name)
                    else
                        console.log("NO NAME!", props)
                }
            }
            HoverHandler {
                id: hh
            }
        }
    }

    DelegateChoice {
        roleValue: "MultiPoint"
        delegate: MapItemView {
            property string geojsonType: "MultiPoint"
            property var props: modelData.properties
            model: modelData.data
            delegate: dc
        }
    }

    DelegateChoice {
        roleValue: "MultiLineString"
        delegate: MapItemView {
            property string geojsonType: "MultiLineString"
            property var props: modelData.properties
            model: modelData.data
            delegate: dc
        }
    }

    DelegateChoice {
        roleValue: "MultiPolygon"
        delegate: MapItemView {
            property string geojsonType: "MultiPolygon"
            property var props: modelData.properties
            model: modelData.data
            delegate: dc
        }
    }

    DelegateChoice {
        roleValue: "GeometryCollection"
        delegate: MapItemView {
            property string geojsonType: "GeometryCollection"
            property var props: modelData.properties
            model: modelData.data
            delegate: dc
        }
    }

    // Features are explicitly not generated by the parser, but converted straight to their content + the properties.

    DelegateChoice {
        roleValue: "FeatureCollection"
        delegate: MapItemView {
            property string geojsonType: "FeatureCollection"
            property var props: modelData.properties
            model: modelData.data
            delegate: dc
        }
    }
//! [DelegateChooser1]
}
//! [DelegateChooser1]
