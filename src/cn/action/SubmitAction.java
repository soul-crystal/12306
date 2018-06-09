package cn.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.Orders;
import cn.bean.User;
import cn.dao.IdTypeDao;
import cn.dao.OrdersDao;
import cn.dao.SeatTypeDao;
import cn.dao.TouristTypeDao;
import cn.dao.TrainDao;
import cn.dao.TrainNumDao;
import cn.dao.impl.IdTypeDaoImpl;
import cn.dao.impl.OrdersDaoImpl;
import cn.dao.impl.SeatTypeDaoImpl;
import cn.dao.impl.TouristTypeDaoImpl;
import cn.dao.impl.TrainDaoImpl;
import cn.dao.impl.TrainNumDaoImpl;
import cn.dbc.BaseDao;
import cn.framework.Action;
import cn.util.Trainnum;

public class SubmitAction implements Action
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		BaseDao bs=new BaseDao();
		IdTypeDao itd=new IdTypeDaoImpl();
		TouristTypeDao ttd=new TouristTypeDaoImpl();
		for(int i=0;i<10;i++)
		{
			String seattype=request.getParameter("seattype"+i);
			String touristtype=request.getParameter("touristtype"+i);
			String name=request.getParameter("name"+i);
			String idtype=request.getParameter("idtype"+i);
			String price=request.getParameter(seattype);
			String trainname=request.getParameter("trainname");
			String startstation=request.getParameter("startstation");
			String endstation=request.getParameter("endstation");
			String date1=request.getParameter("date");
			if(name==null)
				break;
			User u=(User) request.getSession().getAttribute("user");
			//取得内容
			SeatTypeDao std=new SeatTypeDaoImpl();
			int sid=std.findSeatTypeByName(seattype).getId();//获得座位id
			TrainDao td=new TrainDaoImpl();
			int tid=td.findTrainByName(trainname).getId();//获得trainnumid
			double pric=Double.parseDouble(price);
			Date date=new Date();
			try
			{
				date = DateFormat.getDateInstance().parse(date1);
			} catch (Exception e)
			{
				
				e.printStackTrace();
			}//拿到乘坐时间
			
			
			TrainNumDao tnd=new TrainNumDaoImpl();
			List<Trainnum> lt=tnd.findTrainnum(startstation, endstation, date);
			Trainnum tn=new Trainnum();
			for(Trainnum tr:lt)
			{
				if(tr.getName().equals(trainname))
					{
					tn=tr;
					break;}
			}
			 Timestamp ts = new Timestamp(System.currentTimeMillis()); 
			 Timestamp st = new Timestamp(tn.getStarttime().getTime());
			 Timestamp et = new Timestamp(tn.getEndtime().getTime());
			 idtype=itd.findIdTypeById(Integer.valueOf(idtype)).getName();
			 touristtype=ttd.findTouristTypeById(Integer.valueOf(touristtype)).getName();
			Orders order=new Orders(ts, name, idtype, touristtype, trainname,tn.getStartstation(),tn.getEndstation(), seattype, pric,st,et,u.getId());
			OrdersDao od=new OrdersDaoImpl();
			boolean isflag=false;
			isflag=od.updateOrder(order);//订单提交
				if(isflag)
				{
					List<Object> lo=new ArrayList<Object>();
					lo.add(sid);
					lo.add(tid);
					bs.getUpdate("update ticketnum set ticketnum=ticketnum-1 where seattypeid=? and trainnumid=?",lo);
				}
				
					
		}
		return "OrderInformation.jsp";
	}

}
