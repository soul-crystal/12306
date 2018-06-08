package cn.bean;

public class School
{
	private int id;
	private String name;
	private int provinceid;
	public School()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public School(String name, int provinceid)
	{
		super();
		this.name = name;
		this.provinceid = provinceid;
	}
	public School(int id, String name, int provinceid)
	{
		super();
		this.id = id;
		this.name = name;
		this.provinceid = provinceid;
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
	public int getProvinceid()
	{
		return provinceid;
	}
	public void setProvinceid(int provinceid)
	{
		this.provinceid = provinceid;
	}
}
