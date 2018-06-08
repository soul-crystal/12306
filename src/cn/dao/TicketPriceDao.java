package cn.dao;

import java.util.List;
import cn.bean.TicketPrice;
import cn.util.Ticketprice;

public interface TicketPriceDao
{
	public List<TicketPrice> findPriceByStationId(int sid,int eid);

	public List<Ticketprice> findTicketPrice(String start, String end);

}
