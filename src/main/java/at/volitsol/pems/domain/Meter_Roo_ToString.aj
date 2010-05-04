package at.volitsol.pems.domain;

import java.lang.String;

privileged aspect Meter_Roo_ToString {
    
    public String Meter.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("MeterName: ").append(getMeterName()).append(", ");
        sb.append("MeterValue: ").append(getMeterValue());
        return sb.toString();
    }
    
}
