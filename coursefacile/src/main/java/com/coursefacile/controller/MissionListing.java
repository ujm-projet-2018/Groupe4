/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.coursefacile.controller;

import com.coursefacile.dao.CityHandler;
import com.coursefacile.dao.ICityHandler;
import com.coursefacile.dao.SessionFactoryHelper;
import com.coursefacile.model.City;
import com.coursefacile.model.Message;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

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
        User user1 = null;
        SQLQuery query = null;
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
        str = str.split("page")[0];
        request.setAttribute("currentUrl", str+"page=");
        try {
            SimpleDateFormat d1 = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat d2 = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = d1.parse(request.getParameter("date"));
            int missionRowsCount =((BigInteger) session1.createSQLQuery("SELECT COUNT(*) FROM mission").uniqueResult()).intValue();
            session1.beginTransaction();
            if (params.containsKey("prix") == false && params.containsKey("prix") == false && params.containsKey("prix") == false) {
                String dateS1 = d2.format(date1) + " 00:00:00";
                String dateS2 = d2.format(date1) + " 23:59:59";
                query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
            } else {
                if (request.getParameter("prix").length() == 0 && request.getParameter("a").length() == 0 && request.getParameter("de").length() == 0) {
                    String dateS1 = d2.format(date1) + " 00:00:00";
                    String dateS2 = d2.format(date1) + " 23:59:59";
                    query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                } else if (request.getParameter("a").length() == 0 && request.getParameter("de").length() == 0) {
                    String dateS1 = d2.format(date1) + " 00:00:00";
                    String dateS2 = d2.format(date1) + " 23:59:59";
                    query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + "  and price =" + Integer.parseInt(request.getParameter("prix")) + " and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                } else if (request.getParameter("prix").length() == 0 && request.getParameter("a").length() == 0) {
                    String dateS1 = d2.format(date1) + " " + request.getParameter("de") + ":00";
                    String dateS2 = d2.format(date1) + " 23:59:59";
                    query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                } else if (request.getParameter("prix").length() == 0) {
                    String dateS1 = d2.format(date1) + " " + request.getParameter("de") + ":00";
                    String dateS2 = d2.format(date1) + " " + request.getParameter("a") + ":00";
                    query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                } else {
                    String dateS1 = d2.format(date1) + " " + request.getParameter("de") + ":00";
                    String dateS2 = d2.format(date1) + " " + request.getParameter("a") + ":00";
                    query = session1.createSQLQuery("select * from mission where city =" + Integer.parseInt(request.getParameter("city_id")) + " and price =" + Integer.parseInt(request.getParameter("prix")) + " and missionDate between '" + dateS1 + "' AND  '" + dateS2 + "'");
                }
            }
            query.addEntity(Mission.class);
            String page = "0";
            if (params.containsKey("page")) {
                page = request.getParameter("page");
            }


            request.setAttribute("paginationMax", missionRowsCount==0 ? 0:(missionRowsCount/PAGE_SIZE)+1);
            query.setFirstResult((Integer.parseInt(page)-1) * PAGE_SIZE);
            query.setMaxResults( PAGE_SIZE);
            Lmissions = query.list();
            request.setAttribute("Lmissions", Lmissions);
            request.setAttribute("Date", request.getParameter("date"));
            session1.getTransaction().commit();

        } catch (Exception e) {
            session1.getTransaction().rollback();
            e.printStackTrace();
        }
        request.getRequestDispatcher("views/adDisplayPage.jsp").forward(request, response);
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
