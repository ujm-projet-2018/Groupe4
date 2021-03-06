/**
 * 
 */
package com.coursefacile.controller;

import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.Mission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author walid
 *
 */
public class ReservationDetail extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (UserHandler.isLoggedIn(request)) {
			String prefixPath = this.getServletContext().getInitParameter("prefixPath");
			String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
			String[] pathParts = pathInfo.split("/");
			System.out.println(request.getRequestURI());
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

				IMissionHandler missionHandler = new MissionHandler();
				Mission mission = missionHandler.get(idM);
				if (mission != null) {
					request.setAttribute("mission", mission);
					List<Mission> missions = missionHandler.relatedMissions(mission.getCity().getId(), mission.getId());
					request.setAttribute("relatedMissions", missions);
					this.getServletContext().getRequestDispatcher("/views/detailReservation.jsp").forward(request,
							response);
				} else {
					response.sendError(HttpServletResponse.SC_NOT_FOUND);
				}

			}
		} else {
			request.getSession().setAttribute("fromUrl", request.getRequestURI());
			response.sendRedirect("/coursefacile/login");
		}
	}
}
