package at.volitsol.pems.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Facility_Roo_Configurable {
    
    declare @type: Facility: @Configurable;
    
}
