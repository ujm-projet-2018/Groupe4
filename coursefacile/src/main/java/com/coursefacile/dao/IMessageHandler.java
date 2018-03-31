package com.coursefacile.dao;

import com.coursefacile.model.Message;

public interface IMessageHandler {
     boolean add(Message message);

     boolean update(Message message);

     boolean delete(Message message);

     Message get(Message message);

}
