package cn.dao;

import java.util.List;

import cn.bean.Route;

public interface RouteDao
{
	public List<Route> findRouteByRoutenameid(int routenameid);

	public Route findRouteById(int id);

}
