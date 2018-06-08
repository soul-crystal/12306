package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.TouristType;
import cn.dao.TouristTypeDao;
import cn.dbc.BaseDao;

public class TouristTypeDaoImpl implements TouristTypeDao
{
	BaseDao bs=new BaseDao();

	public TouristType findTouristTypeByName(String name)
	{
		String sql="select * from touristtype where name=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(name);
		List<TouristType> lt=bs.getQuery(sql, lo, TouristType.class);
		if(lt.size()>0) 
		{
			return lt.get(0);
		}
		return null;
	}

	@Override
	public TouristType findTouristTypeById(int id)
	{
		TouristType t=null;
		List<Object> list=new ArrayList<Object>();
		list.add(id);
		t=(TouristType) bs.getQuery("select * from touristtype where id=?", list, TouristType.class).get(0);
		return t;
	}
	@Override
	public List<TouristType> findAllTouristType()
	{
		List<TouristType> li=null;
		List<Object> list=new ArrayList<Object>();
		li=bs.getQuery("select * from touristtype", list, TouristType.class);
		return li;
	}
}
