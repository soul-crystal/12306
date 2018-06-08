package cn.dao;

import cn.bean.SeatType;

public interface SeatTypeDao
{
	public SeatType findSeatTypeById(int id);

	public SeatType findSeatTypeByName(String name);
}
