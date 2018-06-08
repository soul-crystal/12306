package cn.action;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.bean.Contact;
import cn.dao.ContactDao;
import cn.dao.UserDao;
import cn.dao.impl.ContactDaoImpl;
import cn.dao.impl.UserDaoImpl;
import cn.framework.Action;

public class AddContactAction implements Action {

	public String execute(HttpServletRequest request,HttpServletResponse response) 
	{
		String username=request.getParameter("username");
		UserDao ud=new UserDaoImpl();
		int userid=ud.findUserByUsername(username).getId();
		
		String rname=request.getParameter("rname");
		String idtype=request.getParameter("idtype");
		int idtypeid=Integer.valueOf(idtype);
		String cardnum=request.getParameter("cardnum");
		String sex=request.getParameter("sex");
		if(idtypeid==1) 
		{
			int num=Integer.valueOf(cardnum.substring(16, 17));
			if(num%2==1) 
			{
				sex="男";
			}
			else 
			{
				sex="女";
			}
		}
		String birth=request.getParameter("birth");
		if(birth.equals("")) 
		{
			birth=cardnum.substring(6, 10)+"-"+cardnum.substring(10, 12)+"-"+cardnum.substring(12, 14);
		}
		Date datebirth=java.sql.Date.valueOf(birth.trim());
		String country=request.getParameter("country");
		int countryid=Integer.valueOf(country).intValue();
		String mail=request.getParameter("mail");
		if(mail.equals("请正确填写邮箱地址"))
		{
			mail="";
		}
		String phone=request.getParameter("phone");
		String touristtype=request.getParameter("touristtype");
		int touristtypeid=1;
		if(touristtype.equals("儿童")) 
		{
			touristtypeid=2;
		}
		else if(touristtype.equals("学生")) 
		{
			touristtypeid=3;
		}
		else if(touristtype.equals("残疾军人,伤残人民警察")) 
		{
			touristtypeid=4;
		}
		String province=request.getParameter("province");
		int provinceid=Integer.valueOf(province).intValue();
		String school=request.getParameter("school");
		int schoolid=Integer.valueOf(school).intValue();
		String academy=request.getParameter("academy");
		String classes=request.getParameter("classes");
		String studentnum=request.getParameter("studentnum");
		String schoollength=request.getParameter("schoollength");
		int schoollen=Integer.valueOf(schoollength).intValue();
		String enterschoolyear=request.getParameter("enterschoolyear");
		String discountnum=request.getParameter("discountnum");
		String startcity=request.getParameter("startcity");
		int startcityid=Integer.valueOf(startcity).intValue();
		String endcity=request.getParameter("endcity");
		int endcityid=Integer.valueOf(endcity).intValue();
		ContactDao cd=new ContactDaoImpl();
		Contact c=new Contact(rname, idtypeid, cardnum, sex, countryid, datebirth, mail, phone, touristtypeid, provinceid, schoolid, academy, classes, studentnum, schoollen, enterschoolyear, discountnum, startcityid, endcityid, userid, 0);
		boolean b=false;
		if(touristtypeid==3) 
		{
			b=cd.addContact(c);
		}
		else 
		{
			b=cd.addContactNotStudent(c);
		}
		if(b)
		{
			return "CommonContact.do";
		}
		return "AddCommonContact.do";
	}

}
