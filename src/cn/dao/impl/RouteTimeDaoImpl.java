package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.RouteTime;
import cn.dao.RouteTimeDao;
import cn.dbc.BaseDao;

public class RouteTimeDaoImpl implements RouteTimeDao
{
	BaseDao bd=new BaseDao();
	@Override
	public List<RouteTime> findRouteTimeByTrainnumid(int trainnumid)
	{
		String sql = "select * from routetime where trainnumid=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(trainnumid);
		List<RouteTime> list = bd.getQuery(sql, listsql, RouteTime.class);
		return list;
	}
}
