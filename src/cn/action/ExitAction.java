package cn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.framework.Action;

public class ExitAction implements Action
{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		request.getSession().removeAttribute("user");
		return "/login.jsp";
	}

}