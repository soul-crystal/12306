package cn.dao;

import java.util.List;

import cn.bean.Province;

public interface ProvinceDao
{
	public List<Province> findAllProvince();
	
	public Province findProvinceByName(String name);
	
	public Province findProvinceById(int id);

}	
