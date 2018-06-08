package cn.util;

import java.util.Date;

public class reserve_station
{
	private Date date;
	private String trian;
	private String startstation;
	private String endstation;
	private String starttime;
	private String arrivetime;
	
	public reserve_station()
	{
		super();
	}
	public reserve_station(Date date, String trian, String startstaton, String endstation)
	{
		super();
		this.date = date;
		this.trian = trian;
		this.startstation = startstaton;
		this.endstation = endstation;
		
	}
	public Date getDate()
	{
		return date;
	}
	public void setDate(Date date)
	{
		this.date = date;
	}
	public String getTrian()
	{
		return trian;
	}
	public void setTrian(String trian)
	{
		this.trian = trian;
	}
	public String getStartstaton()
	{
		return startstation;
	}
	public void setStartstaton(String startstaton)
	{
		this.startstation = startstaton;
	}
	public String getEndstation()
	{
		return endstation;
	}
	public void setEndstation(String endstation)
	{
		this.endstation = endstation;
	}
	public String getStarttime()
	{
		return starttime;
	}
	public void setStarttime(String starttime)
	{
		this.starttime = starttime;
	}
	public String getArrivetime()
	{
		return arrivetime;
	}
	public void setArrivetime(String arrivetime)
	{
		this.arrivetime = arrivetime;
	}
	
}
