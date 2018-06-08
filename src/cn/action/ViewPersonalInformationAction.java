package cn.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.City;
import cn.bean.Contact;
import cn.bean.Country;
import cn.bean.IdType;
import cn.bean.Province;
import cn.bean.School;
import cn.bean.TouristType;
import cn.bean.User;
import cn.dao.CityDao;
import cn.dao.ContactDao;
import cn.dao.CountryDao;
import cn.dao.IdTypeDao;
import cn.dao.ProvinceDao;
import cn.dao.SchoolDao;
import cn.dao.TouristTypeDao;
import cn.dao.UserDao;
import cn.dao.impl.CityDaoImpl;
import cn.dao.impl.ContactDaoImpl;
import cn.dao.impl.CountryDaoImpl;
import cn.dao.impl.IdTypeDaoImpl;
import cn.dao.impl.ProvinceDaoImpl;
import cn.dao.impl.SchoolDaoImpl;
import cn.dao.impl.TouristTypeDaoImpl;
import cn.dao.impl.UserDaoImpl;
import cn.framework.Action;

public class ViewPersonalInformationAction implements Action
{
	UserDao userDao=new UserDaoImpl();
	ContactDao contactDao = new ContactDaoImpl();
	CountryDao countryDao = new CountryDaoImpl();
	IdTypeDao idtypeDao=new IdTypeDaoImpl();
	ProvinceDao provinceDao=new ProvinceDaoImpl();
	TouristTypeDao touristtypeDao=new TouristTypeDaoImpl();
	SchoolDao schoolDao=new SchoolDaoImpl();
	CityDao cityDao=new CityDaoImpl();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		User user=(User) request.getSession().getAttribute("user");
		if(user!=null)
		{
			Contact contact=contactDao.findMainContactByUseridandIsmaincontact(user.getId());
			Country country=countryDao.findCountryById(contact.getCountryid());
			IdType idtype=idtypeDao.findIdTypeById(contact.getIdtypeid());
			TouristType touristtype=touristtypeDao.findTouristTypeById(contact.getTouristtypeid());
			request.setAttribute("contact", contact);
			request.setAttribute("user", user);
			request.setAttribute("country", country);
			request.setAttribute("idtype", idtype);
			request.setAttribute("touristtype", touristtype);
			if(touristtype.getId()==touristtypeDao.findTouristTypeByName("学生").getId())
			{
				Province province=provinceDao.findProvinceById(contact.getProvinceid());
				City city1=cityDao.findCityById(contact.getStartcityid());
				City city2=cityDao.findCityById(contact.getEndcityid());
				School school=schoolDao.findSchoolById(contact.getSchoolid());
				request.setAttribute("province", province);
				request.setAttribute("school", school);
				request.setAttribute("startcity", city1);
				request.setAttribute("endcity", city2);
			}
			return "ViewPersonalInformation.jsp";
		}
		else
		{
			return "login.jsp";
		}
	}

}
