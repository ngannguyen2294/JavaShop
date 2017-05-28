/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bussiness;

import java.util.List;
import models.Categories;
import org.hibernate.Query;
import models.Products;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import static models.HibernateUtil.getSessionFactory;

/**
 *
 * @author NGANNV
 */
public class ProductBussiness {

    Session session;

    public ProductBussiness() {
        session = getSessionFactory().openSession();
    }

    public List<Products> GetAllProduct() {
        SQLQuery query = session.createSQLQuery("select * from Products");
        query.addEntity(Products.class);
        List<Products> list = query.list();
        return list;
    }

    public List<Products> GetProductByCateID(String id) {
        try {
            SQLQuery query = session.createSQLQuery("select * from products as p where p.CategoryID= :cateid order by p.ProductID");
            query.addEntity(Products.class);
            query.setParameter("cateid", id);
            List<Products> rows = query.list();
            return rows;

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return null;
    }

    public List<Products> GetProductByID(String id) {
        try {
            SQLQuery query = session.createSQLQuery("select * from products as p where p.ProductID= :id ;");
            query.addEntity(Products.class);
            query.setParameter("id", id);
            List<Products> rows = query.list();
            return rows;

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return null;
    }

    public List<Products> GetProductNew() {
        try {
            SQLQuery query = session.createSQLQuery("SELECT * FROM products ORDER BY ProductID DESC LIMIT 5");
            query.addEntity(Products.class);
            List<Products> rows = query.list();
            return rows;

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return null;
    }

    public List<Products> GetAllProductListInfor() {
        try {
            SQLQuery query = session.createSQLQuery("select * from products as p, categories c where p.CategoryID=c.CategoryID order by p.ProductID");
            query.addEntity(Products.class);
            // query.addJoin("");
            List<Products> rows = query.list();
            return rows;

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return null;
    }

    public Boolean DeleteProduct(String productID) {
        try {
            session.getTransaction().begin();
            SQLQuery query = session.createSQLQuery("DELETE FROM products WHERE ProductID = :productid ;");
            query.addEntity(Products.class);
            query.setParameter("productid", productID);
            query.executeUpdate();
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            session.close();
            return false;
        }
    }

    public Boolean DeleteCategory(String cateID) {
        try {
            session.getTransaction().begin();
            SQLQuery query = session.createSQLQuery("DELETE FROM categories WHERE CategoryID = :cateID ;");
            query.addEntity(Categories.class);
            query.setParameter("cateID", cateID);
            query.executeUpdate();
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            session.close();
            return false;
        }
    }

    public Boolean UpdateProduct(String productID, String productName, String supplierID,
            String categoryID, String quantityPerUnit, String unitPrice,
            String unitsInStock, String unitsOnOrder, String image) {
        try {
            session.getTransaction().begin();
            //   SQLQuery query = session.createSQLQuery("update `products` set ProductName=123 where ProductID='1'");
            SQLQuery query = session.createSQLQuery("update products set ProductName = :productname,SupplierID = :supplierid,"
                    + "CategoryID = :categoryid,QuantityPerUnit = :quantityperunit,UnitPrice = :unitprice,"
                    + "UnitsInStock = :unitsinstock, UnitsOnOrder = :unitsonorder,"
                    + "Image = :image where ProductID = :productid ;");
            query.addEntity(Products.class);
            query.setParameter("productname", productName);
            query.setParameter("supplierid", supplierID);
            query.setParameter("categoryid", categoryID);
            query.setParameter("quantityperunit", quantityPerUnit);
            query.setParameter("unitprice", unitPrice);
            query.setParameter("unitsinstock", unitsInStock);
            query.setParameter("unitsonorder", unitsOnOrder);
            query.setParameter("image", image.replace("../", ""));
            query.setParameter("productid", productID);
            query.executeUpdate();
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public Boolean UpdateCategory(String cateID, String cateName, String description, byte[] image) {
        try {
            session.getTransaction().begin();
            SQLQuery query = session.createSQLQuery("update categories set CategoryName = :cateName,Description = :description,"
                    + "Picture = :image where CategoryID = :cateID ;");
            query.addEntity(Categories.class);
            query.setParameter("cateName", cateName);
            query.setParameter("cateID", cateID);
            query.setParameter("description", description);
            query.setParameter("image", image);
            query.executeUpdate();
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public Boolean AddProduct(String productID, String productName, String supplierID,
            String categoryID, String quantityPerUnit, String unitPrice,
            String unitsInStock, String unitsOnOrder, String image) {
        try {
            session.getTransaction().begin();
            //   SQLQuery query = session.createSQLQuery("update `products` set ProductName=123 where ProductID='1'");
            SQLQuery query = session.createSQLQuery("INSERT INTO products"
                    + "(ProductName, SupplierID, CategoryID, QuantityPerUnit,UnitPrice, UnitsInStock, UnitsOnOrder, Image,UnitPriceSale)"
                    + " values (:productname,:supplierid,:categoryid,:quantityperunit,:unitprice,:unitsinstock,"
                    + ":unitsonorder,:image,1)");
            query.addEntity(Products.class);
            query.setParameter("productname", productName);
            query.setParameter("supplierid", supplierID);
            query.setParameter("categoryid", categoryID);
            query.setParameter("quantityperunit", quantityPerUnit);
            query.setParameter("unitprice", unitPrice);
            query.setParameter("unitsinstock", unitsInStock);
            query.setParameter("unitsonorder", unitsOnOrder);
            query.setParameter("image", image);
            query.executeUpdate();
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            session.close();
            return false;
        }
    }

    public Boolean AddCategory(String cateName, String description,
            byte[] image) {
        try {
            session.getTransaction().begin();
            SQLQuery query = session.createSQLQuery("INSERT INTO categories(CategoryName, Description, Picture)"
                    + " values (:cateName,:description,:image )");
            query.addEntity(Categories.class);
            query.setParameter("cateName", cateName);
            query.setParameter("description", description);
            query.setParameter("image", image);
            query.executeUpdate();
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            session.close();
            return false;
        }
    }
}
