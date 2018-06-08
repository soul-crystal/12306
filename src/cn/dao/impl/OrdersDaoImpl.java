package cn.dao.impl;

import java.util.ArrayList;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import cn.bean.Orders;
import cn.dao.OrdersDao;
import cn.dbc.BaseDao;

public class OrdersDaoImpl implements OrdersDao
{
	BaseDao bs=new BaseDao();
	@Override
	public List<Orders> findHistoryOrdersByUserid(int userid)
	{
		List<Orders> li=null;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		String sql="select * from orders where userid=?";
		li=bs.getQuery(sql, list, Orders.class);
		if(li.size()>0)
		{
			return li;
		}
		else
		{
			return null;
		}
	}

	@Override
	public List<Orders> findOrdersByUseridAndOrdertime1(int userid,
			Date startordertime, Date endordertime,int pageIndex,int pageSize)
	{
		List<Orders> li=null;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(new Timestamp(startordertime.getTime()));
		list.add(new Timestamp(endordertime.getTime()));
		list.add((pageIndex-1)*pageSize);
		list.add(pageSize);
		String sql="select * from orders where userid=? and ordertime>=? and ordertime<=? limit ?,?";
		li=bs.getQuery(sql, list, Orders.class);
		if(li.size()>0)
		{
			return li;
		}
		else
		{
			return null;
		}
	}

	@Override
	public List<Orders> findHistoryOrdersByUseridAndOrdertimeAndName1(
			int userid, Date startordertime, Date endordertime,
			String name,int pageIndex,int pageSize)
	{
		List<Orders> li=null;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(new Timestamp(startordertime.getTime()));
		list.add(new Timestamp(endordertime.getTime()));
		list.add(name);
		list.add((pageIndex-1)*pageSize);
		list.add(pageSize);
		String sql="select * from orders where userid=? and ordertime>=? and ordertime<=? and name=? limit ?,?";
		li=bs.getQuery(sql, list, Orders.class);
		if(li.size()>0)
		{
			return li;
		}
		else
		{
			return null;
		}
	}

	@Override
	public List<Orders> findHistoryOrdersByUseridAndStarttime1(int userid,
			Date starttime,Date endtime,int pageIndex,int pageSize)
	{
		List<Orders> li=null;
		String sql="select * from orders where userid=? and starttime>=? and starttime<=? limit ?,?";
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(new Timestamp(starttime.getTime()));
		list.add(new Timestamp(endtime.getTime()));
		list.add((pageIndex-1)*pageSize);
		list.add(pageSize);
		li=bs.getQuery(sql, list, Orders.class);
		if(li.size()>0)
		{
			return li;
		}
		else
		{
			return null;
		}
	}

	@Override
	public List<Orders> findHistoryOrdersByUseridAndStarttimeAndName1(
			int userid, Date starttime, Date endtime, String name,int pageIndex,int pageSize)
	{
		List<Orders> li=null;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(new Timestamp(starttime.getTime()));
		list.add(new Timestamp(endtime.getTime()));
		list.add(name);
		list.add((pageIndex-1)*pageSize);
		list.add(pageSize);
		String sql="select * from orders where userid=? and starttime>=? and starttime<=? and name=? limit ?,?";
		li=bs.getQuery(sql, list, Orders.class);
		if(li.size()>0)
		{
			return li;
		}
		else
		{
			return null;
		}
	}

	@Override
	public List<Orders> findOrdersByUseridAndOrdertime(int userid,
			Date startordertime, Date endordertime)
	{
		List<Orders> li=null;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(new Timestamp(startordertime.getTime()));
		list.add(new Timestamp(endordertime.getTime()));
		String sql="select * from orders where userid=? and ordertime>=? and ordertime<=?";
		li=bs.getQuery(sql, list, Orders.class);
		if(li.size()>0)
		{
			return li;
		}
		else
		{
			return null;
		}
	}

	@Override
	public List<Orders> findHistoryOrdersByUseridAndOrdertimeAndName(
			int userid, Date startordertime, Date endordertime,
			String name)
	{
		List<Orders> li=null;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(new Timestamp(startordertime.getTime()));
		list.add(new Timestamp(endordertime.getTime()));
		list.add(name);
		String sql="select * from orders where userid=? and ordertime>=? and ordertime<=? and name=?";
		li=bs.getQuery(sql, list, Orders.class);
		if(li.size()>0)
		{
			return li;
		}
		else
		{
			return null;
		}
	}

	@Override
	public List<Orders> findHistoryOrdersByUseridAndStarttime(int userid,
			Date starttime,Date endtime)
	{
		List<Orders> li=null;
		String sql="select * from orders where userid=? and starttime>=? and starttime<=? ";
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(new Timestamp(starttime.getTime()));
		list.add(new Timestamp(endtime.getTime()));
		li=bs.getQuery(sql, list, Orders.class);
		if(li.size()>0)
		{
			return li;
		}
		else
		{
			return null;
		}
	}

	@Override
	public List<Orders> findHistoryOrdersByUseridAndStarttimeAndName(
			int userid, Date starttime, Date endtime, String name)
	{
		List<Orders> li=null;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(new Timestamp(starttime.getTime()));
		list.add(new Timestamp(endtime.getTime()));
		list.add(name);
		String sql="select * from orders where userid=? and starttime>=? and starttime<=? and name=? ";
		li=bs.getQuery(sql, list, Orders.class);
		if(li.size()>0)
		{
			return li;
		}
		else
		{
			return null;
		}
	}
	
	public boolean updateOrder(Orders o)
	{
		String sql="insert into orders(ordertime,name, idtype, touristtype, trainname, startstation, endstation, seattype, price,starttime,endtime,userid) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> lo=new ArrayList<Object>();
		lo.add(o.getOrdertime());
		lo.add(o.getName());
		lo.add(o.getIdtype());
		lo.add(o.getTouristtype());
		lo.add(o.getTrainname());
		lo.add(o.getStartstation());
		lo.add(o.getEndstation());
		lo.add(o.getSeattype());
		lo.add(o.getPrice());
		lo.add(o.getStarttime());
		lo.add(o.getEndtime());
		lo.add(o.getUserid());
		boolean isflag=bs.getUpdate(sql, lo);
		return isflag;
	}
}
