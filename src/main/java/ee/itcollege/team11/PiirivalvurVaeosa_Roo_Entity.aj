// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.team11;

import ee.itcollege.team11.PiirivalvurVaeosa;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PiirivalvurVaeosa_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager PiirivalvurVaeosa.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer PiirivalvurVaeosa.version;
    
    public Integer PiirivalvurVaeosa.getVersion() {
        return this.version;
    }
    
    public void PiirivalvurVaeosa.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void PiirivalvurVaeosa.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PiirivalvurVaeosa.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PiirivalvurVaeosa attached = PiirivalvurVaeosa.findPiirivalvurVaeosa(this.piirivalvurVaeosasId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PiirivalvurVaeosa.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PiirivalvurVaeosa.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PiirivalvurVaeosa PiirivalvurVaeosa.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PiirivalvurVaeosa merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager PiirivalvurVaeosa.entityManager() {
        EntityManager em = new PiirivalvurVaeosa().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PiirivalvurVaeosa.countPiirivalvurVaeosas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PiirivalvurVaeosa o", Long.class).getSingleResult();
    }
    
    public static List<PiirivalvurVaeosa> PiirivalvurVaeosa.findAllPiirivalvurVaeosas() {
        return entityManager().createQuery("SELECT o FROM PiirivalvurVaeosa o", PiirivalvurVaeosa.class).getResultList();
    }
    
    public static PiirivalvurVaeosa PiirivalvurVaeosa.findPiirivalvurVaeosa(Long piirivalvurVaeosasId) {
        if (piirivalvurVaeosasId == null) return null;
        return entityManager().find(PiirivalvurVaeosa.class, piirivalvurVaeosasId);
    }
    
    public static List<PiirivalvurVaeosa> PiirivalvurVaeosa.findPiirivalvurVaeosaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PiirivalvurVaeosa o", PiirivalvurVaeosa.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
