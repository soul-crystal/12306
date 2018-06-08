package cn.dao;

import cn.bean.Train;

public interface TrainDao
{
	public Train findTrainById(int id);

	public Train findTrainByName(String name);
}
