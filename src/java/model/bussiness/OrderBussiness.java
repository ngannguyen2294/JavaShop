/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bussiness;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import java.util.Set;
import static models.HibernateUtil.getSessionFactory;
import models.Orderdetails;
import models.Orders;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author NGANNV
 */
public class OrderBussiness {

    Session session;

    public OrderBussiness() {
        session = getSessionFactory().openSession();
    }

    public List<Orders> GetAllOrder() {
        SQLQuery query = session.createSQLQuery("select * from orders");
        query.addEntity(Orders.class);
        List<Orders> list = query.list();
        return list;
    }

    public Orders GetOrderbyID(String OrderID) {
        SQLQuery query = session.createSQLQuery("select * from orders where OrderID = :orderid");
        query.addEntity(Orders.class);
        query.setParameter("orderid", OrderID);
        List<Orders> list = query.list();
        return list.get(0);
    }

    public String GetStatusLabelHtml(String status) {
        switch (status) {
            case "Pending":
                return "label-danger";
            case "Processing":
                return "label-info";
            case "Complete":
                return "label-success";
        }
        return "";
    }

    public Boolean UpdateOrder(String orderdate, String shipaddress, String shipcity, String OrderID,String status) {
        try {
            session.getTransaction().begin();
            SQLQuery query = session.createSQLQuery("update orders set OrderDate = :orderdate,ShipAddress = :shipaddress,"
                    + "ShipCity = :shipcity,Status=:status where OrderID = :OrderID");
            query.addEntity(Orders.class);
            query.setParameter("orderdate", orderdate);
            query.setParameter("shipaddress", shipaddress);
            query.setParameter("shipcity", shipcity);
            query.setParameter("OrderID", OrderID);
             query.setParameter("status", status);
            query.executeUpdate();
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public BigDecimal GetTotalAmount(Orders order) {
        Set<Orderdetails> od = order.getOrderdetailses();
        BigDecimal total = new BigDecimal(BigInteger.ZERO);
        for (Orderdetails orderdetail : od) {
            BigDecimal quantity = new BigDecimal(orderdetail.getQuantity());
            total = total.add(quantity.multiply(orderdetail.getUnitPrice()));
        }
        return total;
    }
}
