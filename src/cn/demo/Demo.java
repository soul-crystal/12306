package cn.demo;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;

import cn.dao.OrdersDao;
import cn.dao.impl.OrdersDaoImpl;

public class Demo
{
	@Test
	public void Test01()
	{
		String da="2018-06-04";
		String da1="2018-05-01";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date=null;
		java.util.Date date1=null;
		java.sql.Date sd =null ;
		java.sql.Date sd1 =null ;
		try
		{
			date = dateFormat.parse(da);
			date1 = dateFormat.parse(da1);
			sd= new java.sql.Date(date.getTime());
			sd1= new java.sql.Date(date1.getTime());
		} catch (ParseException e)
		{
			e.printStackTrace();
		}
		OrdersDao o=new OrdersDaoImpl();
		System.out.println(o.findHistoryOrdersByUserid(1));
		System.out.println(o.findHistoryOrdersByUseridAndOrdertimeAndName(1, sd1,sd, "root"));
		System.out.println(o.findHistoryOrdersByUseridAndOrdertimeAndName1(1, sd1, sd, "root", 1, 2));
		System.out.println(o.findHistoryOrdersByUseridAndStarttime(1, sd1,sd));
		System.out.println(o.findHistoryOrdersByUseridAndStarttime1(1, sd1, sd, 1, 2));
		System.out.println(o.findHistoryOrdersByUseridAndStarttimeAndName(1, sd1, sd, "root"));
		System.out.println(o.findHistoryOrdersByUseridAndStarttimeAndName1(1, sd1, sd, "root", 1, 2));
		System.out.println(o.findOrdersByUseridAndOrdertime(1, sd1, sd));
		System.out.println(o.findOrdersByUseridAndOrdertime1(1, sd1, sd, 1, 2));
	}
	
	@Test
	public void test02()
	{
		String da="2018-06-04";
		String da1="2018-05-01";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date=null;
		java.util.Date date1=null;
		java.sql.Date sd =null ;
		java.sql.Date sd1 =null ;
		try
		{
			date = dateFormat.parse(da);
			date1 = dateFormat.parse(da1);
			sd= new java.sql.Date(date.getTime());
			sd1= new java.sql.Date(date1.getTime());
		} catch (ParseException e)
		{
			e.printStackTrace();
		}
		OrdersDao o=new OrdersDaoImpl();
		System.out.println(o.findOrdersByUseridAndOrdertime1(1, sd1, sd, 1, 2));
	}
}
