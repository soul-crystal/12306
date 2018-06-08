package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.Train;
import cn.dao.TrainDao;
import cn.dbc.BaseDao;

public class TrainDaoImpl implements TrainDao
{
	BaseDao bd=new BaseDao();
	@Override
	public Train findTrainById(int id)
	{
		String sql="select * from train where id=?";
		List<Object> listsql=new ArrayList<Object>();
		listsql.add(id);
		List<Train> list=bd.getQuery(sql, listsql, Train.class);
		return list.size()>0?list.get(0):null;
	}
	
	@Override
	public Train findTrainByName(String name)
	{
		String sql="select * from train where name=?";
		List<Object> listsql=new ArrayList<Object>();
		listsql.add(name);
		List<Train> list=bd.getQuery(sql, listsql, Train.class);
		return list.size()>0?list.get(0):null;
	}
}
