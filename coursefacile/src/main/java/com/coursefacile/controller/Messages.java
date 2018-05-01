package com.coursefacile.controller;

import com.coursefacile.dao.IMessageHandler;
import com.coursefacile.dao.MessageHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.utilities.Util;
import com.coursefacile.model.Message;
import com.coursefacile.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Messages extends HttpServlet {
    private final int ELEMENTS_PER_PAGE = 10;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IMessageHandler messageHandler = new MessageHandler();
        if (UserHandler.isLoggedIn(request)) {
            User currentUser = UserHandler.getLoggedInUser(request);
            String url = "/coursefacile/dashboard/messages?";
            List<Message> messages;
            String userName = "";
            if (request.getParameterMap().containsKey("userName")) {
                userName = request.getParameter("userName");
                url += "userName=" + userName + "&";
            }
            int start = request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start"));
            if (start == 0)
                messages = messageHandler.getContacts(currentUser.getId(), userName, start, ELEMENTS_PER_PAGE);
            else
                messages = messageHandler.getContacts(currentUser.getId(), userName, (start * ELEMENTS_PER_PAGE) - ELEMENTS_PER_PAGE, start * ELEMENTS_PER_PAGE);


            int count = messageHandler.consPagination(currentUser.getId());

            int pagination = (count / ELEMENTS_PER_PAGE);
            System.out.println("pagination: " + pagination);
            request.setAttribute("messages", messages);
            request.setAttribute("url", url);
            request.setAttribute("pagination", pagination);
            this.getServletContext().getRequestDispatcher("/views/messages.jsp").forward(request, response);
        } else {
            Util.addGlobalAlert(Util.WARNING,
                    "Vous devez vous connecter por pouvoir accéder à vos messages!");
            request.getSession().setAttribute("fromUrl", request.getRequestURI());
            response.sendRedirect("/coursefacile/login");
        }
    }
}
