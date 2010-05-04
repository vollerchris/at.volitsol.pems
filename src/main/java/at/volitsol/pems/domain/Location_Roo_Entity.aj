package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Location;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Location_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Location.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Location.id;
    
    @Version
    @Column(name = "version")
    private Integer Location.version;
    
    public Long Location.getId() {
        return this.id;
    }
    
    public void Location.setId(Long id) {
        this.id = id;
    }
    
    public Integer Location.getVersion() {
        return this.version;
    }
    
    public void Location.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Location.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Location.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Location attached = this.entityManager.find(Location.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Location.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Location.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Location merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Location.entityManager() {
        EntityManager em = new Location().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Location.countLocations() {
        return (Long) entityManager().createQuery("select count(o) from Location o").getSingleResult();
    }
    
    public static List<Location> Location.findAllLocations() {
        return entityManager().createQuery("select o from Location o").getResultList();
    }
    
    public static Location Location.findLocation(Long id) {
        if (id == null) return null;
        return entityManager().find(Location.class, id);
    }
    
    public static List<Location> Location.findLocationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Location o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
