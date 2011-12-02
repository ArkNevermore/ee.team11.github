// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.team11;

import ee.itcollege.team11.PiiripunktiOrgYksus;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PiiripunktiOrgYksus_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager PiiripunktiOrgYksus.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer PiiripunktiOrgYksus.version;
    
    public Integer PiiripunktiOrgYksus.getVersion() {
        return this.version;
    }
    
    public void PiiripunktiOrgYksus.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void PiiripunktiOrgYksus.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PiiripunktiOrgYksus.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PiiripunktiOrgYksus attached = PiiripunktiOrgYksus.findPiiripunktiOrgYksus(this.piiripunktiOrgYksusId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PiiripunktiOrgYksus.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PiiripunktiOrgYksus.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PiiripunktiOrgYksus PiiripunktiOrgYksus.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PiiripunktiOrgYksus merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager PiiripunktiOrgYksus.entityManager() {
        EntityManager em = new PiiripunktiOrgYksus().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PiiripunktiOrgYksus.countPiiripunktiOrgYksuses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PiiripunktiOrgYksus o", Long.class).getSingleResult();
    }
    
    public static List<PiiripunktiOrgYksus> PiiripunktiOrgYksus.findAllPiiripunktiOrgYksuses() {
        return entityManager().createQuery("SELECT o FROM PiiripunktiOrgYksus o", PiiripunktiOrgYksus.class).getResultList();
    }
    
    public static PiiripunktiOrgYksus PiiripunktiOrgYksus.findPiiripunktiOrgYksus(Long piiripunktiOrgYksusId) {
        if (piiripunktiOrgYksusId == null) return null;
        return entityManager().find(PiiripunktiOrgYksus.class, piiripunktiOrgYksusId);
    }
    
    public static List<PiiripunktiOrgYksus> PiiripunktiOrgYksus.findPiiripunktiOrgYksusEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PiiripunktiOrgYksus o", PiiripunktiOrgYksus.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
