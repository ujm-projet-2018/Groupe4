package com.coursefacile.dao;

import com.coursefacile.model.City;

import javax.servlet.http.HttpServletRequest;

public interface ICityHandler {
     City getCity(int id);
     String filterCities(HttpServletRequest request);
}
