package cn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dao.ContactDao;
import cn.dao.UserDao;
import cn.dao.impl.ContactDaoImpl;
import cn.dao.impl.UserDaoImpl;
import cn.framework.Action;

public class DeletecontactAction implements Action
{
	ContactDao contactDao=new ContactDaoImpl();
	UserDao userDao=new UserDaoImpl();
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
	{
		//User user=(User) request.getSession().getAttribute("user");
		String num=request.getParameter("num");
		int contactid=Integer.parseInt(num);
		//String username=request.getParameter("username");
		contactDao.deleteContactById(contactid);
		return "CommonContact.do";
	}

}
