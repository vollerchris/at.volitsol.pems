package at.volitsol.pems.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Asset_Roo_Configurable {
    
    declare @type: Asset: @Configurable;
    
}
