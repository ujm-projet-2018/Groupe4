package com.coursefacile.controller;

import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.IUserHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.utilities.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import com.coursefacile.model.User;

import java.io.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@MultipartConfig
public class ProfileController extends HttpServlet {
    IUserHandler userHandler = new UserHandler();
    User user2;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        userHandler = new UserHandler();
        String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
        String[] pathParts = pathInfo.split("/");
//        System.out.println(request.getRequestURI());
        if (pathParts.length == 2) {
            String param = pathParts[1];
            int id;
            try {
                id = Integer.parseInt(param);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("/");
                return;
            }
            User user2 = userHandler.get(id);
            System.out.println(user2);
            IMissionHandler missionHandler = new MissionHandler();
            int score = missionHandler.getScore(user2);
            request.setAttribute("score", score);
            request.setAttribute("user2", user2);
            if (user2.getBirthDate() != null && user2.getBirthDate().length() != 0) {
                try {
                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                    Date birthDate = formatter.parse(user2.getBirthDate());
                    LocalDate localBirthDate = birthDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                    LocalDate localCurrentDate = LocalDate.now();
                    int age = Period.between(localBirthDate, localCurrentDate).getYears();
                    request.setAttribute("age", age);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            this.getServletContext().getRequestDispatcher("/views/PublicProfile.jsp").forward(request, response);

        } else if (request.getRequestURI().equals(prefixPath + "/dashboard/profile")) {
            if (UserHandler.isLoggedIn(request)) {
                this.getServletContext().getRequestDispatcher("/views/ProfileModif.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("fromUrl", request.getRequestURI());
                response.sendRedirect(prefixPath + "/login");
            }
        } else
            response.sendRedirect(prefixPath + "/dashboard/profile");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        request.setCharacterEncoding("utf8");
        Map<String, String[]> params = request.getParameterMap();
        if (params.containsKey("confirmationPwd") && request.getRequestURI().equals(prefixPath + "/confirm-pwd") && UserHandler.isLoggedIn(request)) {
            request.setCharacterEncoding("utf8");
            response.setContentType("application/json");
            User currentUser = UserHandler.getLoggedInUser(request);
            String status = Boolean.toString(userHandler.validatePwd(currentUser.getEmail(), request.getParameter("confirmationPwd")));
            response.getWriter().println("[" + status + ",\"" + Util.hashString(currentUser.getPassword()) + "\"]");
        } else if (request.getRequestURI().equals(prefixPath + "/dashboard/profile")) {
            if (UserHandler.isLoggedIn(request)) {
                if (params.containsKey("checkSubmit")) {
                    user2 = UserHandler.getLoggedInUser(request);
                    if (params.containsKey("telephone") && request.getParameter("telephone").length() != 0)
                        user2.setTelephone(request.getParameter("telephone"));
                    if (params.containsKey("birthDate") && request.getParameter("birthDate").length() != 0)
                        user2.setBirthDate(request.getParameter("birthDate"));
                    System.out.println(request.getParameter("address"));
                    System.out.println(new String(request.getParameter("address").getBytes("UTF-8")));
                    if (params.containsKey("address") && request.getParameter("address").length() != 0)
                        user2.setAddress(new String(request.getParameter("address").getBytes("UTF-8")));
                    System.out.println("hééééééééyheyhey");
                    System.out.println(request.getParameter("description"));
                    if (params.containsKey("description") && request.getParameter("description").length() != 0)
                        user2.setDescription(new String(request.getParameter("description").getBytes("UTF-8")));
                    if (params.containsKey("password") && (request.getParameter("password") != "") && (request.getParameter("password")).length() >= 8)
                        user2.setPassword(Util.hashString(request.getParameter("password")));
                    else if (request.getParameter("password").length() > 0 && request.getParameter("password").length() < 8)
                        Util.addGlobalAlert(Util.WARNING, "Le mot de passe n'est pas modifié il doit contenir au minimum 8 caracteres");

                    if (params.containsKey("fname") && params.containsKey("lname") && params.containsKey("email")) {
                        // check if an input is empty or password < 8 char and input contains smthing
                        if ((request.getParameter("fname") != "") && (request.getParameter("lname") != "")
                                && (request.getParameter("email") != "")
                                ) {
                            user2.setFname(request.getParameter("fname"));
                            user2.setLname(request.getParameter("lname"));
                            user2.setEmail(request.getParameter("email"));
                            userHandler.update(user2);
                            Util.addGlobalAlert(Util.SUCCESS, "profile modifie avec succes");
                        } else
                            Util.addGlobalAlert(Util.WARNING,
                                    "le nom prenom et email sont obligatoires");
                        this.getServletContext().getRequestDispatcher("/views/ProfileModif.jsp").forward(request, response);
                    }
                } else {
                    Util.addGlobalAlert(Util.WARNING, "Les données inserées sont incorrectes");
                }
            } else {
                request.getSession().setAttribute("fromUrl", request.getRequestURI());
                response.sendRedirect(prefixPath + "/login");

            }

        } else if (request.getRequestURI().equals(prefixPath + "/dashboard/profile/upload-photo")) {
            if (UserHandler.isLoggedIn(request)) {
                User currentUser = UserHandler.getLoggedInUser(request);
                Part imageProfile = request.getPart("avatar");
                if (imageProfile != null) {

                    try {
                        boolean check = true;
                        if (currentUser.getImage() != null && !currentUser.getImage().isEmpty()) {
                            System.out.println(getServletConfig().getServletContext().getRealPath("") + currentUser.getImage());
                            File file = new File(getServletConfig().getServletContext().getRealPath("") + currentUser.getImage());
                            System.out.println("fileExists:=" + file.exists());
                            check = file.delete();
                            System.out.println("check:=" + check);
                        }
                        UUID uuid = UUID.randomUUID();
                        String fileName = currentUser.getFname() + uuid.toString() + ".png";
                        InputStream imageProfileInputStream = imageProfile.getInputStream();
                        byte[] buffer = new byte[imageProfileInputStream.available()];
                        imageProfileInputStream.read(buffer);
                        File targetFile = new File(getServletConfig().getServletContext().getRealPath("uploads") + "/" + fileName);
                        OutputStream outStream = new FileOutputStream(targetFile);
                        outStream.write(buffer);
                        UserHandler userHandler = new UserHandler();
                        currentUser.setImage("/uploads/" + fileName);
                        if (userHandler.update(currentUser))
                            Util.addGlobalAlert(Util.SUCCESS, "Image de profile modifiée avec succès");
                        else
                            Util.addGlobalAlert(Util.DANGER, "Une erreure est survenue! Vuillez réessayer");
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.getWriter().println("false");
                    }
                } else {
                    Util.addGlobalAlert(Util.WARNING, "Veuillez fournire une image ");
                }
                response.sendRedirect(prefixPath + "/dashboard/profile");
            } else
                response.sendRedirect(prefixPath + "/login");

        } else {
            request.getSession().setAttribute("fromUrl", request.getRequestURI());
            response.sendRedirect(prefixPath + "/login");
        }
    }


}
