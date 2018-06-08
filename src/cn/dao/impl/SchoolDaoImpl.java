package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.School;
import cn.dao.SchoolDao;
import cn.dbc.BaseDao;

public class SchoolDaoImpl implements SchoolDao
{
	BaseDao bs=new BaseDao();
	public List<School> findSchoolByProvinceId(int provinceid)
	{
		String sql="select * from school where provinceid=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(provinceid);
		List<School> ls=bs.getQuery(sql, lo, School.class);
		return ls;
	}

	public School findSchoolByName(String name)
	{
		String sql="select * from school where name=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(name);
		List<School> ls=bs.getQuery(sql, lo, School.class);
		if(ls.size()>0) 
		{
			return ls.get(0);
		}
		return null;
	}

	public List<School> findAllSchool()
	{
		String sql="select * from school";
		List<School> ls=bs.getQuery(sql, new ArrayList<Object>(), School.class);
		return ls;
	}
	
	public School findSchoolById(int id)
	{
		School s=null;
		List<Object> list=new ArrayList<Object>();
		list.add(id);
		s=(School) bs.getQuery("select * from school where id=?", list, School.class).get(0);
		return s;
	}
	@Override
	public School findSchoolByNameAndProvinceid(String name ,int provinceid)
	{
		School s=null;
		List<Object> list=new ArrayList<Object>();
		list.add(name);
		list.add(provinceid);
		s=(School) bs.getQuery("select * from school where name=? and provinceid=?", list, School.class).get(0);
		return s;
	}

}
