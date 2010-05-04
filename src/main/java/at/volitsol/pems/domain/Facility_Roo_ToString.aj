package at.volitsol.pems.domain;

import java.lang.String;

privileged aspect Facility_Roo_ToString {
    
    public String Facility.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("FacilityName: ").append(getFacilityName()).append(", ");
        sb.append("Locations: ").append(getLocations() == null ? "null" : getLocations().size());
        return sb.toString();
    }
    
}
