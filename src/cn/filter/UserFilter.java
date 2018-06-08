package cn.filter;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(
		dispatcherTypes = {
				DispatcherType.REQUEST, 
				DispatcherType.FORWARD, 
				DispatcherType.INCLUDE
		}
					, 
		urlPatterns = { 
				"/AccountSecurity.jsp", 
				"/AddCommonContact.jsp", 
				"/ChangeUserPassword.jsp", 
				"/CommonContact.jsp", 
				"/My12306.jsp", 
				"/OrderInformation.jsp", 
				"/OrdersResult.jsp", 
				"/book.do", 
				"/ViewPersonalInformation.do", 
				"/OrdersInformation.do", 
				"/CommonContact.do", 
				"/My12306.do", 
				"/AddContact.do", 
				"/viewPersonalInformation.do", 
				"/ordersInformation.do", 
				"/commonContact.do", 
				"/my12306.do", 
				"/addContact.do", 
				"/selectorder.do", 
				"/Selectorder.do", 
				"/ViewPersonalInformation.jsp"
		})
public class UserFilter implements Filter
{

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
	{
		HttpServletRequest req=(HttpServletRequest) request;
		if(req.getSession().getAttribute("user")!=null)
		{
			chain.doFilter(request, response);
		}
		else
		{
			req.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException{}
}
