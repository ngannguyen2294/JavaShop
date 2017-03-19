package controller;

import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.utils.Logins;
import org.hibernate.CacheMode;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import java.security.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import static uitils.HibernateUtil.getSessionFactory;
import uitils.shaSecure;

@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView displayLogin(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }

    @RequestMapping(value = "admin/actionlogin.htm", method = RequestMethod.POST)
    public String executeLogin(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "username") String username, @RequestParam(value = "password") String password) {
        try {
            Session session = getSessionFactory().openSession();
            SQLQuery query = session.createSQLQuery("select * from Logins A where A.Username = :username and A.Passwordhash = :password");
            query.addEntity(Logins.class);
            String passwordhash= shaSecure.get_SHA_512_SecurePassword(password);
            
            query.setParameter("username", username);
            query.setParameter("password", passwordhash);
            List<Logins> list = query.list();
            if (list.size() == 1) {
                Cookie cookie = new Cookie("username", username);
                cookie.setMaxAge(60 * 60);
                response.addCookie(cookie);
                //  request.getSession().setAttribute("Username",username);
                return "redirect:../admin/admin.htm";
            } else {
                return "redirect:../admin/login.htm";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:../admin/admin.htm";
    }

    @RequestMapping(value = "admin/logout.htm", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Cookie ck=new Cookie("username","");  
        ck.setMaxAge(0);  
        response.addCookie(ck);  
        return "redirect:../admin/login.htm";
    }
}
