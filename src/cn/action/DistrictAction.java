package cn.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.District;
import cn.dao.DistrictDao;
import cn.dao.impl.DistrictDaoImpl;
import cn.framework.Action;
import net.sf.json.JSONArray;

public class DistrictAction implements Action
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		int cid=Integer.valueOf(request.getParameter("cityid"));
		DistrictDao dd=new DistrictDaoImpl();
		List<District> ld=dd.findDistrictByCityid(cid);
		String json=JSONArray.fromObject(ld).toString();
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
