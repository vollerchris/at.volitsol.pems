package at.volitsol.pems.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import at.volitsol.pems.domain.Asset;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Location {

    private String locationName;

    @ManyToOne(targetEntity = Asset.class)
    @JoinColumn
    private Asset assets;
}
