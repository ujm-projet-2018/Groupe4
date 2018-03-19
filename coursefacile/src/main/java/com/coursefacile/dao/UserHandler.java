package com.coursefacile.dao;

import com.coursefacile.model.User;
import org.hibernate.Query;
import org.hibernate.Session;


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

    public User get(String email, String pwd) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        User u = null;
        try {
            session.beginTransaction();
            Query query = session.createQuery("from User where email='" + email + "' AND password='" + pwd + "'");
            u = (User) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return u;
    }

}
