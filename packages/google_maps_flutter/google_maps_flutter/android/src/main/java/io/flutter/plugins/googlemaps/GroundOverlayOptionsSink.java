package io.flutter.plugins.googlemaps;

import com.google.android.gms.maps.model.BitmapDescriptor;
import com.google.android.gms.maps.model.LatLngBounds;

interface GroundOverlayOptionsSink {
    
    void setPosition(LatLngBounds position);
    
    void setOverlayImage(BitmapDescriptor bitmapDescriptor);
    
    void setBearing(float bearing);
    
    void setConsumeTapEvents(boolean consumeTapEvents);
    
    void setTransparency(float transparency);
    
    void setVisibility(boolean visibility);

    void setZIndex(float zIndex);
}
