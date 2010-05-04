package at.volitsol.pems.domain;

import at.volitsol.pems.domain.Asset;
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

privileged aspect Asset_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Asset.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Asset.id;
    
    @Version
    @Column(name = "version")
    private Integer Asset.version;
    
    public Long Asset.getId() {
        return this.id;
    }
    
    public void Asset.setId(Long id) {
        this.id = id;
    }
    
    public Integer Asset.getVersion() {
        return this.version;
    }
    
    public void Asset.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Asset.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Asset.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Asset attached = this.entityManager.find(Asset.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Asset.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Asset.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Asset merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Asset.entityManager() {
        EntityManager em = new Asset().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Asset.countAssets() {
        return (Long) entityManager().createQuery("select count(o) from Asset o").getSingleResult();
    }
    
    public static List<Asset> Asset.findAllAssets() {
        return entityManager().createQuery("select o from Asset o").getResultList();
    }
    
    public static Asset Asset.findAsset(Long id) {
        if (id == null) return null;
        return entityManager().find(Asset.class, id);
    }
    
    public static List<Asset> Asset.findAssetEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Asset o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
