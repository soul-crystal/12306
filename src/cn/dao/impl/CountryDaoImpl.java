package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.Country;
import cn.dao.CountryDao;
import cn.dbc.BaseDao;

public class CountryDaoImpl implements CountryDao
{
	BaseDao bs=new BaseDao();

	public List<Country> findAllCountry()
	{
		String sql="select * from country";
		List<Country> lc=bs.getQuery(sql, new ArrayList<Object>(), Country.class);
		return lc;
	}

	public Country findCountryByName(String name)
	{
		String sql="select * from country where name=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(name);
		List<Country> lc=bs.getQuery(sql, lo, Country.class);
		if(lc.size()>0) 
		{
			return lc.get(0);
		}
		return null;
	}
	
	@Override
	public Country findCountryById(int id)
	{
		Country c=null;
		List<Object> list=new ArrayList<Object>();
		list.add(id);
		c=(Country) bs.getQuery("select * from country where id=?", list, Country.class).get(0);
		return c;
	}
	@Override
	public Country findCountryByCountryname(String countryname)
	{
		Country c=null;
		List<Object> list=new ArrayList<Object>();
		list.add(countryname);
		c=(Country) bs.getQuery("select * from country where name=?", list, Country.class).get(0);
		return c;
	}

}
