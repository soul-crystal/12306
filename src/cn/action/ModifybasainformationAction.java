package cn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dao.ContactDao;
import cn.dao.UserDao;
import cn.dao.impl.ContactDaoImpl;
import cn.dao.impl.UserDaoImpl;
import cn.framework.Action;

public class ModifybasainformationAction implements Action
{
	UserDao userDao=new UserDaoImpl();
	ContactDao contactDao=new ContactDaoImpl(); 
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
	{
		boolean isflag=false;
		String a=null;
		if(userDao.findUserByUsername(request.getParameter("usernames")).getPassword()==request.getParameter("password"))
		{
			isflag=contactDao.updateSexAndBirthByUseridAndIsmaincontact(request.getParameter("sex2"), request.getParameter("changebirth"), userDao.findUserByUsername(request.getParameter("username")).getId());
		}
		else
		{
			isflag=false;
		}
		if(isflag)
		{
			a="成功修改用户信息";
		}
		else
		{
			a="请输入正确密码";
		}
		request.getSession().setAttribute("a", a);
		return "ViewPersonalInformation.jsp";
	}

}
