package com.coursefacile.controller;

import com.coursefacile.dao.IMessageHandler;
import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.MessageHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.Message;
import com.coursefacile.model.User;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

public class Chat extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (UserHandler.isLoggedIn(request)) {
                request.setCharacterEncoding("utf8");
                response.setContentType("application/json");
                String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
                String[] pathParts = pathInfo.split("/");
                if (pathParts.length == 2) {
                    IUserHandler userHandler = new UserHandler();
                    IMessageHandler messageHandler = new MessageHandler();
                    User receiver = userHandler.get(Integer.parseInt(pathParts[1]));
                    User currentUser = UserHandler.getLoggedInUser(request);
                    List<Message> messages = messageHandler.getMessages(currentUser.getId(), receiver.getId(), Integer.parseInt(request.getParameter("start")), Integer.parseInt(request.getParameter("end")));
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
                    JSONArray jsonArray = new JSONArray();
                    for (int i = messages.size() - 1; i >= 0; i--) {
                        Message message = messages.get(i);
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("message", message.getText().trim());
                        jsonObject.put("sender", (message.getSender().getId() == currentUser.getId() ? "moi" : message.getSender().getFname()));
                        jsonObject.put("sentDate", simpleDateFormat.format(message.getDate()));
                        jsonArray.put(jsonObject);

                    }
                    response.getWriter().println(jsonArray.toString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("[\"error\"]");
        }
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
                    List<Message> messages = messageHandler.getMessages(UserHandler.getLoggedInUser(request).getId(), receiver.getId(), 0, 10);
                    Collections.reverse(messages);
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
