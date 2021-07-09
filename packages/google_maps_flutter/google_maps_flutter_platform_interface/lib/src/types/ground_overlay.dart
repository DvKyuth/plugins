// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show immutable, required;

import 'types.dart';

/// Uniquely identifies a [GroundOverlay] among [GoogleMap] groundOverlays.
///
/// This does not have to be globally unique, only unique among the list.
@immutable
class GroundOverlayId extends MapsObjectId<GroundOverlay> {
  /// Creates an immutable identifier for a [GroundOverlay].
  const GroundOverlayId(String value) : super(value);
}

///Place image on the map
@immutable
class GroundOverlay implements MapsObject<GroundOverlay> {
  /// Creates an immutable representation of a [GroundOverlay] to draw on [GoogleMap].
  const GroundOverlay({
    required this.groundOverlayId,
    required this.position,
    required this.imageByte,
    this.bearing = 0,
    this.consumeTapEvents = false,
    this.transparency = 1.0,
    this.visibility = true,
    this.zIndex = 0,
    this.onTap,
  });

  /// Uniquely identifies a [GroundOverlayId].
  final GroundOverlayId groundOverlayId;

  @override
  MapsObjectId<GroundOverlay> get mapsId => groundOverlayId;

  /// Geographical location of the image to be placed at.
  final LatLngBounds position;

  /// A byte array containing the image data.
  ///
  /// The image data format must be natively supported for decoding by the platform.
  /// e.g on Android it can only be one of the
  /// [supported image formats for decoding]
  /// (https://developer.android.com/guide/topics/media/media-formats#image-formats).
  final Uint8List? imageByte;

  /// The amount that the image should be rotated in a clockwise direction.
  /// The center of the rotation will be the image's anchor.
  /// This is optional and the default bearing is 0, i.e., the image is aligned so that up is north.
  final double? bearing;

  /// The order in which this ground overlay is drawn with respect to other overlays
  /// (including Polylines and TileOverlays, but not Markers).
  /// Overlays are drawn in order of z-index, so that lower values means drawn
  /// earlier, and thus appearing to be closer to the surface of the Earth.
  /// An overlay with a larger zIndex is drawn over overlays with smaller zIndexes.
  /// The order of overlays with the same zIndex value is arbitrary.
  /// This is optional and the default zIndex is 0.
  final int? zIndex;

  /// Transparency of the ground overlay in the range [0..1]
  /// where 0 means the overlay is opaque
  /// and 1 means the overlay is fully transparent.
  /// If the specified bitmap is already partially transparent,
  /// the transparency of each pixel will be scaled accordingly
  /// (for example, if a pixel in the bitmap has an alpha value of 200 and you
  /// specify the transparency of the ground overlay as 0.25
  /// then the pixel will be rendered on the screen with an alpha value of 150).
  /// Specification of this property is optional and the default transparency is 0 (opaque).
  final double? transparency;

  /// Indicates if the ground overlay is visible or invisible, i.e. whether it is drawn on the map.
  /// An invisible ground overlay is not drawn, but retains all of its other properties.
  /// This is optional and the default visibility is true, i.e., visible.
  final bool? visibility;

  /// If you want to handle events fired when the user clicks the ground overlay,
  /// set this property to true.
  /// You can change this value at any time. The default is false.
  final bool? consumeTapEvents;

  /// Callbacks to receive tap events for circle placed on this map.
  final VoidCallback? onTap;

  /// Creates a new [GroundOverlay] object whose values are the same as this instance,
  /// unless overwritten by the specified parameters.
  GroundOverlay copyWith({
    LatLngBounds? position,
    Uint8List? imageByte,
    double? bearing,
    bool? consumeTapEvents,
    double? transparency,
    bool? visibility,
    int? zIndex,
    VoidCallback? onTapParam,
  }) {
    return GroundOverlay(
      groundOverlayId: this.groundOverlayId,
      position: position ?? this.position,
      imageByte: imageByte ?? this.imageByte,
      bearing: bearing ?? this.bearing,
      consumeTapEvents: consumeTapEvents ?? this.consumeTapEvents,
      transparency: transparency ?? this.transparency,
      visibility: visibility ?? this.visibility,
      zIndex: zIndex ?? this.zIndex,
      onTap: onTapParam ?? this.onTap,
    );
  }

  /// Creates a new [GroundOverlay] object whose values are the same as this instance.
  GroundOverlay clone() => copyWith();

  @override
  Object toJson() {
    final Map<String, Object> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('groundOverlayId', groundOverlayId.value);
    addIfPresent('position', position.toJson());
    addIfPresent('imageByte', imageByte);
    addIfPresent('bearing', bearing);
    addIfPresent('consumeTapEvents', consumeTapEvents);
    addIfPresent('transparency', transparency);
    addIfPresent('visibility', visibility);
    addIfPresent('zIndex', zIndex);

    return json;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final GroundOverlay typedOther = other as GroundOverlay;
    return groundOverlayId == typedOther.groundOverlayId &&
        position == typedOther.position &&
        imageByte == typedOther.imageByte &&
        bearing == typedOther.bearing &&
        consumeTapEvents == typedOther.consumeTapEvents &&
        transparency == typedOther.transparency &&
        visibility == typedOther.visibility &&
        zIndex == typedOther.zIndex;
  }

  @override
  int get hashCode => groundOverlayId.hashCode;
}
