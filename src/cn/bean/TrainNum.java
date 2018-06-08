package cn.bean;

import java.util.Date;

public class TrainNum
{
	private int id;
	private int trainid;
	private int routenameid;
	private Date date;
	public TrainNum()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public TrainNum(int trainid, int routenameid, Date datetime)
	{
		super();
		this.trainid = trainid;
		this.routenameid = routenameid;
		this.date = datetime;
	}
	public TrainNum(int id, int trainid, int routenameid, Date datetime)
	{
		super();
		this.id = id;
		this.trainid = trainid;
		this.routenameid = routenameid;
		this.date = datetime;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getTrainid()
	{
		return trainid;
	}
	public void setTrainid(int trainid)
	{
		this.trainid = trainid;
	}
	public int getRoutenameid()
	{
		return routenameid;
	}
	public void setRoutenameid(int routenameid)
	{
		this.routenameid = routenameid;
	}
	public Date getDatetime()
	{
		return date;
	}
	public void setDatetime(Date datetime)
	{
		this.date = datetime;
	}
}
