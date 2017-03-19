package model.utils;
// Generated Mar 19, 2017 8:47:25 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Region generated by hbm2java
 */
public class Region  implements java.io.Serializable {


     private int regionId;
     private Serializable regionDescription;
     private Set territorieses = new HashSet(0);

    public Region() {
    }

	
    public Region(int regionId, Serializable regionDescription) {
        this.regionId = regionId;
        this.regionDescription = regionDescription;
    }
    public Region(int regionId, Serializable regionDescription, Set territorieses) {
       this.regionId = regionId;
       this.regionDescription = regionDescription;
       this.territorieses = territorieses;
    }
   
    public int getRegionId() {
        return this.regionId;
    }
    
    public void setRegionId(int regionId) {
        this.regionId = regionId;
    }
    public Serializable getRegionDescription() {
        return this.regionDescription;
    }
    
    public void setRegionDescription(Serializable regionDescription) {
        this.regionDescription = regionDescription;
    }
    public Set getTerritorieses() {
        return this.territorieses;
    }
    
    public void setTerritorieses(Set territorieses) {
        this.territorieses = territorieses;
    }




}


