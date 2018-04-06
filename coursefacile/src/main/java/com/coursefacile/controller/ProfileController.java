package com.coursefacile.controller;


import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.dao.Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coursefacile.model.User;

import java.io.IOException;
import java.util.Date;


public class ProfileController extends HttpServlet {
    IUserHandler userHandler;
    User user2;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        userHandler = new UserHandler();
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        if (UserHandler.isLoggedIn(request)) {
            this.getServletContext().getRequestDispatcher("/views/ProfileModif.jsp").forward(request, response);
        } else {
            this.getServletContext().setAttribute("fromUrl", request.getRequestURI());
            response.sendRedirect(prefixPath + "/login");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        userHandler = new UserHandler();
        user2 = UserHandler.getLoggedInUser(request);
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        user2.setFname((String) request.getParameter("fname"));
        user2.setLname((String) request.getParameter("lname"));
        user2.setEmail((String) request.getParameter("email"));
        user2.setTelephone((String) request.getParameter("telephone"));
        user2.setBirthDate((String) request.getParameter("birthDate"));
        user2.setAddress((String) request.getParameter("address"));
        user2.setDescription((String) request.getParameter("description"));
        user2.setPassword((String) request.getParameter("password"));
        // check if an input is empty or password < 8 char and input contains smthing
        if (((String) request.getParameter("fname") != "") && ((String) request.getParameter("lname") != "")
                && ((String) request.getParameter("email") != "") && ((String) request.getParameter("password") != "")
                && ((String) request.getParameter("password")).length() > 8
                && (String) request.getParameter("telephone") != "") {
            if (userHandler.update(user2))
                Util.addGlobalAlert(Util.SUCCESS, "profile modifie avec succes");
            else
                Util.addGlobalAlert(Util.DANGER, "Une erreure est parvenue! Veuillez ressayer plus tard.");

            this.getServletContext().getRequestDispatcher("/views/ProfileModif.jsp").forward(request, response);

        } else {
            Util.addGlobalAlert(Util.WARNING, "s'il vous plait ne pas laisser les champs vide, le password doit contenir > 8 caracteres");
            this.getServletContext().getRequestDispatcher("/views/ProfileModif.jsp").forward(request, response);
        }


    }

}
