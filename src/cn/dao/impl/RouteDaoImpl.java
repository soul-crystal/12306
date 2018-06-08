package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.Route;
import cn.dao.RouteDao;
import cn.dbc.BaseDao;

public class RouteDaoImpl implements RouteDao
{
	BaseDao bd=new BaseDao();
	@Override
	public List<Route> findRouteByRoutenameid(int routenameid)
	{
		String sql = "select * from route where routenameid=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(routenameid);
		List<Route> list = bd.getQuery(sql, listsql, Route.class);
		return list;
	}
	
	@Override
	public Route findRouteById(int id)
	{
		String sql = "select * from route where id=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(id);
		List<Route> list = bd.getQuery(sql, listsql, Route.class);
		return list.size()>0?list.get(0):null;
	}
}
