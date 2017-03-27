/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bussiness;

import java.util.List;
import model.utils.Suppliers;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import static uitils.HibernateUtil.getSessionFactory;

/**
 *
 * @author NGANNV
 */
public class SupplierBussiness {
      public List<Suppliers> getAllSupplier() {
        Session session = getSessionFactory().openSession();
        SQLQuery query = session.createSQLQuery("select * from Suppliers");
        query.addEntity(Suppliers.class);
        List<Suppliers> list = query.list();
        return list;
    }
}
