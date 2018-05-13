package com.coursefacile.dao;

import com.coursefacile.model.Mission;
import com.coursefacile.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

    public int getScore(User user) {

        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        int score = 0;
        try {
            session.beginTransaction();
            Query query = session.createSQLQuery("SELECT count(*) from mission WHERE owner = :idU OR customer = :idU");
            query.setParameter("idU", user.getId());
            score = ((BigInteger) query.uniqueResult()).intValue();
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        if (user.getAddress() == null || user.getTelephone() == null || user.getDescription() == null || user.getAddress().length() == 0 || !user.isEmailChecked() || user.getTelephone().length() == 0 || user.getDescription().length() == 0)
            score = 0;
        else
            score /= Mission.SCORE_MIN;

        return score;
    }

    public List<Mission> getMissions(String cityId, String date, String from, String to, String minP, String maxP) {
        List<Mission> missions = new ArrayList<Mission>();
        if (cityId.length() != 0 && date.length() != 0) {
            Session session = SessionFactoryHelper.getSessionFactory().openSession();
            try {
                SimpleDateFormat toDb = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                SimpleDateFormat fromHtml = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                session.beginTransaction();
                Date fromParsedDate = new Date();
                Date toParsedDate;
                cityId = "city=" + cityId;
                String fromTo = " AND missionDate ";
                String price = "";
                if (from.length() != 0)
                    fromParsedDate = fromHtml.parse(date + " " + from);
                else
                    fromParsedDate = fromHtml.parse(date + " 00:00");
                if (to.length() != 0)
                    toParsedDate = fromHtml.parse(date + " " + to);
                else
                    toParsedDate = fromHtml.parse(date + " 23:59");
                fromTo += " BETWEEN '" + toDb.format(fromParsedDate) + "' AND '" + toDb.format(toParsedDate) + "'";

                if (minP.length() != 0 && maxP.length() != 0) {
                    price = " AND Price BETWEEN " + minP + " AND " + maxP;
                }
                System.out.println("SELECT * from mission WHERE " + cityId + fromTo);
                Query query = session.createSQLQuery("SELECT * from mission WHERE " + cityId + fromTo + price).addEntity(Mission.class);
                missions = (List<Mission>) query.list();
                session.getTransaction().commit();
            } catch (Exception e) {
                session.getTransaction().rollback();
                e.printStackTrace();
            } finally {
                session.close();
            }
        }
        return missions;
    }
}
