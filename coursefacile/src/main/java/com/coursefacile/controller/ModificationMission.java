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

import com.coursefacile.dao.CityHandler;
import com.coursefacile.dao.ICityHandler;
import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.City;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;
import com.coursefacile.utilities.Util;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.dao.UserHandler;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;
import com.coursefacile.utilities.Util;

/**
 * @author walid
 *
 */


public class ModificationMission extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST");
		String prefixPath = this.getServletContext().getInitParameter("prefixPath");
		IMissionHandler missionHandler = new MissionHandler();
		if (UserHandler.isLoggedIn(request)) {
			System.out.println("ok1");
			String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
			String[] pathParts = pathInfo.split("/");
			System.out.println(request.getRequestURI());
			int idM = -1;
			if (pathParts.length == 2) {
				String param = pathParts[1];
				try {
					idM = Integer.parseInt(param);
				} catch (Exception e) {
					e.printStackTrace();
					response.sendRedirect("/");
					return;
				}
			}
			
			Mission myMission = missionHandler.get(idM);
			if (UserHandler.getLoggedInUser(request).getId() == myMission.getOwner().getId()) {
				System.out.println("ok2");
				Map<String, String[]> params = request.getParameterMap();
				if (params.containsKey("missionName") && params.containsKey("city_id") && params.containsKey("date")
						&& params.containsKey("time") && params.containsKey("supermarche")
						&& params.containsKey("description") && params.containsKey("remuneration")) {
					System.out.println("ok3");
					String missionName = request.getParameter("missionName").trim();
					String city_id = request.getParameter("city_id").trim();
					String date = request.getParameter("date").trim();
					String time = request.getParameter("time").trim();
					String remuneration = request.getParameter("remuneration").trim();
					String supermarche = request.getParameter("supermarche").trim();
					String description = request.getParameter("description").trim();

					if (missionName.trim().length() != 0 && remuneration.trim().length() != 0
							&& city_id.trim().length() != 0 && date.trim().length() != 0 && time.trim().length() != 0
							&& supermarche.trim().length() != 0 && description.trim().length() != 0) {
						System.out.println("ok4");
						ICityHandler cityHandler = new CityHandler();
						City city = cityHandler.getCity(Integer.parseInt(request.getParameter("city_id")));
						Date date1 = new Date();
						try {

							SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");
							date1 = formatter.parse(date + " " + time);

						} catch (ParseException e) {
							e.printStackTrace();
						}
						if (date1.compareTo(new Date()) >= 0) {
							System.out.println("ok5");
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

							User currentUser = UserHandler.getLoggedInUser(request);
							System.out.println(currentUser.getId());
							if (missionHandler.update(myMission)) {
								System.out.println("ok6");
								Util.addGlobalAlert(Util.SUCCESS, "Votre annonce vient d'être modifiée");
					            response.sendRedirect(prefixPath);
							} else {
								Util.addGlobalAlert(Util.DANGER,
										"Une erreur est survenu lors de la modification de la mission ! Veuillez réessayer s'il vous plait");
							}
						} else {
							Util.addGlobalAlert(Util.WARNING, "Veuillez choisir une date valide !");
							this.getServletContext().getRequestDispatcher("/views/modifierMission.jsp").forward(request,
									response);
						}
					} else {
						Util.addGlobalAlert(Util.DANGER,
								"Vous n'avez pas bien rempli le formulaire ! veuillez réessayer");
						this.getServletContext().getRequestDispatcher("/views/modifierMission.jsp").forward(request,
								response);
					}

				}
			}
		} else {
			request.getSession().setAttribute("fromUrl", request.getRequestURI());
			response.sendRedirect(prefixPath + "/login");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("GET");
		/*
		String prefixPath = this.getServletContext().getInitParameter("prefixPath");
		if (Util.elementExistInEnum(request.getSession().getAttributeNames(), "myMission")
				&& UserHandler.isLoggedIn(request)) {
			Mission myMission = (Mission) request.getSession().getAttribute("myMission");
			request.getSession().removeAttribute("myMission");
			request.getSession().removeAttribute("fromUrl");
			IMissionHandler missionHandler = new MissionHandler();
			if (missionHandler.update(myMission)) {
				Util.addGlobalAlert(Util.SUCCESS, "Votre Annonce vient d'être modifiée");
	            response.sendRedirect(prefixPath);
			} else {
				Util.addGlobalAlert(Util.DANGER,
						"Une erreur est survenu lors de l'enregistrement de la mission ! Veuillez réessayer s'il vous plait :)");
			}
		} else {
			this.getServletContext().getRequestDispatcher("/views/modifierMission.jsp").forward(request, response);
		}
		*/
	}
}