package cn.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import cn.bean.Station;
import cn.dao.StationDao;
import cn.dbc.BaseDao;

public class StationDaoImpl implements StationDao
{
	BaseDao bd = new BaseDao();

	@Override
	public Station findStationByName(String name)
	{
		String sql = "select * from station where name=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(name);
		List<Station> list = bd.getQuery(sql, listsql, Station.class);
		return list.size() > 0 ? list.get(0) : null;
	}

	@Override
	public Station findStationById(int id)
	{
		String sql = "select * from station where id=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(id);
		List<Station> list = bd.getQuery(sql, listsql, Station.class);
		return list.size() > 0 ? list.get(0) : null;
	}

	@Override
	public Set<String> findStation(String msg)
	{
		String sql = "select * from station where name like ?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(msg + "%");
		List<Station> list = bd.getQuery(sql, listsql, Station.class);
		Set<String> set = new HashSet<String>();
		for (Station c : list)
		{
			set.add(c.getName());
		}
		return set;
	}

	@Override
	public List<Station> findStationByCityid(int cityid)
	{
		String sql = "select * from station where cityid=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(cityid);
		List<Station> list = bd.getQuery(sql, listsql, Station.class);
		return list;
	}
}