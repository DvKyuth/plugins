package io.flutter.plugins.googlemaps;

import com.google.android.gms.maps.model.BitmapDescriptor;
import com.google.android.gms.maps.model.GroundOverlay;
import com.google.android.gms.maps.model.LatLngBounds;

class GroundOverlayController implements GroundOverlayOptionsSink {

    private final GroundOverlay groundOverlay;
    private final String groundOverlayId;
    private boolean consumeTapEvents;

    GroundOverlayController(GroundOverlay groundOverlay,
                            boolean consumeTapEvents){
        this.groundOverlay = groundOverlay;
        this.groundOverlayId = groundOverlay.getId();
        this.consumeTapEvents = consumeTapEvents;
    }

    void remove(){groundOverlay.remove();}

    @Override
    public void setPosition(LatLngBounds position) {
        groundOverlay.setPositionFromBounds(position);
    }

    @Override
    public void setOverlayImage(BitmapDescriptor bitmapDescriptor) {
        groundOverlay.setImage(bitmapDescriptor);
    }

    @Override
    public void setBearing(float bearing) {
        groundOverlay.setBearing(bearing);
    }

    @Override
    public void setConsumeTapEvents(boolean consumeTapEvents) {
        this.consumeTapEvents = consumeTapEvents;
        groundOverlay.setClickable(consumeTapEvents);
    }

    @Override
    public void setTransparency(float transparency) {
        groundOverlay.setTransparency(transparency);
    }

    @Override
    public void setVisibility(boolean visibility) {
        groundOverlay.setVisible(visibility);
    }

    @Override
    public void setZIndex(float zIndex) {
        groundOverlay.setZIndex(zIndex);
    }

    String getGoogleMapsGroundOverlayId() {
        return groundOverlayId;
    }

    boolean consumeTapEvents() {
        return consumeTapEvents;
    }
    
}
