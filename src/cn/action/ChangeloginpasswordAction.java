package cn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.User;
import cn.dao.UserDao;
import cn.dao.impl.UserDaoImpl;
import cn.framework.Action;

public class ChangeloginpasswordAction implements Action
{
	UserDao userDao = new UserDaoImpl();
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
	{
		User user=(User) request.getSession().getAttribute("user");
		if(user!=null)
		{
			String newpwd=request.getParameter("newpwd");
			boolean isflag=userDao.changePasswordByUsername(user.getUsername(), newpwd);
			if(isflag)
			{
				return "login.jsp";
			}
			else
			{
				return "ChangeUserPassword.jsp";
			}
		}
		else
		{
			return "login.jsp";
		}
	}

}
