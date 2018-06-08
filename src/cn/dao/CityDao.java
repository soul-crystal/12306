package cn.dao;

import java.util.List;
import java.util.Set;

import cn.bean.City;

public interface CityDao
{
	public City findCityByName(String name);

	public City findCityById(int id);

	public Set<String> findCity(String msg);
	
	public List<City> findAllCity();
	
	public City findCityByNameAndProvinceid(String name,int provinceid);
}
