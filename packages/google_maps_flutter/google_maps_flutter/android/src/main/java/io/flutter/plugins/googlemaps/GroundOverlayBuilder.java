package io.flutter.plugins.googlemaps;

import com.google.android.gms.maps.model.BitmapDescriptor;
import com.google.android.gms.maps.model.GroundOverlayOptions;
import com.google.android.gms.maps.model.LatLngBounds;

class GroundOverlayBuilder implements GroundOverlayOptionsSink {

    private final GroundOverlayOptions groundOverlayOptions;
    private boolean consumeTapEvents;

    GroundOverlayBuilder(){
        this.groundOverlayOptions = new GroundOverlayOptions();
    }

    GroundOverlayOptions build() {
        return groundOverlayOptions;
    }

    boolean consumeTapEvents() {
        return consumeTapEvents;
    }
    
    @Override
    public void setPosition(LatLngBounds position) {
        groundOverlayOptions.positionFromBounds(position);
    }

    @Override
    public void setOverlayImage(BitmapDescriptor bitmapDescriptor) {
        groundOverlayOptions.image(bitmapDescriptor);
    }

    @Override
    public void setBearing(float bearing) {
        groundOverlayOptions.bearing(bearing);
    }

    @Override
    public void setConsumeTapEvents(boolean consumeTapEvents) {
        this.consumeTapEvents = consumeTapEvents;
        groundOverlayOptions.clickable(consumeTapEvents);
    }

    @Override
    public void setTransparency(float transparency) {
        groundOverlayOptions.transparency(transparency);
    }

    @Override
    public void setVisibility(boolean visibility) {
        groundOverlayOptions.visible(visibility);
    }

    @Override
    public void setZIndex(float zIndex) {
        groundOverlayOptions.zIndex(zIndex);
    }
}
