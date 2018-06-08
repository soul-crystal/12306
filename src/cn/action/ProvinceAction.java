package cn.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.Province;
import cn.dao.ProvinceDao;
import cn.dao.impl.ProvinceDaoImpl;
import cn.framework.Action;
import net.sf.json.JSONArray;

public class ProvinceAction implements Action
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		ProvinceDao pd=new ProvinceDaoImpl();
		List<Province> lp= pd.findAllProvince();
		String json=JSONArray.fromObject(lp).toString();
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
