package com.coursefacile.controller;

import com.coursefacile.dao.*;
import com.coursefacile.model.User;
import com.coursefacile.model.VerificationToken;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class RecoverPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        ServletContext servletContext = this.getServletContext();
        IUserHandler userHandler = new UserHandler();
        String prefixPath = servletContext.getInitParameter("prefixPath");
        if (params.containsKey("email")) {
            String email = request.getParameter("email");
            if (Util.isValidEmail(email)) {

                IVerificationTokenHandler verificationTokenHandler = new VerificationTokenHandler();
                User user = userHandler.get(email);
                servletContext.setAttribute("recoverPwdUser", user);
                if (user != null) {
                    verificationTokenHandler.sendVerificationMail(user, VerificationToken.RECOVERY_PWD_TOKEN);
                    response.sendRedirect(prefixPath);
                } else {
                    Util.addGlobalAlert(Util.DANGER, "Aucun compte n'est associé a cette adresse email!");
                    request.setAttribute("showRecoverPwdForm", "false");
                    servletContext.getRequestDispatcher("/views/recoverPassword.jsp").forward(request, response);
                }

            }
        } else if (params.containsKey("pwd") && params.containsKey("confirm_pwd")) {
            String pwd = request.getParameter("pwd");
            String confirmPwd = request.getParameter("confirm_pwd");
            if (confirmPwd.trim().length() >= 8 && pwd.trim().length() >= 8) {
                User user = (User) servletContext.getAttribute("recoverPwdUser");
                user.setPassword(Util.hashString(pwd));
                userHandler.update(user);
                servletContext.removeAttribute("recoverPwdUser");
                request.getSession().setAttribute("user", user);
                Util.addGlobalAlert(Util.SUCCESS, "Votre mot de passe est modifié avec succès");
                response.sendRedirect(prefixPath);

            } else {
                request.setAttribute("showRecoverPwdForm", "true");
                Util.addGlobalAlert(Util.WARNING, "Votre mot de passe doit contenir un minimum de 8 caractères");
                servletContext.getRequestDispatcher("/views/recoverPassword.jsp").forward(request, response);

            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        request.setAttribute("showRecoverPwdForm", "false");
        if (params.containsKey("token")) {
            String token = request.getParameter("token");
            IVerificationTokenHandler verificationTokenHandler = new VerificationTokenHandler();
            boolean check = verificationTokenHandler.recoverPassword(token);
            if (check) {
                request.setAttribute("showRecoverPwdForm", "true");
            } else {
                Util.addGlobalAlert(Util.WARNING, "Le lien de recuperation de mot de passe est expiré veuillez demander un autre!");
            }
        }
        this.getServletContext().getRequestDispatcher("/views/recoverPassword.jsp").forward(request, response);
    }
}
