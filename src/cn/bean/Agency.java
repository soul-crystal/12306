package cn.bean;

import java.util.Date;

public class Agency
{
	private int id;
	private String name;
	private int districtid;
	private String address;
	private Date starttime;
	private Date endtime;
	private int windownum;
	public Agency()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public Agency(String name, int districtid, String address, Date starttime,
			Date endtime, int windownum)
	{
		super();
		this.name = name;
		this.districtid = districtid;
		this.address = address;
		this.starttime = starttime;
		this.endtime = endtime;
		this.windownum = windownum;
	}
	public Agency(int id, String name, int districtid, String address,
			Date starttime, Date endtime, int windownum)
	{
		super();
		this.id = id;
		this.name = name;
		this.districtid = districtid;
		this.address = address;
		this.starttime = starttime;
		this.endtime = endtime;
		this.windownum = windownum;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getDistrictid()
	{
		return districtid;
	}
	public void setDistrictid(int districtid)
	{
		this.districtid = districtid;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public Date getStarttime()
	{
		return starttime;
	}
	public void setStarttime(Date starttime)
	{
		this.starttime = starttime;
	}
	public Date getEndtime()
	{
		return endtime;
	}
	public void setEndtime(Date endtime)
	{
		this.endtime = endtime;
	}
	public int getWindownum()
	{
		return windownum;
	}
	public void setWindownum(int windownum)
	{
		this.windownum = windownum;
	}
}
