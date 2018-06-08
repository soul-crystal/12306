package cn.action;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.Agency;
import cn.bean.District;
import cn.dao.AgencyDao;
import cn.dao.DistrictDao;
import cn.dao.impl.AgencyDaoImpl;
import cn.dao.impl.DistrictDaoImpl;
import cn.framework.Action;

public class SearchAgencyAction implements Action
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		int district=Integer.valueOf(request.getParameter("district"));
		AgencyDao ad=new AgencyDaoImpl();
		DistrictDao dd=new DistrictDaoImpl();
		District dname=dd.findDistrictIdByid(district);
		List<Agency> la=new ArrayList<Agency>();
		la=ad.findAgencyByDistrictId(district);
		if(la.size()>0)
		{
		request.setAttribute("district", dname.getName());
		request.setAttribute("num", la.size());
		request.setAttribute("list",la);
		}
		else{
			request.setAttribute("district", dname.getName());
			request.setAttribute("num", 0);
			return "agency.jsp";
		}
		
		return "agency.jsp";
		
	}

}
