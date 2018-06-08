package cn.dao;

import java.util.List;

import cn.bean.School;

public interface SchoolDao
{
	public List<School> findSchoolByProvinceId(int provinceid);
	
	public School findSchoolByName(String name);
	
	public List<School> findAllSchool();
	
	public School findSchoolById(int id);
	
	public School findSchoolByNameAndProvinceid(String name ,int provinceid);
	
}
