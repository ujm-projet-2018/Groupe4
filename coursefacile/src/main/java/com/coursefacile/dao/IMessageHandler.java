package com.coursefacile.dao;

import com.coursefacile.model.Message;

public interface IMessageHandler {
    public boolean add(Message message);

    public boolean update(Message message);

    public boolean delete(Message message);

    public Message get(Message message);

}
