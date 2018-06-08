package cn.dao;

import java.sql.Date;
import java.util.List;

import cn.bean.Orders;

public interface OrdersDao
{
	//历史订单
	public List<Orders> findHistoryOrdersByUserid(int userid);
	
	//通过订单日期查询
	public List<Orders> findOrdersByUseridAndOrdertime1(int userid,Date startordertime,Date endordertime,int pageIndex,int pageSize);
	
	//通过订单日期和乘车人名字查询
	public List<Orders> findHistoryOrdersByUseridAndOrdertimeAndName1(int userid,Date startordertime,Date endordertime,String name,int pageIndex,int pageSize);
	
	//通过乘车日期查询
	public List<Orders> findHistoryOrdersByUseridAndStarttime1(int userid,Date starttime,Date endtime,int pageIndex,int pageSize);
	
	//通过乘车日期和乘车人名字查询
	public List<Orders> findHistoryOrdersByUseridAndStarttimeAndName1(int userid,Date starttime,Date endtime,String name,int pageIndex,int pageSize);
	
		
	//通过订单日期查询
	public List<Orders> findOrdersByUseridAndOrdertime(int userid,Date startordertime,Date endordertime);
	
	//通过订单日期和乘车人名字查询
	public List<Orders> findHistoryOrdersByUseridAndOrdertimeAndName(int userid,Date startordertime,Date endordertime,String name);
	
	//通过乘车日期查询
	public List<Orders> findHistoryOrdersByUseridAndStarttime(int userid,Date starttime,Date endtime);
	
	//通过乘车日期和乘车人名字查询
	public List<Orders> findHistoryOrdersByUseridAndStarttimeAndName(int userid,Date starttime,Date endtime,String name);

	public boolean updateOrder(Orders o);
}	
