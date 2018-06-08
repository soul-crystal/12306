package cn.bean;

import java.sql.Timestamp;

public class Orders
{
	private int id;
	private Timestamp ordertime;
	private String name;
	private String idtype;
	private String touristtype;
	private String trainname;
	private String startstation;
	private String endstation;
	private String seattype;
	private double price;
	private Timestamp starttime;
	private Timestamp endtime;
	private int userid;
	public Orders()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders( Timestamp ordertime, String name, String idtype,
			String touristtype, String trainname, String startstation,
			String endstation, String seattype, double price,
			Timestamp starttime, Timestamp endtime, int userid)
	{
		super();
		
		this.ordertime = ordertime;
		this.name = name;
		this.idtype = idtype;
		this.touristtype = touristtype;
		this.trainname = trainname;
		this.startstation = startstation;
		this.endstation = endstation;
		this.seattype = seattype;
		this.price = price;
		this.starttime = starttime;
		this.endtime = endtime;
		this.userid = userid;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public Timestamp getOrdertime()
	{
		return ordertime;
	}
	public void setOrdertime(Timestamp ordertime)
	{
		this.ordertime = ordertime;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getIdtype()
	{
		return idtype;
	}
	public void setIdtype(String idtype)
	{
		this.idtype = idtype;
	}
	public String getTouristtype()
	{
		return touristtype;
	}
	public void setTouristtype(String touristtype)
	{
		this.touristtype = touristtype;
	}
	public String getTrainname()
	{
		return trainname;
	}
	public void setTrainname(String trainname)
	{
		this.trainname = trainname;
	}
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
	public String getSeattype()
	{
		return seattype;
	}
	public void setSeattype(String seattype)
	{
		this.seattype = seattype;
	}
	public double getPrice()
	{
		return price;
	}
	public void setPrice(double price)
	{
		this.price = price;
	}
	public Timestamp getStarttime()
	{
		return starttime;
	}
	public void setStarttime(Timestamp starttime)
	{
		this.starttime = starttime;
	}
	public Timestamp getEndtime()
	{
		return endtime;
	}
	public void setEndtime(Timestamp endtime)
	{
		this.endtime = endtime;
	}
	public int getUserid()
	{
		return userid;
	}
	public void setUserid(int userid)
	{
		this.userid = userid;
	}
	
}
