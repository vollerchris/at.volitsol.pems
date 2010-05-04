package at.volitsol.pems.domain;

import java.lang.String;

privileged aspect Asset_Roo_ToString {
    
    public String Asset.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("AssetName: ").append(getAssetName()).append(", ");
        sb.append("Meters: ").append(getMeters() == null ? "null" : getMeters().size());
        return sb.toString();
    }
    
}
