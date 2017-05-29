/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bussiness;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.LocalDateTime;
import java.util.Date;
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
        SQLQuery query = session.createSQLQuery("select * from orders order by Status");
        query.addEntity(Orders.class);
        List<Orders> list = query.list();
        return list;
    }
      public BigInteger GetPendingOrder() {
        SQLQuery query = session.createSQLQuery("select count(*) from orders where Status = 'Pending'");
        return (BigInteger) query.list().get(0);
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

    public Boolean UpdateOrder(String orderdate, String shipaddress, String shipcity, String OrderID, String status,String shipcountry,String phone,String email) {
        try {
            session.getTransaction().begin();
            SQLQuery query = session.createSQLQuery("update orders set OrderDate = :orderdate,ShipAddress = :shipaddress,"
                    + "ShipCity = :shipcity,Status=:status,ShipCountry=:shipcountry,Phone=:phone,Email=:email where OrderID = :OrderID");
            query.addEntity(Orders.class);
            query.setParameter("orderdate", orderdate);
            query.setParameter("shipaddress", shipaddress);
            query.setParameter("shipcity", shipcity);
                query.setParameter("shipcountry", shipcountry);
                    query.setParameter("phone", phone);
                        query.setParameter("email", email);
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

    public BigInteger AddnewOrder(String firstname, String lastname, String shipaddress, String shipcity, String shipcountry, String email, String phone) {
        try {
            session.getTransaction().begin();
            SQLQuery query = session.createSQLQuery("INSERT INTO orders(OrderDate,ShipName, ShipAddress, ShipCity, ShipCountry, Email, Phone, Status) VALUES"
                    + "(:oderdate,:shipname,:shipaddress,:shipcity,:shipcountry,:email,:phone,'Pending')");
            query.addEntity(Orders.class);
            query.setParameter("oderdate", new Date());
            query.setParameter("shipname", firstname + " " + lastname);
            query.setParameter("shipaddress", shipaddress);
            query.setParameter("shipcity", shipcity);
            query.setParameter("shipcountry", shipcountry);
            query.setParameter("email", email);
            query.setParameter("phone", phone);
            query.executeUpdate();
            session.getTransaction().commit();

            BigInteger result = (BigInteger) session.createSQLQuery("SELECT LAST_INSERT_ID()")
                    .uniqueResult();
            session.close();
            return result;
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            return null;
        }
    }

    public Boolean AddnewOrderDetail(BigInteger OrderID, Integer ProductID, int UnitPrice, int Quantity) {
        try {
            session = getSessionFactory().openSession();
            session.getTransaction().begin();
            SQLQuery query = session.createSQLQuery("INSERT INTO orderdetails(OrderID, ProductID, UnitPrice, Quantity) values(:orderid,:productid,:unitprice,:quantity)");
            query.addEntity(Orderdetails.class);
            query.setParameter("orderid", OrderID);
            query.setParameter("productid", ProductID);
            query.setParameter("unitprice", UnitPrice);
            query.setParameter("quantity", Quantity);
            query.executeUpdate();
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
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
