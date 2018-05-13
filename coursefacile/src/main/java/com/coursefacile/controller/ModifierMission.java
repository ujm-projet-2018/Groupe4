package com.coursefacile.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coursefacile.dao.*;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;
import com.coursefacile.utilities.Util;
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
 * @author walid
 */

public class ModifierMission extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     *
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        Map<String, String[]> params = request.getParameterMap();
        String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
        String[] pathParts = pathInfo.split("/");
        System.out.println(request.getRequestURI());
        if (pathParts.length == 2) {
            if (UserHandler.isLoggedIn(request)) {
                if (params.containsKey("missionName") && params.containsKey("city_id") && params.containsKey("date") && params.containsKey("time") && params.containsKey("supermarche") && params.containsKey("description") && params.containsKey("remuneration")) {
                    String param = pathParts[1];
                    int idM;
                    try {
                        idM = Integer.parseInt(param);
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendRedirect("/");
                        return;
                    }
                    IMissionHandler missionHandler = new MissionHandler();
                    Mission myMission = missionHandler.get(idM);
                    if (UserHandler.getLoggedInUser(request).getId() == myMission.getOwner().getId()) {
                        String missionName = request.getParameter("missionName").trim();
                        String city_id = request.getParameter("city_id").trim();
                        String date = request.getParameter("date").trim();
                        String time = request.getParameter("time").trim();
                        String remuneration = request.getParameter("remuneration").trim();
                        String supermarche = request.getParameter("supermarche").trim();
                        String description = request.getParameter("description").trim();

                        ICityHandler cityHandler = new CityHandler();

                        try {
                            City city = cityHandler.getCity(Integer.parseInt(city_id));
                            Date date1;
                            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                            date1 = formatter.parse(date + " " + time);


                            if (date1.compareTo(new Date()) >= 0) {
                                float price = 0;
                                try {
                                    price = Float.parseFloat(remuneration);
                                } catch (NumberFormatException e) {
                                    e.printStackTrace();
                                }
                                myMission.setCity(city);
                                myMission.setMissionDate(date1);
                                myMission.setPrice(price);
                                myMission.setDestination(supermarche);
                                myMission.setDescription(description);
                                myMission.setName(missionName);
                                myMission.setPublished(true);

                                if (missionHandler.update(myMission)) {
                                    Util.addGlobalAlert(Util.SUCCESS, "Votre Annonce est modifiée avec succès");
                                } else
                                    Util.addGlobalAlert(Util.DANGER, "Une erreur est survenu veuillez réessayer");

                                response.sendRedirect(request.getRequestURI());
                            }
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                    } else
                        response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            } else {
                request.getSession().setAttribute("fromUrl", request.getRequestURI());
                response.sendRedirect(prefixPath + "/login");
            }
        } else {
            response.sendRedirect(prefixPath);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");

        String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
        String[] pathParts = pathInfo.split("/");
        System.out.println(request.getRequestURI());
        if (pathParts.length == 2) {
            if (UserHandler.isLoggedIn(request)) {
                String param = pathParts[1];
                int idM;
                try {
                    idM = Integer.parseInt(param);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("/");
                    return;
                }

                IMissionHandler missionHandler = new MissionHandler();
                Mission mission = missionHandler.get(idM);
                if (mission != null && (
                        (mission.isPublished() && mission.getMissionDate().compareTo(new Date()) >= 0) || UserHandler.getLoggedInUser(request).getId() == mission.getOwner().getId()
                )) {
                    request.setAttribute("mission", mission);
                    List<Mission> missions = missionHandler.relatedMissions(mission.getCity().getId(), mission.getId());
                    request.setAttribute("relatedMissions", missions);
                    this.getServletContext().getRequestDispatcher("/views/modifierMission.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            } else {
                request.getSession().setAttribute("fromUrl", request.getRequestURI());
                response.sendRedirect(prefixPath + "/login");
            }

        } else {
            response.sendRedirect(prefixPath);
        }
    }
}