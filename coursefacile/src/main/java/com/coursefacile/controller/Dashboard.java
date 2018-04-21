/**
 * 
 */
package com.coursefacile.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coursefacile.dao.UserHandler;

/**
 * @author walid
 *
 */

public class Dashboard extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (UserHandler.isLoggedIn(request)) {
            this.getServletContext().getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
        } else {
            this.getServletContext().setAttribute("fromUrl", request.getRequestURI());
            response.sendRedirect("/coursefacile/login");
        }
    }
}
