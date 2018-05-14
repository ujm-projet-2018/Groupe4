package com.coursefacile.controller;

import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;
import com.coursefacile.utilities.Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class EffectuerMission extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        if (UserHandler.isLoggedIn(request)) {
            String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
            String[] pathParts = pathInfo.split("/");
            System.out.println(request.getRequestURI());
            if (pathParts.length == 2) {
                String param = pathParts[1];
                int id;
                try {
                    id = Integer.parseInt(param);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                User currUser = UserHandler.getLoggedInUser(request);
                IMissionHandler missionHandler = new MissionHandler();
                Mission mission = missionHandler.get(id);
                if (mission.isPublished()) {
                    if (mission.getOwner().getId() != currUser.getId()) {
                        mission.setCustomer(currUser);
                        mission.setPublished(false);
                        mission.setReservationDate(new Date());
                        if (missionHandler.update(mission)) {
                            Util.addGlobalAlert(Util.SUCCESS, "Mission réservé avec succès!");
                            response.sendRedirect(prefixPath);
                        } else {
                            Util.addGlobalAlert(Util.DANGER, "Une erreur s'est produite! Veuillez réessayer!");
                            response.sendRedirect(prefixPath + "/mission/" + id);
                        }
                    } else {
                        Util.addGlobalAlert(Util.WARNING, "Vous ne pouvez pas effectuer une mission dont vous êtes le proprietaire!");
                        response.sendRedirect(prefixPath + "/mission/" + id);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }

            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
        } else {
            request.getSession().setAttribute("fromUrl", request.getRequestURI());
            response.sendRedirect(prefixPath + "/login");
        }
    }
}
