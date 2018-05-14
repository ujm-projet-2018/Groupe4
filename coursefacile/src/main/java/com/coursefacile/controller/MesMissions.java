/**
 * 
 */
package com.coursefacile.controller;

import com.coursefacile.dao.CityHandler;
import com.coursefacile.dao.ICityHandler;
import com.coursefacile.dao.SessionFactoryHelper;
import com.coursefacile.dao.UserHandler;
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

public class MesMissions extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final int PAGE_SIZE = 10;
	Session session1 = SessionFactoryHelper.getSessionFactory().openSession();
	List<Mission> Lmissions = new ArrayList<Mission>();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (UserHandler.isLoggedIn(request)) {
			Map<String, String[]> params = request.getParameterMap();
			User user1 = UserHandler.getLoggedInUser(request);
			SQLQuery query = null;
			String str = request.getRequestURL() + "?";
			Enumeration<String> paramNames = request.getParameterNames();
			while (paramNames.hasMoreElements()) {
				String paramName = paramNames.nextElement();
				String[] paramValues = request.getParameterValues(paramName);
				for (int i = 0; i < paramValues.length; i++) {
					String paramValue = paramValues[i];
					str = str + paramName + "=" + paramValue;
				}
				str = str + "&";

			}
			System.out.println(request.getParameter("city_id"));
			str = str.split("page")[0];
			request.setAttribute("currentUrl", str + "page=");

			try {
				int missionRowsCount = ((BigInteger) session1.createSQLQuery("SELECT COUNT(*) FROM mission")
						.uniqueResult()).intValue();
				session1.beginTransaction();
				query = session1.createSQLQuery(
						"select * from mission where owner = " + user1.getId());
				query.addEntity(Mission.class);
				String page = "0";
				if (params.containsKey("page")) {
					page = request.getParameter("page");
				}

				request.setAttribute("paginationMax", missionRowsCount == 0 ? 0 : (missionRowsCount / PAGE_SIZE) + 1);
				query.setFirstResult((Integer.parseInt(page) - 1) * PAGE_SIZE);
				query.setMaxResults(PAGE_SIZE);
				Lmissions = query.list();
				request.setAttribute("Lmissions", Lmissions);
				request.setAttribute("Date", request.getParameter("date"));
				session1.getTransaction().commit();

			}catch (Exception e) {
				session1.getTransaction().rollback();
				e.printStackTrace();
			}
			this.getServletContext().getRequestDispatcher("/views/mesMissions.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("fromUrl", request.getRequestURI());
			response.sendRedirect("/coursefacile/login");
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	@Override
	public String getServletInfo() {
		return "Short description";
	}

}
