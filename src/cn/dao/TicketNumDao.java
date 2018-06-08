package cn.dao;

import java.util.List;

import cn.bean.TicketNum;

public interface TicketNumDao
{
	public List<TicketNum> findTicketNumByTrainnumid(int trainnumid);

}
