package com.coursefacile.controller;

import com.coursefacile.dao.*;
import com.coursefacile.model.VerificationToken;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class VerifyMail extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = this.getServletContext();
        Map<String, String[]> params = request.getParameterMap();
        IVerificationTokenHandler verificationTokenHandler = new VerificationTokenHandler();
        String prefixPath = servletContext.getInitParameter("prefixPath");
        if (Util.isLoggedIn(request)) {
            if (params.containsKey("sendNewValidatoinMail")) {
                verificationTokenHandler.sendVerificationMail(Util.getLoggedInUser(request), VerificationToken.VALIDATION_MAIL_TOKEN);
                response.sendRedirect(prefixPath);
            } else {
                String validationStatus =  Boolean.toString(verificationTokenHandler.validateMail(request));
                request.setAttribute("validationStatus", validationStatus);
                request.setAttribute("urlValidationMail", request.getRequestURI() + "?sendNewValidatoinMail=true");
                servletContext.getRequestDispatcher("/views/validationEmail.jsp").forward(request, response);
            }
        } else {
            Util.addGlobalAlert(Util.WARNING,"Vous devez vous connecter pour pouvoir continuer");
            servletContext.setAttribute("fromUrl", request.getRequestURL().append('?').append(request.getQueryString()));
            servletContext.getRequestDispatcher("/login").forward(request, response);
        }


    }
}
