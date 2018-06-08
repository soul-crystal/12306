package cn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.User;
import cn.dao.UserDao;
import cn.dao.impl.UserDaoImpl;
import cn.framework.Action;

public class LoginAction implements Action
{
	UserDao userDao=new UserDaoImpl();
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		String name=request.getParameter("loginname");
		String password=request.getParameter("password");
		User u=userDao.login(name, password);
		if(u!=null)
		{
			request.getSession().setAttribute("user",u);
			return "/index.jsp";
		}
		else
		{
			String message="用户名或者密码错误!";
			request.setAttribute("message", message);
			return "/login.jsp";
		}
	}
}
