package cn.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.framework.Action;

public class CheckPwdAction implements Action
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
			out.print("请输入密码!");
		}
		else if(name.length()<6) 
		{
			out.print("密码长度不能少于6个字符!");
		}
		else
		{
			String regex="^\\S{6,20}$";
			if(name.matches(regex)) 
			{
				out.print("");
			}
			else 
			{
				out.print("密码由字母,数字或符号组成,且不超过20位!");
			}
		}
		out.flush();
		out.close();
		return null;
	}

}
