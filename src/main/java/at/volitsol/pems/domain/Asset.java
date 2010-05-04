package at.volitsol.pems.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import java.util.Set;
import at.volitsol.pems.domain.Meter;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Asset {

    private String assetName;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Meter> meters = new HashSet<Meter>();
}
