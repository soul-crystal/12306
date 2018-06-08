package cn.bean;

public class TicketNum
{
	private int id;
	private int seattypeid;
	private int ticketnum;
	private int trainnumid;
	public TicketNum()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public TicketNum(int seattypeid, int ticketnum, int trainnumid)
	{
		super();
		this.seattypeid = seattypeid;
		this.ticketnum = ticketnum;
		this.trainnumid = trainnumid;
	}
	public TicketNum(int id, int seattypeid, int ticketnum, int trainnumid)
	{
		super();
		this.id = id;
		this.seattypeid = seattypeid;
		this.ticketnum = ticketnum;
		this.trainnumid = trainnumid;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getSeattypeid()
	{
		return seattypeid;
	}
	public void setSeattypeid(int seattypeid)
	{
		this.seattypeid = seattypeid;
	}
	public int getTicketnum()
	{
		return ticketnum;
	}
	public void setTicketnum(int ticketnum)
	{
		this.ticketnum = ticketnum;
	}
	public int getTrainnumid()
	{
		return trainnumid;
	}
	public void setTrainnumid(int trainnumid)
	{
		this.trainnumid = trainnumid;
	}
}
