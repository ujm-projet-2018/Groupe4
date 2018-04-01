package com.coursefacile.dao;

import com.coursefacile.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;


public class UserHandler implements IUserHandler {
    public boolean add(User user) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;
        try {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
            check = true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;

    }

    public boolean update(User user) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;
        try {
            session.beginTransaction();
            session.update(user);
            session.getTransaction().commit();
            check = true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;
    }

    public boolean delete(User user) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;
        try {
            session.beginTransaction();
            User userToDelete = session.get(user.getClass(), user.getId());
            session.delete(userToDelete);
            session.getTransaction().commit();
            check = true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;
    }

    public boolean authentificate(HttpServletRequest request) {
        boolean check = false;
        Map<String, String[]> params = request.getParameterMap();
        if (params.containsKey("login_email") && params.containsKey("login_pwd")) {
            String email = request.getParameter("login_email");
            String pwd = request.getParameter("login_pwd");
            if (email.length() != 0 && pwd.length() != 0) {
                Session session = SessionFactoryHelper.getSessionFactory().openSession();
                try {
                    session.beginTransaction();
                    Query query = session.createQuery("from User where email='" + email + "' AND password='" + Util.hashString(pwd) + "'");
                    User user = (User) query.uniqueResult();
                    session.getTransaction().commit();
                    request.getSession().setAttribute("user", user);
                    check = true;
                } catch (Exception e) {
                    session.getTransaction().rollback();
                    e.printStackTrace();
                } finally {
                    session.close();
                }
            }
        }
        return check;
    }

    public boolean register(HttpServletRequest request) {
        Map<String, String[]> params = request.getParameterMap();
        if (params.containsKey("first_name") && params.containsKey("last_name") && params.containsKey("email") && params.containsKey("pwd") && params.containsKey("confirm_pwd") && params.containsKey("description")) {
            String fName = request.getParameter("first_name"),
                    lName = request.getParameter("last_name"),
                    email = request.getParameter("email"),
                    pwd = request.getParameter("pwd"),
                    confirmPwd = request.getParameter("confirm_pwd"),
                    description = request.getParameter("description");
            if (fName.trim().length() > 0 && lName.trim().length() > 0 && email.trim().length() > 0 && pwd.trim().length() > 0 && confirmPwd.trim().length() > 0) {
                if (pwd.equals(confirmPwd)) {
                    User newUser = new User();
                    newUser.setFname(fName);
                    newUser.setLname(lName);
                    newUser.setEmail(email);
                    newUser.setEmailChecked(false);
                    newUser.setRegisterDate(new Date());
                    newUser.setPassword(Util.hashString(pwd));
                    if (description.trim().length() > 0) newUser.setDescription(description);
                    add(newUser);
                    request.getSession().setAttribute("user", newUser);
                    IVerificationTokenHandler verificationTokenHandler = new VerificationTokenHandler();
                    verificationTokenHandler.sendVerificationMail(newUser);
                    return true;
                }
            }
        }
        return false;
    }

    public User get(int id) {
        User user = null;
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            user = session.get(User.class, id);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }

    public boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("user") != null;
    }

    public User getLoggedInUser(HttpServletRequest request) {
        if (isLoggedIn(request))
            return (User) request.getSession().getAttribute("user");
        return null;
    }


}
