package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Facility;
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

privileged aspect Facility_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Facility.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Facility.id;
    
    @Version
    @Column(name = "version")
    private Integer Facility.version;
    
    public Long Facility.getId() {
        return this.id;
    }
    
    public void Facility.setId(Long id) {
        this.id = id;
    }
    
    public Integer Facility.getVersion() {
        return this.version;
    }
    
    public void Facility.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Facility.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Facility.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Facility attached = this.entityManager.find(Facility.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Facility.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Facility.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Facility merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Facility.entityManager() {
        EntityManager em = new Facility().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Facility.countFacilitys() {
        return (Long) entityManager().createQuery("select count(o) from Facility o").getSingleResult();
    }
    
    public static List<Facility> Facility.findAllFacilitys() {
        return entityManager().createQuery("select o from Facility o").getResultList();
    }
    
    public static Facility Facility.findFacility(Long id) {
        if (id == null) return null;
        return entityManager().find(Facility.class, id);
    }
    
    public static List<Facility> Facility.findFacilityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Facility o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
