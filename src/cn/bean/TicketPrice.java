package cn.bean;

public class TicketPrice
{
	private int id;
	private int startstationid;
	private int endstationid;
	private int seattypeid;
	private double price;
	public TicketPrice()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public TicketPrice(int startstationid, int endstationid, int seattypeid,
			double price)
	{
		super();
		this.startstationid = startstationid;
		this.endstationid = endstationid;
		this.seattypeid = seattypeid;
		this.price = price;
	}
	public TicketPrice(int id, int startstationid, int endstationid,
			int seattypeid, double price)
	{
		super();
		this.id = id;
		this.startstationid = startstationid;
		this.endstationid = endstationid;
		this.seattypeid = seattypeid;
		this.price = price;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getStartstationid()
	{
		return startstationid;
	}
	public void setStartstationid(int startstationid)
	{
		this.startstationid = startstationid;
	}
	public int getEndstationid()
	{
		return endstationid;
	}
	public void setEndstationid(int endstationid)
	{
		this.endstationid = endstationid;
	}
	public int getSeattypeid()
	{
		return seattypeid;
	}
	public void setSeattypeid(int seattypeid)
	{
		this.seattypeid = seattypeid;
	}
	public double getPrice()
	{
		return price;
	}
	public void setPrice(double price)
	{
		this.price = price;
	}
}
