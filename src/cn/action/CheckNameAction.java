package cn.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.dao.UserDao;
import cn.dao.impl.UserDaoImpl;
import cn.framework.Action;

public class CheckNameAction implements Action
{
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		PrintWriter out=null;
		try
		{
			out = response.getWriter();
		} 
		catch (IOException e1)
		{
			e1.printStackTrace();
		}
		String name=request.getParameter("name");
		try
		{
			name=new String(name.getBytes("iso-8859-1"),"utf-8");
		} 
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		if(name.equals("")) 
		{
			out.print("请输入用户名!");
		}
		else if(name.length()<6) 
		{
			out.print("用户名长度不能少于6个字符!");
		}
		else 
		{
			String regex="^[a-zA-Z]\\w{5,30}$";
			if(name.matches(regex)) 
			{
				UserDao ud=new UserDaoImpl();
				boolean isFlag=ud.checkName(name);
				if(isFlag)
				{
					out.print("该用户名已经占用,请重新选择用户名!");
				}
				else
				{
					out.println("");
				}
			}
			else 
			{
				out.println("用户名须以字母开头,且只能由字母,数字或下划线组成!");
			}
		}
		out.flush();
		out.close();
		return null;
	}

}
