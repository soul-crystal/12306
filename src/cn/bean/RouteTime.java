package cn.bean;

import java.util.Date;


public class RouteTime
{
	private int id;
	private int routeid;
	private Date arrivetime;
	private Date leavetime;
	private int trainnumid;
	public RouteTime()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public RouteTime(int routeid, Date arrivetime, Date leavetime,
			int trainnumid)
	{
		super();
		this.routeid = routeid;
		this.arrivetime = arrivetime;
		this.leavetime = leavetime;
		this.trainnumid = trainnumid;
	}
	public RouteTime(int id, int routeid, Date arrivetime, Date leavetime,
			int trainnumid)
	{
		super();
		this.id = id;
		this.routeid = routeid;
		this.arrivetime = arrivetime;
		this.leavetime = leavetime;
		this.trainnumid = trainnumid;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getRouteid()
	{
		return routeid;
	}
	public void setRouteid(int routeid)
	{
		this.routeid = routeid;
	}
	public Date getArrivetime()
	{
		return arrivetime;
	}
	public void setArrivetime(Date arrivetime)
	{
		this.arrivetime = arrivetime;
	}
	public Date getLeavetime()
	{
		return leavetime;
	}
	public void setLeavetime(Date leavetime)
	{
		this.leavetime = leavetime;
	}
	public int getTrainnumid()
	{
		return trainnumid;
	}
	public void setTrainnumid(int trainnumid)
	{
		this.trainnumid = trainnumid;
	}
}
