package com.coursefacile.controller;

import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class LoginRegister extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // type = login or register
        String type = request.getParameter("type");
        if (request.getParameterMap().containsKey("type") && type.length() != 0) {
            IUserHandler userHandler = new UserHandler();
            if (type.equals("login")) {
                userHandler.authentificate(request);
                response.sendRedirect("/coursefacile");
            } else if (type.equals("register")) {
                if(userHandler.register(request))
                    response.sendRedirect("/coursefacile");
            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if("/coursefacile/logout".equals(request.getRequestURI()))
        {
            request.getSession().removeAttribute("user");
            response.sendRedirect("/coursefacile");
        }else
        this.getServletContext().getRequestDispatcher("/views/loginRegister.jsp").forward(request, response);

    }
}
