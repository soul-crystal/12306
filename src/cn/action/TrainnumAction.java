package cn.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dao.TrainNumDao;
import cn.dao.impl.TrainNumDaoImpl;
import cn.framework.Action;
import cn.util.Trainnum;

public class TrainnumAction implements Action
{
	TrainNumDao tnd=new TrainNumDaoImpl();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		String startdate=request.getParameter("startdate");
		Date date=null;
		try
		{
			date = DateFormat.getDateInstance().parse(startdate);
		} 
		catch (ParseException e)
		{
			throw new RuntimeException(e);
		}
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		List<Trainnum> trainnumList=tnd.findTrainnum(start,end,date);
		request.setAttribute("trainnumList", trainnumList);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("startdate", startdate);
		request.setAttribute("date", date);
		
		return "/trainnum.jsp";
	}

}
