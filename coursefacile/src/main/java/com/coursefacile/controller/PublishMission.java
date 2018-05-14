package com.coursefacile.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coursefacile.dao.*;
import com.coursefacile.model.City;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;
import com.coursefacile.utilities.Util;

public class PublishMission extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        Map<String, String[]> params = request.getParameterMap();
        if (params.containsKey("missionName") && params.containsKey("city_id") && params.containsKey("date") && params.containsKey("time") && params.containsKey("supermarche") && params.containsKey("description") && params.containsKey("remuneration")) {
            String missionName = request.getParameter("missionName").trim();
            String city_id = request.getParameter("city_id").trim();
            String date = request.getParameter("date").trim();
            String time = request.getParameter("time").trim();
            String remuneration = request.getParameter("remuneration").trim();
            String supermarche = request.getParameter("supermarche").trim();
            String description = request.getParameter("description").trim();

            if (missionName.trim().length() != 0 && remuneration.trim().length() != 0 && city_id.trim().length() != 0 && date.trim().length() != 0 && time.trim().length() != 0 && supermarche.trim().length() != 0 && description.trim().length() != 0) {
                ICityHandler cityHandler = new CityHandler();
                City city = cityHandler.getCity(Integer.parseInt(request.getParameter("city_id")));
                Mission myMission = new Mission();
                Date date1 = new Date();
                try {

                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                    date1 = formatter.parse(date + " " + time);

                } catch (ParseException e) {
                    e.printStackTrace();
                }
                if (date1.compareTo(new Date()) >= 0) {
                    float price = 0;
                    try {
                        price = Float.parseFloat(remuneration);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }

                    myMission.setCity(city);
                    myMission.setMissionDate(date1);
                    myMission.setPublishDate(new Date());
                    myMission.setPrice(price);
                    myMission.setDestination(supermarche);
                    myMission.setDescription(description);
                    myMission.setName(missionName);

                    if (!UserHandler.isLoggedIn(request)) {
                        Util.addGlobalAlert(Util.WARNING,
                                "Vous devez vous connecter ou vous inscrire avant de publier votre annonce !");
                        request.getSession().setAttribute("myMission", myMission);
                        request.getSession().setAttribute("fromUrl", request.getRequestURI());
                        response.sendRedirect("/coursefacile/login");
                    } else {
                        User currentUser = UserHandler.getLoggedInUser(request);
                        System.out.println(currentUser.getId());
                        myMission.setOwner(currentUser);
                        IMissionHandler missionHandler = new MissionHandler();
                        myMission.setPublished(true);
                        if (missionHandler.add(myMission)) {
                            Util.addGlobalAlert(Util.SUCCESS, "Votre Annonce vient d'être publié");
                            response.sendRedirect("/coursefacile");
                        } else {
                            Util.addGlobalAlert(Util.DANGER,
                                    "Une erreur est survenu lors de l'enregistrement de la mission ! Veuillez réessayer s'il vous plait :)");
                        }
                    }
                } else {
                    Util.addGlobalAlert(Util.WARNING, "Veuillez choisir une date valide!");
                    this.getServletContext().getRequestDispatcher("/views/publishMission.jsp").forward(request, response);
                }
            } else {
                Util.addGlobalAlert(Util.DANGER, "Vous n'avez pas bien rempli le formulaire ! veuillez réessayer");
                this.getServletContext().getRequestDispatcher("/views/publishMission.jsp").forward(request, response);
            }



		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        if (Util.elementExistInEnum(request.getSession().getAttributeNames(), "myMission")
				&& UserHandler.isLoggedIn(request)) {
            Mission myMission = (Mission) request.getSession().getAttribute("myMission");
			IMissionHandler missionHandler = new MissionHandler();
			myMission.setPublished(true);
            myMission.setOwner(UserHandler.getLoggedInUser(request));
            request.getSession().removeAttribute("myMission");
            request.getSession().removeAttribute("fromUrl");
			if (missionHandler.add(myMission)) {
				Util.addGlobalAlert(Util.SUCCESS, "Votre Annonce vient d'être publié");
				response.sendRedirect("/coursefacile");
			} else {
				Util.addGlobalAlert(Util.DANGER,
						"Une erreur est survenu lors de l'enregistrement de la mission ! Veuillez réessayer s'il vous plait :)");
			}
		} else {
			this.getServletContext().getRequestDispatcher("/views/publishMission.jsp").forward(request, response);
		}
	}
}