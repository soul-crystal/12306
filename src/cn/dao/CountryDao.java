package cn.dao;

import java.util.List;

import cn.bean.Country;

public interface CountryDao
{
	public Country findCountryByName(String name);

	public List<Country> findAllCountry();
	
	public Country findCountryById(int id);
	
	public Country findCountryByCountryname(String countryname);
}
