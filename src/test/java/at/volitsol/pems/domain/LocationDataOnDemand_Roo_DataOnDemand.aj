package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Location;
import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LocationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LocationDataOnDemand: @Component;
    
    private Random LocationDataOnDemand.rnd = new SecureRandom();
    
    private List<Location> LocationDataOnDemand.data;
    
    public Location LocationDataOnDemand.getNewTransientLocation(int index) {
        at.volitsol.pems.domain.Location obj = new at.volitsol.pems.domain.Location();
        obj.setLocationName("locationName_" + index);
        return obj;
    }
    
    public Location LocationDataOnDemand.getSpecificLocation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Location obj = data.get(index);
        return Location.findLocation(obj.getId());
    }
    
    public Location LocationDataOnDemand.getRandomLocation() {
        init();
        Location obj = data.get(rnd.nextInt(data.size()));
        return Location.findLocation(obj.getId());
    }
    
    public boolean LocationDataOnDemand.modifyLocation(Location obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void LocationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = at.volitsol.pems.domain.Location.findLocationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Location' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<at.volitsol.pems.domain.Location>();
        for (int i = 0; i < 10; i++) {
            at.volitsol.pems.domain.Location obj = getNewTransientLocation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
