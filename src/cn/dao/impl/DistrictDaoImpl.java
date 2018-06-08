package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.District;
import cn.dao.DistrictDao;
import cn.dbc.BaseDao;

public class DistrictDaoImpl implements DistrictDao
{
	BaseDao bs=new BaseDao();
	@Override
	public District findDistrictIdByName(String name)
	{
		List<Object> lo=new ArrayList<Object>();
		lo.add(name);
		List<District> ld=bs.getQuery("select * from district where name=?", lo, District.class);
		if(ld.size()!=0)
		{
			District d=ld.get(0);
			return d;
		}
		else
			return null;
	}
	
	@Override
	public District findDistrictIdByid(int id)
	{
		List<Object> lo=new ArrayList<Object>();
		lo.add(id);
		List<District> ld=bs.getQuery("select * from district where id=?", lo, District.class);
		if(ld.size()!=0)
		{
			District d=ld.get(0);
			return d;
		}
		else
			return null;
		
		
	}

	@Override
	public List<District> findDistrictByCityid(int cid)
	{
		List<Object> lo=new ArrayList<Object>();
		lo.add(cid);
		List<District> ld=bs.getQuery("select * from district where cityid=?", lo, District.class);
		return ld;
	}

}
