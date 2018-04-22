package com.coursefacile.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.dao.Util;
import com.coursefacile.model.Mission;

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

		if (request.getParameter("ville").trim().isEmpty() || request.getParameter("date").trim().isEmpty()
				|| request.getParameter("heure").trim().isEmpty() || request.getParameter("minute").trim().isEmpty()
				|| request.getParameter("supermarche").trim().isEmpty() || flag == 1
				|| request.getParameter("description").trim().isEmpty()) {
			Util.addGlobalAlert(Util.DANGER, "Vous n'avez pas bien rempli le formulaire ! veuillez réessayer");
			this.getServletContext().getRequestDispatcher("/views/publishMission.jsp").forward(request, response);
		}

		Mission myMission = new Mission();
		Date date1 = new Date();
		try {
			date1 = new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(request.getParameter("date") + " "
					+ request.getParameter("heure") + request.getParameter("minute"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date date2 = new Date();

		myMission.setMissionDate(date1);
		myMission.setPublishDate(date2);
		myMission.setPrice(price);
		myMission.setDestination(request.getParameter("supermarche"));
		myMission.setDescription(request.getParameter("description"));

		if (!UserHandler.isLoggedIn(request)) {
			Util.addGlobalAlert(Util.WARNING,
					"Vous devez vous connecter ou vous inscrire avant de publier votre annonce !");
			this.getServletContext().setAttribute("myMission", myMission);
			this.getServletContext().setAttribute("fromUrl", request.getRequestURI());
			response.sendRedirect("/coursefacile/login");
		} else {
			myMission.setOwner(UserHandler.getLoggedInUser(request));
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
		if (Util.elementExistInEnum(this.getServletContext().getAttributeNames(), "myMission")
				&& UserHandler.isLoggedIn(request)) {
			Mission myMission = (Mission) this.getServletContext().getAttribute("myMission");
			IMissionHandler missionHandler = new MissionHandler();
			myMission.setPublished(true);
			this.getServletContext().removeAttribute("myMission");
			this.getServletContext().removeAttribute("fromUrl");
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