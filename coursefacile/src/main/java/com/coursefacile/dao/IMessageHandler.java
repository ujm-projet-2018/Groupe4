package com.coursefacile.dao;

import com.coursefacile.model.Message;

import java.util.List;

public interface IMessageHandler {
    boolean add(Message message);

    boolean update(Message message);

    boolean delete(Message message);

    Message get(int messageId);

    List<Message> getMessages(int sender, int receiver, int start, int end);

    List<Message> getContacts(int userId, String userName, int start, int end);

    int consPagination(int userId);

}
