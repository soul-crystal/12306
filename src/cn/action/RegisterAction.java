package cn.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.City;
import cn.bean.Country;
import cn.bean.Province;
import cn.bean.School;
import cn.dao.CityDao;
import cn.dao.CountryDao;
import cn.dao.ProvinceDao;
import cn.dao.SchoolDao;
import cn.dao.impl.CityDaoImpl;
import cn.dao.impl.CountryDaoImpl;
import cn.dao.impl.ProvinceDaoImpl;
import cn.dao.impl.SchoolDaoImpl;
import cn.framework.Action;

public class RegisterAction implements Action
{
	@SuppressWarnings("deprecation")
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		CountryDao countrydao=new CountryDaoImpl();
		List<Country> lcountry=countrydao.findAllCountry();
		request.setAttribute("lcountry", lcountry);
		ProvinceDao provincedao=new ProvinceDaoImpl();
		List<Province> lprovince=provincedao.findAllProvince();
		request.setAttribute("lprovince", lprovince);
		SchoolDao schooldao=new SchoolDaoImpl();
		List<School> lschool=schooldao.findSchoolByProvinceId(1);
		request.setAttribute("lschool", lschool);
		Date d=new Date(System.currentTimeMillis());
		int year=d.getYear()+1900;
		List<Integer> li=new ArrayList<Integer>();
		for(int i=0;i<10;i++) 
		{
			li.add(year);
			year--;
		}
		request.setAttribute("li", li);
		CityDao citydao=new CityDaoImpl();
		List<City> lcity=citydao.findAllCity();
		request.setAttribute("lcity", lcity);
		return "register.jsp";
	}
}
