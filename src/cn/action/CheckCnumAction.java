package cn.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.framework.Action;

public class CheckCnumAction implements Action
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
		String num=request.getParameter("num");
		try
		{
			name=new String(name.getBytes("iso-8859-1"),"utf-8");
			num=new String(num.getBytes("iso-8859-1"),"utf-8");
		} 
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		if(name.equals("")) 
		{
			out.print("请输入证件号码!");
		}
		else 
		{
			if(num.equals("1")) 
			{
				String regex1="^\\d{6}(19|20){1}[0-9]{2}(0[1-9]{1}|10|11|12)(0[1-9]{1}|1[0-9]{1}|2[0-9]{1}|30|31)\\w{4}$";
				if(name.matches(regex1)) 
				{
					out.println("");
				}
				else 
				{
					out.println("请正确输入18位的身份证号！");
				}
			}
			else if(num.equals("2")) 
			{
				String regex2="^[HMhm]{1}([0-9]{10}|[0-9]{8})$";
				if(name.matches(regex2)) 
				{
					out.println("");
				}
				else 
				{
					out.println("请输入有效的港澳居民通行证号码！");
				}
			}
			else if(num.equals("3")) 
			{
				String regex3="^[0-9]{10}$";
				if(name.matches(regex3)) 
				{
					out.println("");
				}
				else 
				{
					out.println("请输入有效的台湾居民通行证号码！");
				}
			}
			else if(num.equals("4")) 
			{
				String regex4="^[a-zA-Z0-9]{5,17}$";
				if(name.matches(regex4)) 
				{
					out.println("");
				}
				else 
				{
					out.println("请输入有效的护照号码！");
				}
			}
			else
			{
				out.println("");
			}
		}
		out.flush();
		out.close();
		return null;
	}
}
