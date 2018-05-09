/**
 * 
 */
package com.coursefacile.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;
import com.coursefacile.utilities.Util;

/**
 * @author walid
 *
 */
public class AnnulerReservation extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String prefixPath = this.getServletContext().getInitParameter("prefixPath");
		if (UserHandler.isLoggedIn(request)) {
	        String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
	        String[] pathParts = pathInfo.split("/");
	        System.out.println(request.getRequestURI());
            int idM = -1;
	        if (pathParts.length == 2) {
	            String param = pathParts[1];
	            try {
	                idM = Integer.parseInt(param);
	            } catch (Exception e) {
	                e.printStackTrace();
	                response.sendRedirect("/");
	                return;
	            }
	        }
			if (UserHandler.getLoggedInUser(request).getId() == idM) {
				IMissionHandler missionHandler = new MissionHandler();
				Mission mission = missionHandler.get(idM);
				mission.setCustomer(null);
				missionHandler.update(mission);
			}
			Util.addGlobalAlert(Util.SUCCESS, "Réservation annulée avec succès!");
            response.sendRedirect(prefixPath);
		} 
	        else {
			request.getSession().setAttribute("fromUrl", request.getRequestURI());
			response.sendRedirect(prefixPath + "/login");
		}
	}
}
