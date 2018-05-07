package com.coursefacile.dao;

import com.coursefacile.model.Mission;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

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

    public Mission get(int missionId) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        Mission mission = null;
        try {
            session.beginTransaction();
            mission = session.get(Mission.class, missionId);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return mission;
    }

    public List<Mission> relatedMissions(int cityId, int missionId) {

        List<Mission> missions = new ArrayList<Mission>();
        Session session = SessionFactoryHelper.getSessionFactory().openSession();

        try {
            session.beginTransaction();
            Query query = session.createSQLQuery("SELECT * FROM mission where city=:city AND isPublished = 1 AND id <>:mission").addEntity(Mission.class);
            query.setParameter("city", cityId);
            query.setParameter("mission", missionId);
            query.setMaxResults(3);
            missions = (List<Mission>) query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        return missions;
    }
}
