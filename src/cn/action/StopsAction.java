package cn.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dao.TrainNumDao;
import cn.dao.impl.TrainNumDaoImpl;
import cn.framework.Action;
import cn.util.Stops;
import net.sf.json.JSONArray;

public class StopsAction implements Action
{
	TrainNumDao tnd=new TrainNumDaoImpl();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		int trainnumid= Integer.parseInt(request.getParameter("trainnumid"));
		List<Stops> stopsList = tnd.findStops(trainnumid);
		String json=JSONArray.fromObject(stopsList).toString();
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