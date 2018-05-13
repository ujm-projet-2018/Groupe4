/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.coursefacile.controller;

import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.SessionFactoryHelper;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;

import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * @author mzemroun
 */
public class MissionListing extends HttpServlet {

    private final int PAGE_SIZE = 10;
    Session session1 = SessionFactoryHelper.getSessionFactory().openSession();
    List<Mission> Lmissions = new ArrayList<Mission>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        if (request.getRequestURI().equals("/coursefacile/get-missions")) {
            if (params.containsKey("city_id") && params.containsKey("date")) {
                IMissionHandler missionHandler = new MissionHandler();
                String cityId = request.getParameter("city_id");
                String date = request.getParameter("date");
                String from = "", to = "", minP = "", maxP = "";

                if (params.containsKey("from"))
                    from = request.getParameter("from");
                if (params.containsKey("to"))
                    to = request.getParameter("to");
                if (params.containsKey("minP") && params.containsKey("maxP")) {
                    minP = request.getParameter("minP");
                    maxP = request.getParameter("maxP");
                }

                List<Mission> missions = missionHandler.getMissions(cityId, date, from, to, minP, maxP);
                request.setCharacterEncoding("utf8");
                response.setContentType("application/json");
                JSONArray jsonArray = new JSONArray();
                for (int i = 0; i < missions.size(); i++) {
                    JSONObject jsonMission = new JSONObject();
                    Mission m = missions.get(i);
                    jsonMission.put("missionId", m.getId());
                    jsonMission.put("missionName", m.getName());
                    jsonMission.put("missionKeyWord", m.getDestination() + " shop " + m.getCity().getName());
                    jsonMission.put("missionDest", m.getDestination() + " ");
                    jsonMission.put("ownerAdress", m.getOwner().getAddress());
                    jsonMission.put("missionDescription", m.getDescription());
                    jsonMission.put("missionPrice", m.getPrice() + " €");
                    jsonMission.put("ownerId", m.getOwner().getId());
                    jsonMission.put("place", "");
                    jsonArray.put(jsonMission);
                }
                response.getWriter().println(jsonArray.toString());
            }

        } else {
            User user1 = null;
            SQLQuery query = null;
            SQLQuery query2 = null;
            String str = request.getRequestURL() + "?";
            Enumeration<String> paramNames = request.getParameterNames();
            while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();
                String[] paramValues = request.getParameterValues(paramName);
                for (int i = 0; i < paramValues.length; i++) {
                    String paramValue = paramValues[i];
                    str = str + paramName + "=" + paramValue;
                }
                str = str + "&";

            }
            System.out.println(request.getParameter("city_id"));
            str = str.split("start")[0];
            request.setAttribute("currentUrl", str + "start=");
            try {
                SimpleDateFormat d1 = new SimpleDateFormat("dd/MM/yyyy");
                SimpleDateFormat d2 = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat d3 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                SimpleDateFormat d4 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date1 = d1.parse(request.getParameter("date"));


                session1.beginTransaction();
                if (params.containsKey("prix") == false && params.containsKey("prix") == false && params.containsKey("prix") == false) {
                    String dateS1 = d2.format(date1) + " 00:00:00";
                    String dateS2 = d2.format(date1) + " 23:59:59";
                    query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and  isPublished = 1 and  missionDate between '" + dateS1 + "' AND '" + dateS2 + "'");
                    query2 = session1.createSQLQuery("select count(*) from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and  isPublished = 1 and  missionDate between '" + dateS1 + "' AND '" + dateS2 + "'");
                } else {
                    if (request.getParameter("prix").length() == 0 && request.getParameter("a").length() == 0 && request.getParameter("de").length() == 0) {
                        String dateS1 = d2.format(date1) + " 00:00:00";
                        String dateS2 = d2.format(date1) + " 23:59:59";
                        query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and isPublished = 1 and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                        query2 = session1.createSQLQuery("select count(*) from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and isPublished = 1 and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                    } else if (request.getParameter("a").length() == 0 && request.getParameter("de").length() == 0) {
                        String dateS1 = d2.format(date1) + " 00:00:00";
                        String dateS2 = d2.format(date1) + " 23:59:59";
                        query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + "  and isPublished = 1 and price >=" + Integer.parseInt(request.getParameter("prix")) + " and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                        query2 = session1.createSQLQuery("select count(*) from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + "  and isPublished = 1 and price =" + Integer.parseInt(request.getParameter("prix")) + " and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                    } else if (request.getParameter("prix").length() == 0 && request.getParameter("a").length() == 0) {
                        Date date2 = d3.parse(request.getParameter("de"));
                        String dateS1 = d4.format(date2);
                        String dateS2 = d2.format(date1) + " 23:59:59";
                        query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and isPublished = 1 and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                        query2 = session1.createSQLQuery("select count(*) from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and isPublished = 1 and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                    } else if (request.getParameter("prix").length() == 0) {
                        Date date2 = d3.parse(request.getParameter("de"));
                        Date date3 = d3.parse(request.getParameter("a"));
                        String dateS1 = d4.format(date2);
                        String dateS2 = d4.format(date3);
                        query2 = session1.createSQLQuery("select count(*) from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and isPublished = 1 and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                        query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and isPublished = 1 and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                    } else {
                        Date date2 = d3.parse(request.getParameter("de"));
                        Date date3 = d3.parse(request.getParameter("a"));
                        String dateS1 = d4.format(date2);
                        String dateS2 = d4.format(date3);
                        query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and isPublished = 1 and price >=" + Integer.parseInt(request.getParameter("prix")) + " and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                        query2 = session1.createSQLQuery("select count(*) from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and isPublished = 1 and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                    }
                }
                int missionRowsCount = ((BigInteger) query2.uniqueResult()).intValue();
                query.addEntity(Mission.class);
                String page = "0";
                if (params.containsKey("page")) {
                    page = request.getParameter("page");
                }

                request.setAttribute("paginationMax", missionRowsCount == 0 ? 0 : (missionRowsCount / PAGE_SIZE) + 1);
                int start = request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start"));
                System.out.println(start);
                if (start == 0) {
                    query.setFirstResult(start);
                    query.setMaxResults(PAGE_SIZE);
                } else {
                    query.setFirstResult((PAGE_SIZE * start) - PAGE_SIZE);
                    query.setMaxResults(start * PAGE_SIZE);
                }
                Lmissions = query.list();
                request.setAttribute("Lmissions", Lmissions);
                request.setAttribute("test", Lmissions.size());
                request.setAttribute("Date", request.getParameter("date"));
                session1.getTransaction().commit();

            } catch (Exception e) {
                session1.getTransaction().rollback();
                e.printStackTrace();
            }
            request.getRequestDispatcher("views/adDisplayPage.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
