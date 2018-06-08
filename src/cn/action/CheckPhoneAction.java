package cn.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.framework.Action;

public class CheckPhoneAction implements Action
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
			out.print("请输入手机号码!");
		}
		else 
		{
			String regex="^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$";
			if(name.matches(regex))
			{
				out.print("");
			}
			else 
			{
				out.print("您输入的手机号码不是有效的格式！");
			}
		}
		out.flush();
		out.close();
		return null;
	}
}
