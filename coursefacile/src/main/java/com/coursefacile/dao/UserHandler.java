package com.coursefacile.dao;

import com.coursefacile.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
            User newUser = session.get(user.getClass(), user.getId());
            session.update(newUser);
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
        if(params.containsKey("email") && params.containsKey("pwd")) {
            String email = request.getParameter("email");
            String pwd = request.getParameter("pwd");
            if (email.length() != 0 && pwd.length() != 0) {
                Session session = SessionFactoryHelper.getSessionFactory().openSession();
                try {
                    session.beginTransaction();
                    Query query = session.createQuery("from User where email='" + email + "' AND password='" + hashPwd(pwd) + "'");
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
        if (params.containsKey("first-name") && params.containsKey("first-name") && params.containsKey("last-name") && params.containsKey("email") && params.containsKey("pwd") && params.containsKey("confirm-pwd") && params.containsKey("description")) {
            String fName = request.getParameter("first-name"),
                    lName = request.getParameter("last-name"),
                    email = request.getParameter("email"),
                    pwd = request.getParameter("pwd"),
                    confirmPwd = request.getParameter("confirm-pwd"),
                    description = request.getParameter("description");
            if (fName.trim().length() > 0 && lName.trim().length() > 0 && email.trim().length() > 0 && pwd.trim().length() > 0 && confirmPwd.trim().length() > 0) {
                if (pwd.equals(confirmPwd)) {
                    User newUser = new User();
                    newUser.setFname(fName);
                    newUser.setLname(lName);
                    newUser.setEmail(email);

                    newUser.setPassword(hashPwd(pwd));
                    if (description.trim().length() > 0) newUser.setDescription(description);
                    add(newUser);
                    request.getSession().setAttribute("user", newUser);
                    return true;
                }
            }
        }
        return false;
    }

    public User get(int id) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        return null;
    }

    public boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("user") != null;
    }

    public User getLoggedInUser(HttpServletRequest request) {
        if(isLoggedIn(request))
            return (User)request.getSession().getAttribute("user");
        return null;
    }

    private String hashPwd(String passwordToHash){
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(passwordToHash.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        return generatedPassword;
    }
}
