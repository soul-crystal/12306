package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.SeatNum;
import cn.dao.SeatNumDao;
import cn.dbc.BaseDao;

public class SeatNumDaoImpl implements SeatNumDao
{
	BaseDao bs=new BaseDao();
	@Override
	public SeatNum findSeatNumById(int id)
	{
		String sql="select * from seatnum where id=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(id);
		List<SeatNum> ls=bs.getQuery(sql, lo, SeatNum.class);
		return ls.size()>0?ls.get(0):null;
	}

}
