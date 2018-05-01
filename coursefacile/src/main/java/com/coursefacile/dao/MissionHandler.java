package com.coursefacile.dao;

import com.coursefacile.model.Mission;
import org.hibernate.Session;

public class MissionHandler implements IMissionHandler {
    public boolean add(Mission mission) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;

        try {
            session.beginTransaction();
            session.save(mission);
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

    public boolean update(Mission mission) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;
        try {
            session.beginTransaction();
            session.update(mission);
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

    public boolean delete(Mission mission) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;
        try {
            session.beginTransaction();
            Mission missionToDelete = session.get(mission.getClass(), mission.getId());
            session.delete(missionToDelete);
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

    public Mission get(Mission mission) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            // TODO get Mission by mail and pwd
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
}
