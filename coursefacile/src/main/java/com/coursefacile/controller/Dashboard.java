/**
 * 
 */
package com.coursefacile.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.Mission;

/**
 * @author walid
 *
 */

public class Dashboard extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (UserHandler.isLoggedIn(request)) {
            IMissionHandler missionHandler = new MissionHandler();
            int score = missionHandler.getScore(UserHandler.getLoggedInUser(request));
            request.setAttribute("score", score);
            this.getServletContext().getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("fromUrl", request.getRequestURI());
            response.sendRedirect("/coursefacile/login");
        }
    }
}
