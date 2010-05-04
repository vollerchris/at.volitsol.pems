package at.volitsol.pems.domain;

import java.lang.String;

privileged aspect Location_Roo_ToString {
    
    public String Location.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("LocationName: ").append(getLocationName()).append(", ");
        sb.append("Assets: ").append(getAssets());
        return sb.toString();
    }
    
}
