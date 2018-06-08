package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.Agency;
import cn.dao.AgencyDao;
import cn.dbc.BaseDao;

public class AgencyDaoImpl implements AgencyDao
{
	BaseDao bs=new BaseDao();
	@Override
	public List<Agency> findAgencyByDistrictId(int did)
	{
		List<Object> lo=new ArrayList<Object>();
		lo.add(did);
		List<Agency> la=bs.getQuery("select * from agency where districtid=?",lo, Agency.class);
		return la;
	}

}
