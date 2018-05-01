package com.coursefacile.websocket;

import com.coursefacile.dao.IMessageHandler;
import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.MessageHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.Message;
import com.coursefacile.model.User;
import com.coursefacile.utilities.ChatMessageJsonHelper;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

@ServerEndpoint(value = "/chat/{userId}")
public class ChatServer {
    private static final Logger LOGGER =
            Logger.getLogger(ChatServer.class.getName());
    private static HashMap<String, String> sessions = new HashMap<String, String>();

    @OnOpen
    public void onOpen(Session session, @PathParam("userId") final String userId) {
        sessions.put(session.getId(), userId);
        LOGGER.log(Level.INFO, "New connection with client: {0}",
                session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        ChatMessageJsonHelper chatMessageJsonHelper = new ChatMessageJsonHelper();
        HashMap<String, String> chatMessage = chatMessageJsonHelper.decodeMessage(message);
        for (String name : sessions.keySet()) {

            String key = name.toString();
            String value = sessions.get(name).toString();
            System.out.println("key " + key + "value " + value);


        }

        try {
            for (Session s : session.getOpenSessions()) {

//        return "Server received [" + message + "]";
                if (s.isOpen() && chatMessage.get("receiver").equals(sessions.get(s.getId()))) {
                    LOGGER.log(Level.INFO, "New message from Client [{0}]: {1} to client " + chatMessage.get("receiver"), new Object[]{session.getId(), chatMessage.get("message")});
                    s.getBasicRemote().sendText(chatMessageJsonHelper.encodeMessage(chatMessage));
                }
                    System.out.println(chatMessageJsonHelper.encodeMessage(chatMessage));
                    IMessageHandler messageHandler = new MessageHandler();
                    IUserHandler userHandler = new UserHandler();
                    Message newMessage = new Message();
                    newMessage.setText(chatMessage.get("message"));
                    User sender = userHandler.get(Integer.parseInt(chatMessage.get("sender")));
                    User receiver = userHandler.get(Integer.parseInt(chatMessage.get("receiver")));
                    newMessage.setSender(sender);
                    newMessage.setReceiver(receiver);
                    newMessage.setDate(new Date());
                    messageHandler.add(newMessage);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @OnClose
    public void onClose(Session session) {
        LOGGER.log(Level.INFO, "Close connection for client: {0}",
                session.getId());
        sessions.remove(session.getId());
    }

    @OnError
    public void onError(Throwable exception, Session session) {
        LOGGER.log(Level.INFO, "Error for client: {0}", session.getId());
    }
}