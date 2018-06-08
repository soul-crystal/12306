package cn.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.School;
import cn.dao.SchoolDao;
import cn.dao.impl.SchoolDaoImpl;
import cn.framework.Action;

public class SelectSchoolByPidAction implements Action
{
	SchoolDao sc=new SchoolDaoImpl();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		String provinceid=request.getParameter("provinceid");
		int pid=Integer.parseInt(provinceid);
		List<School> lschool=sc.findSchoolByProvinceId(pid);
		PrintWriter out=null;
		try
		{
			out = response.getWriter();
		} 
		catch (IOException e)
		{
			e.printStackTrace();
		}
        StringBuffer sb=new StringBuffer();
        sb.append("[");
        for (School s:lschool) 
        {
            sb.append("{'schoolid':"+s.getId()+",'schoolname':'"+s.getName()+"'},");
        }
        sb.append("]");
        out.write(sb.toString());
        out.flush();
        out.close();
		return null;
	}
}
