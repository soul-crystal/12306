package cn.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.City;
import cn.dbc.BaseDao;
import cn.framework.Action;
import net.sf.json.JSONArray;

public class CityAction implements Action
{
	BaseDao bs=new BaseDao();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		int pid=Integer.valueOf(request.getParameter("province"));
		List<Object> lo=new ArrayList<Object>();
		lo.add(pid);
		List<City> lc=bs.getQuery("select * from city where provinceid=?", lo, City.class);
		String json=JSONArray.fromObject(lc).toString();
		try
		{
			response.getWriter().print(json);
		} catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
