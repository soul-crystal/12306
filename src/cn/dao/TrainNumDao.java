package cn.dao;

import java.util.Date;
import java.util.List;

import cn.bean.TrainNum;
import cn.util.Stops;
import cn.util.Trainnum;

public interface TrainNumDao
{
	public List<Trainnum> findTrainnum(String start, String end, Date date);

	public List<Stops> findStops(int trainnumid);
	
	public TrainNum fingTrainNum(int trainnumid);
}
