package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Meter;
import java.lang.String;
import java.util.Set;

privileged aspect Asset_Roo_JavaBean {
    
    public String Asset.getAssetName() {
        return this.assetName;
    }
    
    public void Asset.setAssetName(String assetName) {
        this.assetName = assetName;
    }
    
    public Set<Meter> Asset.getMeters() {
        return this.meters;
    }
    
    public void Asset.setMeters(Set<Meter> meters) {
        this.meters = meters;
    }
    
}
