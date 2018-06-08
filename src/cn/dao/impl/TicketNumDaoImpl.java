package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.TicketNum;
import cn.dao.TicketNumDao;
import cn.dbc.BaseDao;

public class TicketNumDaoImpl implements TicketNumDao
{
	BaseDao bd=new BaseDao();
	@Override
	public List<TicketNum> findTicketNumByTrainnumid(int trainnumid)
	{
		String sql = "select * from TicketNum where trainnumid=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(trainnumid);
		List<TicketNum> list = bd.getQuery(sql, listsql, TicketNum.class);
		return list;
	}
}
