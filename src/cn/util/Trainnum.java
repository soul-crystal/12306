package cn.util;

import java.util.Date;
import java.util.Map;

public class Trainnum
{
	private int id;
	private String name;
	private String startstation;
	private String endstation;
	private Date starttime;
	private Date endtime;
	private String type;
	private Map<String, Integer> ticketnum;

	public Trainnum()
	{
		super();
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

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public Map<String, Integer> getTicketnum()
	{
		return ticketnum;
	}

	public void setTicketnum(Map<String, Integer> ticketnum)
	{
		this.ticketnum = ticketnum;
	}

	public String getPasstime()
	{
		long time = endtime.getTime() - starttime.getTime();
		String hourString, minString;
		int hour = (int) (time / (60 * 60 * 1000));
		hourString = hour < 10 ? "0" + hour : "" + hour;
		int min = (int) (time / (60 * 1000) - hour * 60);
		minString = min < 10 ? "0" + min : "" + min;
		return hourString + ":" + minString;
	}

	public boolean isReserve()
	{
		boolean result = false;
		for (Integer num : ticketnum.values())
		{
			if (num > 0)
			{
				result = true;
				break;
			}
		}
		return result;
	}
}
