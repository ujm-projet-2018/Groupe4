package com.coursefacile.controller;

import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.UserHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class LoginRegister extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // type = login or register
        Map<String, String[]> params = request.getParameterMap();
        if(params.containsKey("type")) {
            String type = request.getParameter("type");
            if (type.length() != 0) {
                IUserHandler userHandler = new UserHandler();
                if (type.equals("login")) {
                    boolean checkLogin = userHandler.authenticate(request);
                    if(checkLogin){
                        String fromUrl = this.getServletContext().getAttribute("fromUrl").toString();
                        this.getServletContext().removeAttribute("fromUrl");
                        if(fromUrl.length()!=0){
                            response.sendRedirect(fromUrl);
                        }else{
                            response.sendRedirect("/coursefacile");
                        }
                    }else
                        doGet(request,response);
                } else if (type.equals("register")) {
                    if (userHandler.register(request))
                        response.sendRedirect("/coursefacile");
                }
            }
        }else
            response.sendRedirect("/coursefacile/login");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if("/coursefacile/logout".equals(request.getRequestURI()))
        {
            request.getSession().removeAttribute("user");
            response.sendRedirect("/coursefacile");
        }else {
            this.getServletContext().getRequestDispatcher("/views/loginRegister.jsp").forward(request, response);
        }

    }
}
