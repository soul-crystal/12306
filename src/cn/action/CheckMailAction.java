package cn.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.framework.Action;

public class CheckMailAction implements Action
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
			out.print("");
		}
		else 
		{
			String regex="^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
			if(name.matches(regex))
			{
				out.print("");
			}
			else 
			{
				out.print("请输入有效的电子邮件地址！");
			}
		}
		out.flush();
		out.close();
		return null;
	}
}
