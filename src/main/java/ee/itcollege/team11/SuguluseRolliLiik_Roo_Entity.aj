// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.team11;

import ee.itcollege.team11.SuguluseRolliLiik;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SuguluseRolliLiik_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager SuguluseRolliLiik.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer SuguluseRolliLiik.version;
    
    public Integer SuguluseRolliLiik.getVersion() {
        return this.version;
    }
    
    public void SuguluseRolliLiik.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void SuguluseRolliLiik.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SuguluseRolliLiik.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SuguluseRolliLiik attached = SuguluseRolliLiik.findSuguluseRolliLiik(this.suguluseRolliLiikId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SuguluseRolliLiik.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SuguluseRolliLiik.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SuguluseRolliLiik SuguluseRolliLiik.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SuguluseRolliLiik merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager SuguluseRolliLiik.entityManager() {
        EntityManager em = new SuguluseRolliLiik().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SuguluseRolliLiik.countSuguluseRolliLiiks() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SuguluseRolliLiik o", Long.class).getSingleResult();
    }
    
    public static List<SuguluseRolliLiik> SuguluseRolliLiik.findAllSuguluseRolliLiiks() {
        return entityManager().createQuery("SELECT o FROM SuguluseRolliLiik o", SuguluseRolliLiik.class).getResultList();
    }
    
    public static SuguluseRolliLiik SuguluseRolliLiik.findSuguluseRolliLiik(Long suguluseRolliLiikId) {
        if (suguluseRolliLiikId == null) return null;
        return entityManager().find(SuguluseRolliLiik.class, suguluseRolliLiikId);
    }
    
    public static List<SuguluseRolliLiik> SuguluseRolliLiik.findSuguluseRolliLiikEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SuguluseRolliLiik o", SuguluseRolliLiik.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}