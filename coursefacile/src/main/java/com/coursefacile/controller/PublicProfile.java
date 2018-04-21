package com.coursefacile.controller;

import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.User;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PublicProfile extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        String parts = request.getPathInfo().substring(1);
        IUserHandler userHandler = new UserHandler();
        int  id= Integer.parseInt(parts);
        User user2=userHandler.get(id);
        request.setAttribute("user2",user2);
        this.getServletContext().getRequestDispatcher("/views/PublicProfile.jsp").forward(request, response);

    }


}