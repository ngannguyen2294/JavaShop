package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.utils.Logins;
import org.hibernate.Query;
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
           Query query=session.createQuery("from Logins A where A.loginUsername = :username and A.loginPassword = :password");
           query.setParameter("username",username);
           query.setParameter("password",password);
           List<Logins> list=query.list();
           if(list.size()==1)
           {
               return "redirect::../admin/admin.htm";
           }
           else 
           {
               return "redirect::../admin/login.htm";
           }
           
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect::../admin/admin.htm";
    }
}
