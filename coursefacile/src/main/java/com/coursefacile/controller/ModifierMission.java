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

import com.coursefacile.model.Mission;
import com.coursefacile.model.User;
import com.coursefacile.utilities.Util;
import com.coursefacile.dao.IMissionHandler;
import com.coursefacile.dao.MissionHandler;
import com.coursefacile.model.City;
import com.coursefacile.model.Message;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 * @author walid
 *
 */

public class ModifierMission extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prefixPath = this.getServletContext().getInitParameter("prefixPath");
        String pathInfo = request.getPathInfo() != null ? request.getPathInfo() : "";
        String[] pathParts = pathInfo.split("/");
        System.out.println(request.getRequestURI());
        if (pathParts.length == 2) {
            String param = pathParts[1];
            int idM;
            try {
                idM = Integer.parseInt(param);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("/");
                return;
            }

            IMissionHandler missionHandler = new MissionHandler();
            Mission mission = missionHandler.get(idM);
            if (mission != null && mission.isPublished() && mission.getMissionDate().compareTo(new Date()) >= 0) {
                request.setAttribute("mission", mission);
                List<Mission> missions = missionHandler.relatedMissions(mission.getCity().getId(), mission.getId());
                request.setAttribute("relatedMissions", missions);
                this.getServletContext().getRequestDispatcher("/views/modifierMission.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }

        }
    }
}