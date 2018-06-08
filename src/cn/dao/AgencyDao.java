package cn.dao;

import java.util.List;

import cn.bean.Agency;

public interface AgencyDao
{
	public List<Agency> findAgencyByDistrictId(int did);
}
