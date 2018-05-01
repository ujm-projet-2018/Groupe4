package com.coursefacile.dao;

import com.coursefacile.model.Message;
import com.coursefacile.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

public class MessageHandler implements IMessageHandler {

    public boolean add(Message message) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;
        try {
            session.beginTransaction();
            session.save(message);
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

    public boolean update(Message message) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;
        try {
            session.beginTransaction();
            session.update(message);
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

    public boolean delete(Message message) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;
        try {
            session.beginTransaction();
            Message messageToDelete = session.get(message.getClass(), message.getId());
            session.delete(messageToDelete);
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

    public Message get(int messageId) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        Message message = null;
        try {
            session.beginTransaction();
            message = session.get(Message.class, messageId);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return message;
    }

    public List<Message> getContacts(int userId, String userName, int start, int end) {
        System.out.println("Start   " + start);
        System.out.println("end   " + end);
        List<User> users;
        List<Message> messages = new ArrayList<Message>();
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Query query = session.createSQLQuery("SELECT DISTINCT * from user where (user.id = Any(SELECT DISTINCT message.receiver FROM message WHERE message.sender = :userId) OR user.id = Any (SELECT DISTINCT message.sender FROM message WHERE message.receiver = :userId)) AND (user.fname LIKE '%" + userName + "%' OR user.lname LIKE '%" + userName + "%')")
                    .addEntity("user", User.class);
            query.setParameter("userId", userId);
            query.setFirstResult(start);
            query.setMaxResults(end);
            users = (List<User>) query.list();
            session.getTransaction().commit();

            if (users.size() != 0) {
                for (int i = 0; i < users.size(); i++) {
                    session.beginTransaction();
                    query = session.createSQLQuery("SELECT DISTINCT id FROM message WHERE (message.sender = :currentUser AND message.receiver = :otherUser) OR (message.sender = :otherUser AND message.receiver = :currentUser) ORDER BY date DESC");
                    query.setParameter("currentUser", userId);
                    query.setParameter("otherUser", users.get(i).getId());
                    query.setMaxResults(1);
                    Integer idMessage = (Integer) query.uniqueResult();
                    session.getTransaction().commit();
//                    System.out.println(message.getDate());

                    if (idMessage != null)
                        messages.add(get(idMessage));
                }
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return messages;
    }

    public int consPagination(int userId) {
        int count = 0;

        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Query query = session.createSQLQuery("SELECT DISTINCT COUNT(*) from user where user.id = Any(SELECT DISTINCT message.receiver FROM message WHERE message.sender = :userId) OR user.id = Any (SELECT DISTINCT message.sender FROM message WHERE message.receiver = :userId)");
            query.setParameter("userId", userId);
            count = query.uniqueResult() == null ? 0 : ((BigInteger) query.uniqueResult()).intValue();
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        return count;
    }

    public List<Message> getMessages(int sender, int receiver, int start, int end) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        List<Message> messages = null;
        try {
            session.beginTransaction();
            Query query = session.createSQLQuery("SELECT DISTINCT * FROM message WHERE (sender=:sender AND receiver=:receiver) OR (sender=:receiver AND receiver=:sender) ORDER BY date ASC").addEntity("message", Message.class);
            query.setParameter("sender", sender);
            query.setParameter("receiver", receiver);
            query.setFirstResult(start);
            query.setMaxResults(end);
            messages = (List<Message>) query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return messages;
    }

}
