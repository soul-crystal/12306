package cn.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import cn.bean.City;
import cn.dao.CityDao;
import cn.dbc.BaseDao;

public class CityDaoImpl implements CityDao
{
	BaseDao bd = new BaseDao();
	BaseDao bs = new BaseDao();
	@Override
	public City findCityByName(String name)
	{
		String sql = "select * from city where name=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(name);
		List<City> list = bd.getQuery(sql, listsql, City.class);
		return list.size() > 0 ? list.get(0) : null;
	}

	@Override
	public City findCityById(int id)
	{
		String sql = "select * from city where id=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(id);
		List<City> list = bd.getQuery(sql, listsql, City.class);
		return list.size() > 0 ? list.get(0) : null;
	}

	@Override
	public Set<String> findCity(String msg)
	{
		String sql = "select * from city where name like ?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(msg + "%");
		List<City> list = bd.getQuery(sql, listsql, City.class);
		Set<String> set = new HashSet<String>();
		for (City c : list)
		{
			set.add(c.getName());
		}
		return set;
	}
	
	@Override
	public List<City> findAllCity()
	{
		String sql="select * from city";
		List<City> lc=bs.getQuery(sql, new ArrayList<Object>(), City.class);
		return lc;
	}
	
	@Override
	public City findCityByNameAndProvinceid(String name, int provinceid)
	{
		City c=null;
		List<Object> list=new ArrayList<Object>();
		list.add(name);
		list.add(provinceid);
		c=(City) bs.getQuery("select * from city where name=? and provinceid=?", list, City.class).get(0);
		return c;
	}
}
