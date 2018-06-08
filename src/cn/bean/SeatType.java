package cn.bean;

public class SeatType
{
	private int id;
	private String name;
	public SeatType()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public SeatType(String name)
	{
		super();
		this.name = name;
	}
	public SeatType(int id, String name)
	{
		super();
		this.id = id;
		this.name = name;
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
}
