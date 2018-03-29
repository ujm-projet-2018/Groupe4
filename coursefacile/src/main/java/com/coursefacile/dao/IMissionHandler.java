package com.coursefacile.dao;

import com.coursefacile.model.Mission;

public interface IMissionHandler {
    public boolean add(Mission mission);

    public boolean update(Mission mission);

    public boolean delete(Mission mission);

    public Mission get(Mission mission);
}
