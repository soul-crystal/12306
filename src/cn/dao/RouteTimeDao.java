package cn.dao;

import java.util.List;

import cn.bean.RouteTime;

public interface RouteTimeDao
{
	public List<RouteTime> findRouteTimeByTrainnumid(int trainnumid);

}
