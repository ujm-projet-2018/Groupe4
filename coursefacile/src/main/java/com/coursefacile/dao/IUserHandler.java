package com.coursefacile.dao;

import com.coursefacile.model.User;

public interface IUserHandler {
    public boolean add(User user);

    public boolean update(User user);

    public boolean delete(User user);

    public User get(String email, String pwd);
}
