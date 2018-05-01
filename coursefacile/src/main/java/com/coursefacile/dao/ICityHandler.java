package com.coursefacile.dao;

import com.coursefacile.model.City;

import javax.servlet.http.HttpServletRequest;

public interface ICityHandler {
     /**
      *
      * @param id city id
      * @return the City that matches to the given id
      */
     City getCity(int id);

     /**
      * filter cities via request parameters
      * @param request the servlet request
      * @return String of json array   of filtrated cities
      */
     String filterCities(HttpServletRequest request);
}
