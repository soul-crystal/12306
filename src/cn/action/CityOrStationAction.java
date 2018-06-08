package cn.action;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dao.CityDao;
import cn.dao.StationDao;
import cn.dao.impl.CityDaoImpl;
import cn.dao.impl.StationDaoImpl;
import cn.framework.Action;
import net.sf.json.JSONArray;

public class CityOrStationAction implements Action
{
	CityDao cd=new CityDaoImpl();
	StationDao sd=new StationDaoImpl();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		String msg=request.getParameter("msg");
		Set<String> set=cd.findCity(msg);
		set.addAll(sd.findStation(msg));
		String json=JSONArray.fromObject(set).toString();
		try
		{
			response.getWriter().print(json);
		}
		catch (Exception e)
		{
			throw new RuntimeException(e);
		}
		
		return null;
	}

}