package cn.dao.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.bean.City;
import cn.bean.Route;
import cn.bean.RouteTime;
import cn.bean.Station;
import cn.bean.TicketNum;
import cn.bean.TrainNum;
import cn.dao.CityDao;
import cn.dao.RouteDao;
import cn.dao.RouteTimeDao;
import cn.dao.SeatTypeDao;
import cn.dao.StationDao;
import cn.dao.TicketNumDao;
import cn.dao.TrainDao;
import cn.dao.TrainNumDao;
import cn.dao.TrainTypeDao;
import cn.dbc.BaseDao;
import cn.util.Stops;
import cn.util.Trainnum;

public class TrainNumDaoImpl implements TrainNumDao
{
	BaseDao bd = new BaseDao();
	StationDao sd = new StationDaoImpl();
	RouteDao rd = new RouteDaoImpl();
	TrainDao td = new TrainDaoImpl();
	RouteTimeDao rtd = new RouteTimeDaoImpl();
	TrainTypeDao ttd = new TrainTypeDaoImpl();
	TicketNumDao tnd = new TicketNumDaoImpl();
	SeatTypeDao std = new SeatTypeDaoImpl();
	CityDao cd = new CityDaoImpl();

	@Override
	public List<Trainnum> findTrainnum(String start, String end, Date date)
	{
		List<Trainnum> list = new ArrayList<Trainnum>();
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
		
		String sql = "select * from trainnum where Date=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(new java.sql.Date(date.getTime()));
		List<TrainNum> trainNumList = bd.getQuery(sql, listsql, TrainNum.class);

		for (TrainNum t : trainNumList)
		{
			int routenameid = t.getRoutenameid();
			List<Route> routeList = rd.findRouteByRoutenameid(routenameid);
			Route startRoute = null, endRoute = null;
			for (Route r : routeList)
			{
				if (sd.findStationById(r.getStationid()).getCityid() == startCity.getId())
					startRoute = r;
				if (sd.findStationById(r.getStationid()).getCityid() == endCity.getId())
					endRoute = r;
			}
			if (startRoute != null && endRoute != null
					&& endRoute.getStationposition() > startRoute.getStationposition())
			{
				Trainnum trainnum = new Trainnum();
				trainnum.setId(t.getId());
				trainnum.setName(td.findTrainById(t.getTrainid()).getName());
				trainnum.setStartstation(sd.findStationById(startRoute.getStationid()).getName());
				trainnum.setEndstation(sd.findStationById(endRoute.getStationid()).getName());
				List<RouteTime> routetimeList = rtd.findRouteTimeByTrainnumid(t.getId());
				for (RouteTime rt : routetimeList)
				{
					if (rt.getRouteid() == startRoute.getId())
						trainnum.setStarttime(rt.getLeavetime());
					if (rt.getRouteid() == endRoute.getId())
						trainnum.setEndtime(rt.getArrivetime());
				}
				trainnum.setType(ttd.findTrainTypeById(td.findTrainById(t.getTrainid()).getTraintypeid()).getName());
				Map<String, Integer> ticketnum = new HashMap<String, Integer>();
				List<TicketNum> ticketnumList = tnd.findTicketNumByTrainnumid(t.getId());
				for (TicketNum tn : ticketnumList)
				{
					ticketnum.put(std.findSeatTypeById(tn.getSeattypeid()).getName(), tn.getTicketnum());
				}
				trainnum.setTicketnum(ticketnum);
				list.add(trainnum);
			}
		}
		return list;
	}

	@Override
	public List<Stops> findStops(int trainnumid)
	{
		List<Stops> list = new ArrayList<Stops>();

		String sql = "select * from routetime where trainnumid=?";
		List<Object> listsql = new ArrayList<Object>();
		listsql.add(trainnumid);
		List<RouteTime> routeTimeList = bd.getQuery(sql, listsql, RouteTime.class);

		for (RouteTime r : routeTimeList)
		{
			Stops stops = new Stops();
			Route route = rd.findRouteById(r.getRouteid());
			stops.setPosition(route.getStationposition());
			stops.setStation(sd.findStationById(route.getStationid()).getName());
			DateFormat dateFormat = new SimpleDateFormat("HH:mm");
			if(r.getArrivetime() != null)
			{
				stops.setArrivetime(dateFormat.format(r.getArrivetime()));
			}
			if(r.getLeavetime()!= null)
			{
				stops.setLeavetime(dateFormat.format(r.getLeavetime()));
			}
			if(r.getArrivetime() != null && r.getLeavetime()!= null)
			{
				long time = r.getLeavetime().getTime() - r.getArrivetime().getTime();
				int min = (int) (time / (60 * 1000));
				stops.setStaytime(min + "分钟");
			}
			list.add(stops);
		}

		return list;
	}
	
	@Override
	public TrainNum fingTrainNum(int trainnumid)
	{
		List<Object> lo=new ArrayList<Object>();
		String sql="select * from trainnum where id=?";
		lo.add(trainnumid);
		List<TrainNum> lt=bd.getQuery(sql, lo, TrainNum.class);
		return lt.size()>0?lt.get(0):null;
	}
}