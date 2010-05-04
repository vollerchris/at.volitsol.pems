package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Asset;
import java.lang.String;

privileged aspect Location_Roo_JavaBean {
    
    public String Location.getLocationName() {
        return this.locationName;
    }
    
    public void Location.setLocationName(String locationName) {
        this.locationName = locationName;
    }
    
    public Asset Location.getAssets() {
        return this.assets;
    }
    
    public void Location.setAssets(Asset assets) {
        this.assets = assets;
    }
    
}
