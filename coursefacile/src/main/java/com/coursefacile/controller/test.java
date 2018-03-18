package com.coursefacile.controller;

import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.*;

import java.io.IOException;

public class test extends javax.servlet.http.HttpServlet {
    private static int cpt = 0;
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        cpt++;
//        Mission mission1 = new Mission();
//        mission1.setName("blabla");
//        IMissionHandler missionHandler = new MissionHandler();
        IUserHandler userHandler = new UserHandler();
        User user1 = new User();
        user1.setFname("Momo");
        user1.setLname("Abdel");
        System.out.println("Here");
        System.out.println(cpt);
//        missionHandler.add(mission1);
        userHandler.add(user1);
        response.getWriter().println("Done");
    }
}
