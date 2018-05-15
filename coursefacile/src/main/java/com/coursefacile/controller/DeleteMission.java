package com.coursefacile.controller;

import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.Mission;
import com.coursefacile.utilities.Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class DeleteMission extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        Map<String, String[]> params = request.getParameterMap();
        String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
        String[] pathParts = pathInfo.split("/");
        System.out.println(request.getRequestURI());
        System.out.println(pathParts.length);
        if (pathParts.length == 2) {
            String param = pathParts[1];

            int idM;
            try {
                idM = Integer.parseInt(param);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("/");
                return;
            }
            if (UserHandler.isLoggedIn(request)) {

                IMissionHandler missionHandler = new MissionHandler();
                Mission myMission = missionHandler.get(idM);
                if (myMission.getOwner().getId() == UserHandler.getLoggedInUser(request).getId()) {
                    if (missionHandler.delete(myMission)) {
                        Util.addGlobalAlert(Util.SUCCESS, "Mission supprimée avec succès");
                        response.sendRedirect(prefixPath + "/dashboard/mesmissions");
                    } else {
                        Util.addGlobalAlert(Util.DANGER, "Une erreur est survenue! Veuillez réessayer");
                        response.sendRedirect(request.getRequestURI());
                    }
                } else
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            } else {
                request.getSession().setAttribute("fromUrl", prefixPath + "/mission/" + idM);
                response.sendRedirect(prefixPath + "/login");
            }
        }
    }
}
