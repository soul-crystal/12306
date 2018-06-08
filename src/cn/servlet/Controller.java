package cn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.framework.Action;

public class Controller extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		Action action=getAction(request);
		String path=action.execute(request, response);
		if(path!=null) 
		{
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

	
	private Action getAction(HttpServletRequest request)
	{
		Action action=null;
		String path=request.getServletPath();
		path=path.substring(path.lastIndexOf("/")+1,path.length()-3);
		path=path.substring(0,1).toUpperCase()+path.substring(1);
		String classname="cn.action."+path+"Action";
		try
		{
			action=(Action) Class.forName(classname).newInstance();
		} 
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return action;
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		this.doGet(request, response);
	}

}
