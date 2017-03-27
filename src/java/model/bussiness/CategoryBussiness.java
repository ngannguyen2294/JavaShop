/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bussiness;

import java.util.List;
import model.utils.Categories;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import static uitils.HibernateUtil.getSessionFactory;

/**
 *
 * @author NGANNV
 */
public class CategoryBussiness {
      public List<Categories> getAllCategories() {
        Session session = getSessionFactory().openSession();
        SQLQuery query = session.createSQLQuery("select * from Categories");
        query.addEntity(Categories.class);
        List<Categories> list = query.list();
        return list;
    }
}
