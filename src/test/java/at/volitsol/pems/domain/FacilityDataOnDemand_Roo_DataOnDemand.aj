package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Facility;
import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FacilityDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FacilityDataOnDemand: @Component;
    
    private Random FacilityDataOnDemand.rnd = new SecureRandom();
    
    private List<Facility> FacilityDataOnDemand.data;
    
    public Facility FacilityDataOnDemand.getNewTransientFacility(int index) {
        at.volitsol.pems.domain.Facility obj = new at.volitsol.pems.domain.Facility();
        obj.setFacilityName("facilityName_" + index);
        return obj;
    }
    
    public Facility FacilityDataOnDemand.getSpecificFacility(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Facility obj = data.get(index);
        return Facility.findFacility(obj.getId());
    }
    
    public Facility FacilityDataOnDemand.getRandomFacility() {
        init();
        Facility obj = data.get(rnd.nextInt(data.size()));
        return Facility.findFacility(obj.getId());
    }
    
    public boolean FacilityDataOnDemand.modifyFacility(Facility obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void FacilityDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = at.volitsol.pems.domain.Facility.findFacilityEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Facility' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<at.volitsol.pems.domain.Facility>();
        for (int i = 0; i < 10; i++) {
            at.volitsol.pems.domain.Facility obj = getNewTransientFacility(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
