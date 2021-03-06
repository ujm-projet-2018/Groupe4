package com.coursefacile.controller;

import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.utilities.Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class LoginRegister extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // type = login or register
        request.setCharacterEncoding("utf8");
        Map<String, String[]> params = request.getParameterMap();
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        if (params.containsKey("type")) {
            String type = request.getParameter("type");
            if (type.length() != 0) {
                IUserHandler userHandler = new UserHandler();
                if (type.equals("login")) {
                    boolean checkLogin = userHandler.authenticate(request);
                    if (checkLogin) {
                        if (Util.elementExistInEnum(request.getSession().getAttributeNames(), "fromUrl")) {
                            String fromUrl = request.getSession().getAttribute("fromUrl").toString();
                            request.getSession().removeAttribute("fromUrl");
                            if (fromUrl.length() != 0) {
                                response.sendRedirect(fromUrl);
                            } else
                                response.sendRedirect(prefixPath);
                        } else {
                            response.sendRedirect(prefixPath);
                        }
                    } else
                        doGet(request, response);
                } else if (type.equals("register")) {
                    if (userHandler.register(request))
                        response.sendRedirect(prefixPath);
                }
            }
        } else
            response.sendRedirect(prefixPath + "/login");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");

        if ((prefixPath + "/logout").equals(request.getRequestURI())) {
            request.getSession().removeAttribute("user");
            response.sendRedirect(prefixPath);
        } else {
            if (!UserHandler.isLoggedIn(request))
                this.getServletContext().getRequestDispatcher("/views/loginRegister.jsp").forward(request, response);
            else
                response.sendRedirect(prefixPath);
        }

    }
}
