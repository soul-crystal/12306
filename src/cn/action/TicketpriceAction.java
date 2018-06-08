package cn.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dao.TicketPriceDao;
import cn.dao.impl.TicketPriceDaoImpl;
import cn.framework.Action;
import cn.util.Ticketprice;

public class TicketpriceAction implements Action
{
	TicketPriceDao tpd=new TicketPriceDaoImpl();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		List<Ticketprice> ticketpriceList=tpd.findTicketPrice(start, end);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("ticketpriceList", ticketpriceList);
		return "/ticketprice.jsp";
	}

}
