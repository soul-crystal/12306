package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.Province;
import cn.dao.ProvinceDao;
import cn.dbc.BaseDao;

public class ProvinceDaoImpl implements ProvinceDao
{
	BaseDao bs=new BaseDao();

	public List<Province> findAllProvince()
	{
		String sql="select * from province";
		List<Province> lp=bs.getQuery(sql, new ArrayList<Object>(), Province.class);
		return lp;
	}

	public Province findProvinceByName(String name)
	{
		String sql="select * from province where name=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(name);
		List<Province> lp=bs.getQuery(sql, lo, Province.class);
		if(lp.size()>0) 
		{
			return lp.get(0);
		}
		return null;
	}
	@Override
	public Province findProvinceById(int id)
	{
		List<Object> listsql=new ArrayList<Object>();
		listsql.add(id);
		List<Province> list=bs.getQuery("select * from province where id=?", listsql, Province.class);
		return list.size() > 0 ? list.get(0) : null;
	}
}
