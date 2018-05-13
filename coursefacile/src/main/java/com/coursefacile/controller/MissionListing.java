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
        if (params.containsKey("city_id") && params.containsKey("date")) {
            IMissionHandler missionHandler = new MissionHandler();
            String cityId = request.getParameter("city_id");
            String date = request.getParameter("date");
            String from = "", to = "", minP = "", maxP = "";

            if (params.containsKey("from")) {
                from = request.getParameter("from");
            }
            if (params.containsKey("to")) {
                to = request.getParameter("to");
            }
            if (params.containsKey("minP") && params.containsKey("maxP")) {
                minP = request.getParameter("minP");
                maxP = request.getParameter("maxP");
            }
            if (request.getRequestURI().equals("/coursefacile/get-missions")) {
                List<Mission> missions = missionHandler.getMissions(cityId, date, from, to, minP, maxP, -1, -1);
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
            } else {
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
                int start = request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start"));
                List<Mission> Lmissions;
                if (start == 0) {
                    Lmissions = missionHandler.getMissions(cityId, date, from, to, minP, maxP, start, PAGE_SIZE);
                } else {
                    Lmissions = missionHandler.getMissions(cityId, date, from, to, minP, maxP, (PAGE_SIZE * start) - PAGE_SIZE, start * PAGE_SIZE);

                }

                int missionRowsCount = missionHandler.getCountMissions(cityId, date, from, to, minP, maxP);

                request.setAttribute("paginationMax", missionRowsCount == 0 ? 0 : (missionRowsCount / PAGE_SIZE) + 1);

                request.setAttribute("Lmissions", Lmissions);
                request.setAttribute("test", Lmissions.size());
                request.setAttribute("Date", request.getParameter("date"));

                request.getRequestDispatcher("views/adDisplayPage.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/coursefacile/");
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
