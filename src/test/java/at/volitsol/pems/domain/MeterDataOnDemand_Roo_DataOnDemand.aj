package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Meter;
import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MeterDataOnDemand_Roo_DataOnDemand {
    
    declare @type: MeterDataOnDemand: @Component;
    
    private Random MeterDataOnDemand.rnd = new SecureRandom();
    
    private List<Meter> MeterDataOnDemand.data;
    
    public Meter MeterDataOnDemand.getNewTransientMeter(int index) {
        at.volitsol.pems.domain.Meter obj = new at.volitsol.pems.domain.Meter();
        obj.setMeterName("meterName_" + index);
        obj.setMeterValue(new Integer(index).doubleValue());
        return obj;
    }
    
    public Meter MeterDataOnDemand.getSpecificMeter(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Meter obj = data.get(index);
        return Meter.findMeter(obj.getId());
    }
    
    public Meter MeterDataOnDemand.getRandomMeter() {
        init();
        Meter obj = data.get(rnd.nextInt(data.size()));
        return Meter.findMeter(obj.getId());
    }
    
    public boolean MeterDataOnDemand.modifyMeter(Meter obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void MeterDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = at.volitsol.pems.domain.Meter.findMeterEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Meter' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<at.volitsol.pems.domain.Meter>();
        for (int i = 0; i < 10; i++) {
            at.volitsol.pems.domain.Meter obj = getNewTransientMeter(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
