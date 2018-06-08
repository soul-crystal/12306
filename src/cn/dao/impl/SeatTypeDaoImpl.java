package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.SeatType;
import cn.dao.SeatTypeDao;
import cn.dbc.BaseDao;

public class SeatTypeDaoImpl implements SeatTypeDao
{
	BaseDao bd=new BaseDao();
	@Override
	public SeatType findSeatTypeById(int id)
	{
		String sql="select * from seattype where id=?";
		List<Object> listsql=new ArrayList<Object>();
		listsql.add(id);
		List<SeatType> list=bd.getQuery(sql, listsql, SeatType.class);
		return list.size()>0?list.get(0):null;
	}
	
	@Override
	public SeatType findSeatTypeByName(String name)
	{
		String sql="select * from seattype where name=?";
		List<Object> listsql=new ArrayList<Object>();
		listsql.add(name);
		List<SeatType> list=bd.getQuery(sql, listsql, SeatType.class);
		return list.size()>0?list.get(0):null;
	}
}
