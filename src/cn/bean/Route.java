package cn.bean;

public class Route
{
	private int id;
	private int routenameid;
	private int stationid;
	private int stationposition;
	public Route()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public Route(int routenameid, int stationid, int stationposition)
	{
		super();
		this.routenameid = routenameid;
		this.stationid = stationid;
		this.stationposition = stationposition;
	}
	public Route(int id, int routenameid, int stationid, int stationposition)
	{
		super();
		this.id = id;
		this.routenameid = routenameid;
		this.stationid = stationid;
		this.stationposition = stationposition;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getRoutenameid()
	{
		return routenameid;
	}
	public void setRoutenameid(int routenameid)
	{
		this.routenameid = routenameid;
	}
	public int getStationid()
	{
		return stationid;
	}
	public void setStationid(int stationid)
	{
		this.stationid = stationid;
	}
	public int getStationposition()
	{
		return stationposition;
	}
	public void setStationposition(int stationposition)
	{
		this.stationposition = stationposition;
	}
}
