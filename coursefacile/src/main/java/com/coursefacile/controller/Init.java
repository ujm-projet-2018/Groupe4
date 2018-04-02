package com.coursefacile.controller;

import com.coursefacile.dao.SessionFactoryHelper;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Init extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SessionFactoryHelper.init();
        System.out.println(this.getServletContext().getInitParameter("prefixPath"));
        this.getServletContext().getRequestDispatcher("/views/index.jsp").forward(request, response);

    }
}
