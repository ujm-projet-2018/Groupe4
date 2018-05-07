package com.coursefacile.dao;

import com.coursefacile.model.Mission;

import java.util.List;

public interface IMissionHandler {
    public boolean add(Mission mission);

    public boolean update(Mission mission);

    public boolean delete(Mission mission);

    public Mission get(int missionId);

    public List<Mission> relatedMissions(int cityId, int missionId);
}
