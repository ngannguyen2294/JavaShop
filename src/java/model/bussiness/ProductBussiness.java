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

    public List<Products> getAllProduct() {
        Session session = getSessionFactory().openSession();
        SQLQuery query = session.createSQLQuery("select * from Products");
        query.addEntity(Products.class);
        List<Products> list = query.list();
        return list;
    }

    public List<Products> getAllProductListInfor() {
        try {
            Session session = getSessionFactory().openSession();
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
}
