package com.coursefacile.controller;

import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.utilities.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.coursefacile.model.User;

import java.io.IOException;
import java.util.Map;

@WebServlet("/profile")

public class ProfileController extends HttpServlet {
    IUserHandler userHandler = new UserHandler();
    User user2;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        userHandler = new UserHandler();
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
                response.sendRedirect("/");
                return;
            }
            User user2 = userHandler.get(id);
            request.setAttribute("user2", user2);
            this.getServletContext().getRequestDispatcher("/views/PublicProfile.jsp").forward(request, response);

        } else if (request.getRequestURI().equals(prefixPath + "/dashboard/profile")) {
            if (UserHandler.isLoggedIn(request)) {
                this.getServletContext().getRequestDispatcher("/views/ProfileModif.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("fromUrl", request.getRequestURI());
                response.sendRedirect(prefixPath + "/login");
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        Map<String, String[]> params = request.getParameterMap();
        if (params.containsKey("confirmationPwd") && request.getRequestURI().equals(prefixPath + "/confirm-pwd") && UserHandler.isLoggedIn(request)) {
            request.setCharacterEncoding("utf8");
            response.setContentType("application/json");
            User currentUser = UserHandler.getLoggedInUser(request);
            String status = Boolean.toString(userHandler.validatePwd(currentUser.getEmail(), request.getParameter("confirmationPwd")));
            response.getWriter().println("[" + status + ",\"" + Util.hashString(currentUser.getPassword()) + "\"]");
        } else if (request.getRequestURI().equals(prefixPath + "/profile")) {

            if (UserHandler.isLoggedIn(request)) {
                if (params.containsKey("checkSubmit")) {
                    user2 = UserHandler.getLoggedInUser(request);
                    if (params.containsKey("telephone"))
                        user2.setTelephone(request.getParameter("telephone"));
                    if (params.containsKey("birthDate"))
                        user2.setBirthDate(request.getParameter("birthDate"));
                    if (params.containsKey("address"))
                        user2.setAddress(request.getParameter("address"));
                    if (params.containsKey("description"))
                        user2.setDescription(request.getParameter("description"));

                    if (params.containsKey("fname") && params.containsKey("lname") && params.containsKey("email")) {
                        // check if an input is empty or password < 8 char and input contains smthing
                        if ((request.getParameter("fname") != "") && (request.getParameter("lname") != "")
                                && (request.getParameter("email") != "") && (request.getParameter("password") != "")
                                && (request.getParameter("password")).length() >= 8) {
                            user2.setFname(request.getParameter("fname"));
                            user2.setLname(request.getParameter("lname"));
                            user2.setEmail(request.getParameter("email"));
                            if (params.containsKey("password"))
                                user2.setPassword(Util.hashString(request.getParameter("password")));
                            userHandler.update(user2);
                            Util.addGlobalAlert(Util.SUCCESS, "profile modifie avec succes");
                        } else {
                            Util.addGlobalAlert(Util.WARNING,
                                    "s'il vous plait ne pas laisser les champs vide, le password doit contenir > 8 caracteres");
                        }
                        this.getServletContext().getRequestDispatcher("/views/ProfileModif.jsp").forward(request, response);
                    }
                } else {
                    Util.addGlobalAlert(Util.WARNING, "Les données inserées sont incorrectes");
                }
            } else {
                request.getSession().setAttribute("fromUrl", request.getRequestURI());
                response.sendRedirect(prefixPath + "/login");

            }

        }
    }


}
