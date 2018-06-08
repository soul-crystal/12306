package cn.bean;

public class Train
{
	private int id;
	private String name;
	private int seatnumid;
	private int traintypeid;
	public Train() 
	{
		super();
	}
	public Train(String name, int seatnumid, int traintypeid)
	{
		super();
		this.name = name;
		this.seatnumid = seatnumid;
		this.traintypeid = traintypeid;
	}
	public Train(int id, String name, int seatnumid, int traintypeid) 
	{
		super();
		this.id = id;
		this.name = name;
		this.seatnumid = seatnumid;
		this.traintypeid = traintypeid;
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
	public int getSeatnumid()
	{
		return seatnumid;
	}
	public void setSeatnumid(int seatnumid) 
	{
		this.seatnumid = seatnumid;
	}
	public int getTraintypeid() 
	{
		return traintypeid;
	}
	public void setTraintypeid(int traintypeid)
	{
		this.traintypeid = traintypeid;
	}
}
