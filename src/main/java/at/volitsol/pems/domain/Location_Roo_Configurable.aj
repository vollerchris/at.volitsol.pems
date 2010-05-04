package at.volitsol.pems.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Location_Roo_Configurable {
    
    declare @type: Location: @Configurable;
    
}
