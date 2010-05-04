package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Location;
import java.lang.String;
import java.util.Set;

privileged aspect Facility_Roo_JavaBean {
    
    public String Facility.getFacilityName() {
        return this.facilityName;
    }
    
    public void Facility.setFacilityName(String facilityName) {
        this.facilityName = facilityName;
    }
    
    public Set<Location> Facility.getLocations() {
        return this.locations;
    }
    
    public void Facility.setLocations(Set<Location> locations) {
        this.locations = locations;
    }
    
}
