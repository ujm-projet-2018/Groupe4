package com.coursefacile.dao;

import com.coursefacile.model.User;

import javax.servlet.http.HttpServletRequest;

public interface IUserHandler {

    public boolean add(User user);

    public boolean update(User user);

    public boolean delete(User user);

    public boolean authentificate(HttpServletRequest request);

    public boolean register(HttpServletRequest request);

    public User get(int id);

    public boolean isLoggedIn(HttpServletRequest request);

    public User getLoggedInUser(HttpServletRequest request);

}
