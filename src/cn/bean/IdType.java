package cn.bean;

public class IdType
{
	private int id;
	private String name;
	public IdType()
	{
		super();
	}
	public IdType(String name)
	{
		super();
		this.name = name;
	}
	public IdType(int id, String name)
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
