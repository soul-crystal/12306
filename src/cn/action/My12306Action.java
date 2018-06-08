package cn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.Contact;
import cn.bean.User;
import cn.dao.ContactDao;
import cn.dao.impl.ContactDaoImpl;
import cn.framework.Action;

public class My12306Action implements Action
{
	ContactDao contactDao=new ContactDaoImpl();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		User user=(User) request.getSession().getAttribute("user");
		if(user!=null)
		{
			Contact contact=contactDao.findMainContactByUseridandIsmaincontact(user.getId());
			request.setAttribute("contact", contact);
		}
		return "My12306.jsp";
	}

}
