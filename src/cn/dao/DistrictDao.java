package cn.dao;

import java.util.List;

import cn.bean.District;

public interface DistrictDao
{
	public District findDistrictIdByName(String name);
	
	public List<District> findDistrictByCityid(int cid);
	
	public District findDistrictIdByid(int id);
}
