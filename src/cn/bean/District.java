package cn.bean;

public class District
{
	private int id;
	private String name;
	private int cityid;
	public District()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public District(String name, int cityid)
	{
		super();
		this.name = name;
		this.cityid = cityid;
	}
	public District(int id, String name, int cityid)
	{
		super();
		this.id = id;
		this.name = name;
		this.cityid = cityid;
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
	public int getCityid()
	{
		return cityid;
	}
	public void setCityid(int cityid)
	{
		this.cityid = cityid;
	}
	
}
