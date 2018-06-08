package cn.action;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.User;
import cn.framework.Action;

public class OrdersInformationAction implements Action
{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		User user=(User) request.getSession().getAttribute("user");
		if(user!=null)
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date =sdf.format(new Date(System.currentTimeMillis()));
			String date1 =sdf.format(new Date(System.currentTimeMillis()-86400000));
			String date2 =sdf.format(new Date(System.currentTimeMillis()-1382400000));
			request.getSession().setAttribute("date", date);
			request.getSession().setAttribute("date1", date1);
			request.getSession().setAttribute("date2", date2);
			return "OrderInformation.jsp";
		}
		else
		{
			return "login.jsp";
		}
	}

}
