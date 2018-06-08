package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.IdType;
import cn.dao.IdTypeDao;
import cn.dbc.BaseDao;

public class IdTypeDaoImpl implements IdTypeDao
{
	BaseDao bs=new BaseDao();

	public IdType findIdTypeByName(String name)
	{
		String sql="select * from idtype where name=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(name);
		List<IdType> lit=bs.getQuery(sql, lo, IdType.class);
		if(lit.size()>0) 
		{
			return lit.get(0);
		}
		return null;
	}

	public IdType findIdTypeById(int id)
	{
		IdType i=null;
		List<Object> list=new ArrayList<Object>();
		list.add(id);
		i=(IdType) bs.getQuery("select * from idtype where id=?", list, IdType.class).get(0);
		return i;
	}
	@Override
	public List<IdType> findAllIdType()
	{
		List<IdType> li=null;
		List<Object> list=new ArrayList<Object>();
		li=bs.getQuery("select * from idtype", list, IdType.class);
		return li;
	}
}
