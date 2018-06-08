package cn.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.bean.City;
import cn.bean.Station;
import cn.bean.TicketPrice;
import cn.dao.CityDao;
import cn.dao.SeatTypeDao;
import cn.dao.StationDao;
import cn.dao.TicketPriceDao;
import cn.dbc.BaseDao;
import cn.util.Ticketprice;

public class TicketPriceDaoImpl implements TicketPriceDao
{
	BaseDao bs=new BaseDao();
	StationDao sd = new StationDaoImpl();
	CityDao cd = new CityDaoImpl();
	SeatTypeDao std = new SeatTypeDaoImpl();
	@Override
	public List<TicketPrice> findPriceByStationId(int sid, int eid)
	{
		List<Object> lo=new ArrayList<Object>();
		lo.add(sid);
		lo.add(eid);
		List<TicketPrice> lt=bs.getQuery("select * from ticketprice where startstationid=? and endstationid=?",lo, TicketPrice.class);
		return lt;
	}
	
	@Override
	public List<Ticketprice> findTicketPrice(String start, String end)
	{
		List<Ticketprice> list = new ArrayList<Ticketprice>();
		City startCity = cd.findCityByName(start);
		if (startCity == null)
		{
			Station startStation=sd.findStationByName(start);
			if(startStation!=null)
				startCity = cd.findCityById(startStation.getCityid());
			else return list;
		}
		City endCity = cd.findCityByName(end);
		if (endCity == null)
		{
			Station endStation=sd.findStationByName(end);
			if(endStation!=null)
				endCity = cd.findCityById(endStation.getCityid());
			else return list;
		}
		
		List<Station> startStationList=sd.findStationByCityid(startCity.getId());
		List<Station> endStationList=sd.findStationByCityid(endCity.getId());
		
		for(Station startStation:startStationList)
		{
			for(Station endStation:endStationList)
			{
				String sql = "select * from ticketprice where startstationid=? and endstationid=?";
				List<Object> listsql = new ArrayList<Object>();
				listsql.add(startStation.getId());
				listsql.add(endStation.getId());
				List<TicketPrice> ticketPriceList = bs.getQuery(sql, listsql, TicketPrice.class);
				if(!ticketPriceList.isEmpty())
				{
					Ticketprice ticketprice=new Ticketprice();
					ticketprice.setStartstation(startStation.getName());
					ticketprice.setEndstation(endStation.getName());
					Map<String, Double> price=new HashMap<String, Double>();
					for(TicketPrice ticketPrice:ticketPriceList)
					{
						price.put(std.findSeatTypeById(ticketPrice.getSeattypeid()).getName(), ticketPrice.getPrice());
					}
					ticketprice.setPrice(price);
					list.add(ticketprice);
				}
			}
		}
		return list;
	}

}
