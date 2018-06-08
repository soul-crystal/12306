package cn.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.Contact;
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

public class CommonContactAction implements Action
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
			List<Contact> listContact=contactDao.findContactByUserid(user.getId());
			List<Object> lidtype=new ArrayList<Object>();
			List<Object> lidtype2=new ArrayList<Object>();
			for(int i=0;i<listContact.size();i++)
			{
				if(listContact.get(i).getIdtypeid()==idtypeDao.findIdTypeByName("二代身份证").getId())
				{
					lidtype.add("二代身份证");
				}
				else if(listContact.get(i).getIdtypeid()==idtypeDao.findIdTypeByName("台湾通行证").getId())
				{
					lidtype.add("台湾通行证");
				}
				else if(listContact.get(i).getIdtypeid()==idtypeDao.findIdTypeByName("港澳通行证").getId())
				{
					lidtype.add("港澳通行证");
				}
				else if(listContact.get(i).getIdtypeid()==idtypeDao.findIdTypeByName("护照").getId())
				{
					lidtype.add("护照");
				}
			}
			for(int i=0;i<listContact.size();i++)
			{
				if(listContact.get(i).getTouristtypeid()==touristtypeDao.findTouristTypeByName("成人").getId())
				{
					lidtype2.add( "成人");
				}
				else if(listContact.get(i).getTouristtypeid()==touristtypeDao.findTouristTypeByName("学生").getId())
				{
					lidtype2.add("学生");
				}
				else if(listContact.get(i).getTouristtypeid()==touristtypeDao.findTouristTypeByName("儿童").getId())
				{
					lidtype2.add("儿童");
				}
				else if(listContact.get(i).getTouristtypeid()==touristtypeDao.findTouristTypeByName("残疾军人、伤残人民警察").getId())
				{
					lidtype2.add("残疾军人、伤残人民警察");
				}
			}
			request.getSession().setAttribute("listContact", listContact);
			request.getSession().setAttribute("lidtype", lidtype);
			request.getSession().setAttribute("lidtype2", lidtype2);
			return "CommonContact.jsp";
		}
		else
		{
			return "login.jsp";
		}
	}

}