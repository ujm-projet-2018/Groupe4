package com.coursefacile.controller;

import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.IVerificationTokenHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.dao.VerificationTokenHandler;
import com.coursefacile.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VerifyMail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IVerificationTokenHandler verificationTokenHandler = new VerificationTokenHandler();
        if(verificationTokenHandler.validateMail(request))
            response.sendRedirect("/coursefacile");
        else
            response.getWriter().println("ERROR");

    }
}
