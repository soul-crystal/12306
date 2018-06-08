package cn.util;

public class Contract
{
	private String name;
	private String idcard;
	private String phone;
	private int idtypeid;
	private int touristid;
	
	public Contract()
	{
		super();
	}
	public Contract(String name, String idcard, String phone)
	{
		super();
		this.name = name;
		this.idcard = idcard;
		this.phone = phone;
	}
	
	public Contract(String name, String idcard, String phone, int idtypeid, int touristid)
	{
		super();
		this.name = name;
		this.idcard = idcard;
		this.phone = phone;
		this.idtypeid = idtypeid;
		this.touristid = touristid;
	}
	public int getIdtypeid()
	{
		return idtypeid;
	}
	public void setIdtypeid(int idtypeid)
	{
		this.idtypeid = idtypeid;
	}
	public int getTouristid()
	{
		return touristid;
	}
	public void setTouristid(int touristid)
	{
		this.touristid = touristid;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getIdcard()
	{
		return idcard;
	}
	public void setIdcard(String idcard)
	{
		this.idcard = idcard;
	}
	public String getPhone()
	{
		return phone;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	
}
