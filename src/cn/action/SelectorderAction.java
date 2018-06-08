package cn.action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.Orders;
import cn.bean.User;
import cn.dao.OrdersDao;
import cn.dao.UserDao;
import cn.dao.impl.OrdersDaoImpl;
import cn.dao.impl.UserDaoImpl;
import cn.framework.Action;
import cn.util.PageBean;

public class SelectorderAction implements Action
{
	OrdersDao ordersDao=new OrdersDaoImpl();
	UserDao userDao=new UserDaoImpl();
	List<Orders> listob=new ArrayList<Orders>();
	List<Orders> listobs=new ArrayList<Orders>();
	Date nowdate=new Date(System.currentTimeMillis());
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
	{
		User user=(User) request.getSession().getAttribute("user");
		String selects=request.getParameter("selectss");
		PageBean pb=new PageBean();
		int pageIndex=1;
		if(request.getParameter("pageIndex")!=null)
		{
			pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		}
		int pageSize=2;
		String starttime=request.getParameter("starttime2");
		String endtime=request.getParameter("endtime2");
		String touristname=request.getParameter("touristname2");
		System.out.println(touristname);
		//String ordersselect=request.getParameter("ordersselect");
		//System.out.println(ordersselect);
		/*if(ordersselect.equals("全部"))
		{*/
			String message=null;
			if(!touristname.isEmpty())
			{
				request.setAttribute("touristname", touristname);
				List<Orders> lorders=ordersDao.findHistoryOrdersByUserid(user.getId());
				int i=0;
				for(Orders o:lorders)
				{
					if(o.getName().equals(touristname))
					{
						break;
					}
					else
					{
						i++;
					}
				}
				if(i==lorders.size())
				{
					touristname="";
					message="请输入正确的乘客姓名！";
				}
			}
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date=null;
			java.util.Date date1=null;
			java.sql.Date sd =null;
			java.sql.Date sd1 =null;
			try
			{
				date = dateFormat.parse(starttime);
				date1 = dateFormat.parse(endtime);
				sd= new java.sql.Date(date.getTime());
				sd1= new java.sql.Date(date1.getTime());
				request.setAttribute("starttime", sd);
				request.setAttribute("endtime", sd1);
			} catch (ParseException e)
			{
				e.printStackTrace();
			}
			if(sd.getTime()>=sd1.getTime())
			{
				message="请选择正确的查询订单时间";
			}
			else
			{
				if(selects.equals("按订票日期查询"))
				{
					if(touristname.equals(""))
					{
						List<Orders> list2=ordersDao.findOrdersByUseridAndOrdertime(user.getId(),sd,sd1);
						if(list2==null)
						{
							message="该时间段没有订单";
							listob=null;
						}
						else
						{
							if(!(list2.size()<0))
							{
								pb.setCount(list2.size());
								pb.setPageIndex(pageIndex);
								pb.setPageSize(pageSize);
								pb.setPages(pb.getPage());
								listob=ordersDao.findOrdersByUseridAndOrdertime1(user.getId(),sd,sd1,pageIndex,pageSize);
							}
						}
					}
					else
					{
						List<Orders> list2=ordersDao.findHistoryOrdersByUseridAndOrdertimeAndName(user.getId(),sd,sd1,touristname);
						if(list2==null)
						{
							message="该时间段没有订单";
							listob=null;
						}
						else
						{
							if(!(list2.size()<0))
							{
								pb.setCount(list2.size());
								pb.setPageIndex(pageIndex);
								pb.setPageSize(pageSize);
								pb.setPages(pb.getPage());
								listob=ordersDao.findHistoryOrdersByUseridAndOrdertimeAndName1(user.getId(),sd,sd1,touristname,pageIndex,pageSize);
							}
						}
					}
				}
				else
				{
					if(touristname.equals(""))
					{
						List<Orders> list2=ordersDao.findHistoryOrdersByUseridAndStarttime(user.getId(),sd,sd1);
						if(list2==null)
						{
							message="该时间段没有订单";
							listob=null;
						}
						else
						{
							if(!(list2.size()<0))
							{
								pb.setCount(list2.size());
								pb.setPageIndex(pageIndex);
								pb.setPageSize(pageSize);
								pb.setPages(pb.getPage());
								listob=ordersDao.findHistoryOrdersByUseridAndStarttime1(user.getId(),sd,sd1,pageIndex,pageSize);
							}
						}
					}
					else
					{
						List<Orders> list2=ordersDao.findHistoryOrdersByUseridAndStarttimeAndName(user.getId(),sd,sd1,touristname);
						if(list2==null)
						{
							message="该时间段没有订单";
							listob=null;
						}
						else
						{
							if(!(list2.size()<0))
							{
								pb.setCount(list2.size());
								pb.setPageIndex(pageIndex);
								pb.setPageSize(pageSize);
								pb.setPages(pb.getPage());
								listob=ordersDao.findHistoryOrdersByUseridAndStarttimeAndName1(user.getId(),sd,sd1,touristname,pageIndex,pageSize);
							}
						}
					}
				}
			}
			request.setAttribute("message", message);
		/*
		}
		
		else if(ordersselect.equals("可改签"))
		{
			for(Orders or:listob)
			{
				long l=or.getStarttime().getTime();
				long now=nowdate.getTime();
				long day=(now-l)/1000/60/60/24;
				if(day>10)
				{
					listobs.add(or);
				}
			}
		}
		else if(ordersselect.equals("可退票"))
		{
			for(Orders or:listob)
			{
				long l=or.getStarttime().getTime();
				long now=nowdate.getTime();
				long hour=(now-l)/1000/60/60;
				if(hour>0.5)
				{
					listobs.add(or);
				}
			}
		}*/
		request.setAttribute("selects", selects);
		request.setAttribute("pb",pb);
		
		request.setAttribute("listOrders", listob);
		request.setAttribute("listobs", listobs);
		return "OrdersResult.jsp";
	}

}
