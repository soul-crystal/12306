package cn.dao;

import java.util.List;

import cn.bean.IdType;

public interface IdTypeDao
{
	public IdType findIdTypeByName(String name);
	
	public IdType findIdTypeById(int id);
	
	public List<IdType> findAllIdType();
}
