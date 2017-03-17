package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.utils.Logins;
import org.hibernate.CacheMode;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import static uitils.HibernateUtil.getSessionFactory;

@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView displayLogin(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }

    @RequestMapping(value = "admin/actionlogin.htm", method = RequestMethod.POST)
    public String executeLogin(HttpServletRequest request, HttpServletResponse response,   @RequestParam(value = "username") String username,@RequestParam(value = "password") String password) {
        try {
           Session session=getSessionFactory().openSession();
           SQLQuery query=session.createSQLQuery("select * from Logins A where A.LOGIN_Username = :username and A.LOGIN_Password = :password");
           query.addEntity(Logins.class);
           query.setParameter("username",username);
           query.setParameter("password",password);
           List<Logins> list=query.list();
           if(list.size()==1)
           {
               request.getSession().setAttribute("Username",username);
               return "redirect:../admin/admin.htm";
           }
           else 
           {
               return "redirect:../admin/login.htm";
           }
           
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:../admin/admin.htm";
    }
     @RequestMapping(value = "admin/logout.htm", method = RequestMethod.GET)
     public String logout(HttpServletRequest request, HttpServletResponse response)
     {
         request.getSession().removeAttribute("Username");
         return "redirect:../admin/login.htm";
     }
}
