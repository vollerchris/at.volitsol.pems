package at.volitsol.pems.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Meter_Roo_Configurable {
    
    declare @type: Meter: @Configurable;
    
}
