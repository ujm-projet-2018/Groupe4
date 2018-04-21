/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.coursefacile.controller;

import com.coursefacile.dao.CityHandler;
import com.coursefacile.dao.ICityHandler;
import com.coursefacile.dao.SessionFactoryHelper;
import com.coursefacile.model.City;
import com.coursefacile.model.Mission;
import com.coursefacile.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author mzemroun
 */
public class MissionListing extends HttpServlet {

    
    Session session1 = SessionFactoryHelper.getSessionFactory().openSession();
    City city = null;
    String s;
    List<Mission> Lmissions1=new ArrayList<Mission>();
    List<Mission> Lmissions=new ArrayList<Mission>();
    Date dateDe;
    Date dateA;
    Date dateJ;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            User user1 =null;
	    int pageSize = 3;
            try{
                session1.beginTransaction();
                Criteria criteria = session1.createCriteria(City.class);
                Criterion critere = null;
                if(request.getParameter("city_id")!=null)
                critere = Restrictions.eq("id", Integer.parseInt(request.getParameter("city_id")));
                criteria.add(critere);
                city=(City) criteria.list().get(0);
                Criteria criteria1 = session1.createCriteria(Mission.class);
                Criterion critere1 = Restrictions.eq("city", city);
                SimpleDateFormat d = new SimpleDateFormat("dd/MM/yyyy");

                Criterion critere2 = null;
                try {
                    critere2 = Restrictions.eq("missionDate", d.parse(request.getParameter("date")));
                } catch (ParseException ex) {
                    Logger.getLogger(MissionListing.class.getName()).log(Level.SEVERE, null, ex);
                }
                criteria1.add(critere1);
                criteria1.add(critere2);
                Lmissions=criteria1.list(); 
                session1.getTransaction().commit();
                request.setAttribute("Lmissions", Lmissions);
                request.setAttribute("city", city);
                request.setAttribute("date", request.getParameter("date"));
                s=request.getParameter("date");
             }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session1.getTransaction().rollback();
	        }
        RequestDispatcher rd = request.getRequestDispatcher("views/adDisplayPage.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ICityHandler cityHandler =new CityHandler();
        City city2=cityHandler.getCity(Integer.parseInt(request.getParameter("city_id")));
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
        SimpleDateFormat date_format = new SimpleDateFormat("HH:mm:ss");
        try {
            dateDe=formatter.parse(request.getParameter("heure_de"));
            dateA=formatter.parse(request.getParameter("heure_de"));
        } catch (ParseException ex) {
            Logger.getLogger(MissionListing.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(s.equals(request.getParameter("date")) && city2.equals(city)){
            Lmissions1=Lmissions;
            Lmissions.removeAll(Lmissions);
            for(int i=0;i<Lmissions1.size();i++){
                String s1 =date_format.format(Lmissions1.get(i).getMissionDate());
                try {
                    dateJ=formatter.parse(s1);
                } catch (ParseException ex) {
                    Logger.getLogger(MissionListing.class.getName()).log(Level.SEVERE, null, ex);
                }
                if(dateJ.compareTo(dateDe)>0 && dateJ.compareTo(dateA)<0)
                    Lmissions.add(Lmissions1.get(i));
            }
            
        }
        else{
                        User user1 =null;
	    int pageSize = 3;
            try{
                session1.beginTransaction();
                Criteria criteria = session1.createCriteria(City.class);
                Criterion critere = null;
                if(request.getParameter("city_id")!=null)
                critere = Restrictions.eq("id", Integer.parseInt(request.getParameter("city_id")));
                criteria.add(critere);
                city=(City) criteria.list().get(0);
                Criteria criteria1 = session1.createCriteria(Mission.class);
                Criterion critere1 = Restrictions.eq("city", city);
                SimpleDateFormat d = new SimpleDateFormat("dd/MM/yyyy");

                Criterion critere2 = null;
                try {
                    critere2 = Restrictions.eq("missionDate", d.parse(request.getParameter("date")));
                } catch (ParseException ex) {
                    Logger.getLogger(MissionListing.class.getName()).log(Level.SEVERE, null, ex);
                }
                criteria1.add(critere1);
                criteria1.add(critere2);
                Lmissions1=criteria1.list(); 
                session1.getTransaction().commit();
                for(int i=0;i<Lmissions1.size();i++){
                String s1 =date_format.format(Lmissions1.get(i).getMissionDate());
                try {
                    dateJ=formatter.parse(s1);
                } catch (ParseException ex) {
                    Logger.getLogger(MissionListing.class.getName()).log(Level.SEVERE, null, ex);
                }
                if(dateJ.compareTo(dateDe)>0 && dateJ.compareTo(dateA)<0)
                    Lmissions.add(Lmissions1.get(i));
                }
            }
            catch (HibernateException e) {
	            e.printStackTrace();
	            session1.getTransaction().rollback();
	        }
            request.setAttribute("Lmissions", Lmissions);
            RequestDispatcher rd = request.getRequestDispatcher("views/adDisplayPage.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
