package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Meter;
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

privileged aspect Meter_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Meter.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Meter.id;
    
    @Version
    @Column(name = "version")
    private Integer Meter.version;
    
    public Long Meter.getId() {
        return this.id;
    }
    
    public void Meter.setId(Long id) {
        this.id = id;
    }
    
    public Integer Meter.getVersion() {
        return this.version;
    }
    
    public void Meter.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Meter.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Meter.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Meter attached = this.entityManager.find(Meter.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Meter.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Meter.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Meter merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Meter.entityManager() {
        EntityManager em = new Meter().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Meter.countMeters() {
        return (Long) entityManager().createQuery("select count(o) from Meter o").getSingleResult();
    }
    
    public static List<Meter> Meter.findAllMeters() {
        return entityManager().createQuery("select o from Meter o").getResultList();
    }
    
    public static Meter Meter.findMeter(Long id) {
        if (id == null) return null;
        return entityManager().find(Meter.class, id);
    }
    
    public static List<Meter> Meter.findMeterEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Meter o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
