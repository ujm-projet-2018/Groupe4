package com.coursefacile.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		int flag = 0;
		float price = 0;
		try {
			price = Float.parseFloat(request.getParameter("remuneration"));
		} catch (NumberFormatException e) {
			flag = 1;
		}

        if (request.getParameter("city_id").trim().isEmpty() || request.getParameter("date").trim().isEmpty()
                || request.getParameter("heure").trim().isEmpty() || request.getParameter("minute").trim().isEmpty()
				|| request.getParameter("supermarche").trim().isEmpty() || flag == 1
				|| request.getParameter("description").trim().isEmpty()) {
			Util.addGlobalAlert(Util.DANGER, "Vous n'avez pas bien rempli le formulaire ! veuillez réessayer");
			this.getServletContext().getRequestDispatcher("/views/publishMission.jsp").forward(request, response);
		}
        ICityHandler cityHandler = new CityHandler();
        City city = cityHandler.getCity(Integer.parseInt(request.getParameter("city_id")));
        Mission myMission = new Mission();
		Date date1 = new Date();
		try {

			String dateParam = request.getParameter("date");
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			date1 = formatter.parse(dateParam);
			date1.setMinutes(Integer.parseInt(request.getParameter("minute")));
			date1.setHours(Integer.parseInt(request.getParameter("heure")));
			System.out.println(date1.toString());
//			date1 = new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(request.getParameter("date") + " "
//					+ request.getParameter("heure") + request.getParameter("minute"));

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date date2 = new Date();
        myMission.setCity(city);
        myMission.setMissionDate(date1);
		myMission.setPublishDate(date2);
		myMission.setPrice(price);
		myMission.setDestination(request.getParameter("supermarche"));
		myMission.setDescription(request.getParameter("description"));

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
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        if (Util.elementExistInEnum(request.getSession().getAttributeNames(), "myMission")
				&& UserHandler.isLoggedIn(request)) {
            Mission myMission = (Mission) request.getSession().getAttribute("myMission");
			IMissionHandler missionHandler = new MissionHandler();
			myMission.setPublished(true);
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