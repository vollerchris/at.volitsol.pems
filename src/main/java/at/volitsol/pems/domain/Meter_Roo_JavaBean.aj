package at.volitsol.pems.domain;

import java.lang.Double;
import java.lang.String;

privileged aspect Meter_Roo_JavaBean {
    
    public String Meter.getMeterName() {
        return this.meterName;
    }
    
    public void Meter.setMeterName(String meterName) {
        this.meterName = meterName;
    }
    
    public Double Meter.getMeterValue() {
        return this.meterValue;
    }
    
    public void Meter.setMeterValue(Double meterValue) {
        this.meterValue = meterValue;
    }
    
}
