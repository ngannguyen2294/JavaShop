package model.utils;
// Generated Mar 19, 2017 8:47:25 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Suppliers generated by hbm2java
 */
public class Suppliers  implements java.io.Serializable {


     private int supplierId;
     private Serializable companyName;
     private Serializable contactName;
     private Serializable contactTitle;
     private Serializable address;
     private Serializable city;
     private Serializable region;
     private Serializable postalCode;
     private Serializable country;
     private Serializable phone;
     private Serializable fax;
     private Serializable homePage;
     private Set productses = new HashSet(0);

    public Suppliers() {
    }

	
    public Suppliers(int supplierId, Serializable companyName) {
        this.supplierId = supplierId;
        this.companyName = companyName;
    }
    public Suppliers(int supplierId, Serializable companyName, Serializable contactName, Serializable contactTitle, Serializable address, Serializable city, Serializable region, Serializable postalCode, Serializable country, Serializable phone, Serializable fax, Serializable homePage, Set productses) {
       this.supplierId = supplierId;
       this.companyName = companyName;
       this.contactName = contactName;
       this.contactTitle = contactTitle;
       this.address = address;
       this.city = city;
       this.region = region;
       this.postalCode = postalCode;
       this.country = country;
       this.phone = phone;
       this.fax = fax;
       this.homePage = homePage;
       this.productses = productses;
    }
   
    public int getSupplierId() {
        return this.supplierId;
    }
    
    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }
    public Serializable getCompanyName() {
        return this.companyName;
    }
    
    public void setCompanyName(Serializable companyName) {
        this.companyName = companyName;
    }
    public Serializable getContactName() {
        return this.contactName;
    }
    
    public void setContactName(Serializable contactName) {
        this.contactName = contactName;
    }
    public Serializable getContactTitle() {
        return this.contactTitle;
    }
    
    public void setContactTitle(Serializable contactTitle) {
        this.contactTitle = contactTitle;
    }
    public Serializable getAddress() {
        return this.address;
    }
    
    public void setAddress(Serializable address) {
        this.address = address;
    }
    public Serializable getCity() {
        return this.city;
    }
    
    public void setCity(Serializable city) {
        this.city = city;
    }
    public Serializable getRegion() {
        return this.region;
    }
    
    public void setRegion(Serializable region) {
        this.region = region;
    }
    public Serializable getPostalCode() {
        return this.postalCode;
    }
    
    public void setPostalCode(Serializable postalCode) {
        this.postalCode = postalCode;
    }
    public Serializable getCountry() {
        return this.country;
    }
    
    public void setCountry(Serializable country) {
        this.country = country;
    }
    public Serializable getPhone() {
        return this.phone;
    }
    
    public void setPhone(Serializable phone) {
        this.phone = phone;
    }
    public Serializable getFax() {
        return this.fax;
    }
    
    public void setFax(Serializable fax) {
        this.fax = fax;
    }
    public Serializable getHomePage() {
        return this.homePage;
    }
    
    public void setHomePage(Serializable homePage) {
        this.homePage = homePage;
    }
    public Set getProductses() {
        return this.productses;
    }
    
    public void setProductses(Set productses) {
        this.productses = productses;
    }




}


