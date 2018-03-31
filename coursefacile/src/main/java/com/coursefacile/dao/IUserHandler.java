package com.coursefacile.dao;

import com.coursefacile.model.User;

import javax.servlet.http.HttpServletRequest;

public interface IUserHandler {

    boolean add(User user);

    boolean update(User user);

    boolean delete(User user);

    boolean authentificate(HttpServletRequest request);

    boolean register(HttpServletRequest request);

    User get(int id);

    boolean isLoggedIn(HttpServletRequest request);

    User getLoggedInUser(HttpServletRequest request);

}
