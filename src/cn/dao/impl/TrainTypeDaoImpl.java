package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.TrainType;
import cn.dao.TrainTypeDao;
import cn.dbc.BaseDao;

public class TrainTypeDaoImpl implements TrainTypeDao
{
	BaseDao bd=new BaseDao();
	@Override
	public TrainType findTrainTypeById(int id)
	{
		String sql="select * from traintype where id=?";
		List<Object> listsql=new ArrayList<Object>();
		listsql.add(id);
		List<TrainType> list=bd.getQuery(sql, listsql, TrainType.class);
		return list.size()>0?list.get(0):null;
	}
}
