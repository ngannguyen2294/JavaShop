/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bussiness;

import java.util.List;
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

    public List<Products> GetAllProductListInfor() {
        try {
            SQLQuery query = session.createSQLQuery("select * from products as p, categories c where p.CategoryID=c.CategoryID");
            query.addEntity(Products.class);
            // query.addJoin("");
            List<Products> rows = query.list();
            return rows;

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return null;
    }

    public int UpdateProduct(Integer productID, String productName, Integer supplierID, Integer categoryID, String quantityPerUnit,
            String unitsInStock, String unitsOnOrder, String image) {
        try {
            SQLQuery query = session.createSQLQuery("update products set ProductName= :productname,SupplierID= :supplierid,"
                    + "CategoryID= :categoryid,QuantityPerUnit =:quantityperunit,UnitsInStock= :unitsinstock, UnitsOnOder= :unitsonorder,"
                    + "Image= :image where ProductID= :productid");
            query.setParameter("productname", productName);
            query.setParameter("supplierid", supplierID);
            query.setParameter("categoryid", categoryID);
            query.setParameter("quantityperunit", quantityPerUnit);
            query.setParameter("unitsinstock", unitsInStock);
            query.setParameter("unitsonorder", unitsOnOrder);
            query.setParameter("image", image);
            query.setParameter("productid", productID);
            return query.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
            return -1;
        }
    }
}
