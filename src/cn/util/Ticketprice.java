package cn.util;

import java.util.Map;

public class Ticketprice
{
	private String startstation;
	private String endstation;
	private Map<String, Double> price;
	public String getStartstation()
	{
		return startstation;
	}
	public void setStartstation(String startstation)
	{
		this.startstation = startstation;
	}
	public String getEndstation()
	{
		return endstation;
	}
	public void setEndstation(String endstation)
	{
		this.endstation = endstation;
	}
	public Map<String, Double> getPrice()
	{
		return price;
	}
	public void setPrice(Map<String, Double> price)
	{
		this.price = price;
	}
}
