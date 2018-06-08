package cn.dao;

import java.util.List;
import java.util.Set;

import cn.bean.Station;

public interface StationDao
{
	public Station findStationByName(String name);

	public Station findStationById(int id);

	public Set<String> findStation(String msg);
	
	public List<Station> findStationByCityid(int cityid);
}
