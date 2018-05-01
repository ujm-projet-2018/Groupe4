package com.coursefacile.controller;

import com.coursefacile.dao.IMessageHandler;
import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.MessageHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.Message;
import com.coursefacile.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Chat extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        try {
            if (UserHandler.isLoggedIn(request)) {
                String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
                String[] pathParts = pathInfo.split("/");
                if (pathParts.length == 2) {
                    IUserHandler userHandler = new UserHandler();
                    IMessageHandler messageHandler = new MessageHandler();
                    User receiver = userHandler.get(Integer.parseInt(pathParts[1]));
                    request.setAttribute("receiver", receiver);
                    List<Message> messages = messageHandler.getMessages(UserHandler.getLoggedInUser(request).getId(), receiver.getId());
                    request.setAttribute("messages", messages);
                    this.getServletContext().getRequestDispatcher("/views/chat.jsp").forward(request, response);
                } else
                    response.sendRedirect(prefixPath + "/dashboard/messages");
            } else {
                request.getSession().setAttribute("fromUrl", request.getRequestURI());
                response.sendRedirect(prefixPath + "/login");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(prefixPath + "/dashboard/messages");
        }
    }
}
