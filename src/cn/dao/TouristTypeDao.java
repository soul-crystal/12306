package cn.dao;

import java.util.List;

import cn.bean.TouristType;

public interface TouristTypeDao
{
	public TouristType findTouristTypeByName(String name);
	
	public TouristType findTouristTypeById(int id);
	
	public List<TouristType> findAllTouristType();
}
