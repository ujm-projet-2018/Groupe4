package com.coursefacile.dao;

import com.coursefacile.model.City;
import com.coursefacile.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public class CityHandler implements ICityHandler {
    public  String filterCities(HttpServletRequest request) {
        String result = "";
        Map<String, String[]> params = request.getParameterMap();
        if (params.containsKey("city")) {
            String cityOrPostalCode = request.getParameter("city");
            if (cityOrPostalCode.length() != 0) {
                Session session = SessionFactoryHelper.getSessionFactory().openSession();
                try {
                    session.beginTransaction();
                    Query query = session.createQuery("FROM City  WHERE name LIKE :city OR postalCode LIKE :city");
//                    Query query = session.createSQLQuery("SELECT GROUP_CONCAT(ville_nom,' ',ville_code_postal) FROM villes_france");
                    query.setString("city", "%" + cityOrPostalCode + "%");
                    query.setMaxResults(10);
                    List resultList = query.list();
                    for(int i=0;i<resultList.size();i++){
                        City city = (City)resultList.get(i);
                        result += "{\"id\":"+city.getId()+", \"title\":\""+city.getName()+" "+city.getPostalCode()+"\"}";
                        if(i<resultList.size()-1)
                            result+=",";
                    }
                    System.out.println(result);

//                    result = (String) query.list().get(0);
                    session.getTransaction().commit();
                } catch (Exception e) {
                    session.getTransaction().rollback();
                    e.printStackTrace();
                } finally {
                    session.close();
                }
            }
        }
        return "["+result+"]";
    }

    public City getCity(int id) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        City city = null;
        try {
            session.beginTransaction();
             city = session.get(City.class, id);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return city;
    }
}
