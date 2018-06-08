package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.Contact;
import cn.bean.TouristType;
import cn.dao.ContactDao;
import cn.dbc.BaseDao;

public class ContactDaoImpl implements ContactDao
{
	BaseDao bs=new BaseDao();

	public boolean addContact(Contact c)
	{
		String sql="insert into contact(name,idtypeid,idcardnum,sex,countryid,birth,email,phonenum,touristtypeid,provinceid,schoolid,academy,classes,studentnum,schoollength,enterschoolyear,discountnum,startcityid,endcityid,userid,ismaincontact) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> lo=new ArrayList<Object>();
		lo.add(c.getName());
		lo.add(c.getIdtypeid());
		lo.add(c.getIdcardnum());
		lo.add(c.getSex());
		lo.add(c.getCountryid());
		lo.add(c.getBirth());
		lo.add(c.getEmail());
		lo.add(c.getPhonenum());
		lo.add(c.getTouristtypeid());
		lo.add(c.getProvinceid());
		lo.add(c.getSchoolid());
		lo.add(c.getAcademy());
		lo.add(c.getClasses());
		lo.add(c.getStudentnum());
		lo.add(c.getSchoollength());
		lo.add(c.getEnterschoolyear());
		lo.add(c.getDiscountnum());
		lo.add(c.getStartcityid());
		lo.add(c.getEndcityid());
		lo.add(c.getUserid());
		lo.add(c.getIsmaincontact());
		return bs.getUpdate(sql, lo);
	}

	public boolean addContactNotStudent(Contact c)
	{
		String sql="insert into contact(name,idtypeid,idcardnum,sex,countryid,birth,email,phonenum,touristtypeid,userid,ismaincontact) values(?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> lo=new ArrayList<Object>();
		lo.add(c.getName());
		lo.add(c.getIdtypeid());
		lo.add(c.getIdcardnum());
		lo.add(c.getSex());
		lo.add(c.getCountryid());
		lo.add(c.getBirth());
		lo.add(c.getEmail());
		lo.add(c.getPhonenum());
		lo.add(c.getTouristtypeid());
		lo.add(c.getUserid());
		lo.add(c.getIsmaincontact());
		return bs.getUpdate(sql, lo);
	}
	
	@Override
	public Contact findMainContactByUseridandIsmaincontact(int userid)
	{
		Contact c=null;
		
		String sql1="select idtypeid,idcardnum,touristtypeid from contact where ismaincontact=1 and userid=?";
		List<Object> list1=new ArrayList<Object>();
		list1.add(userid);
		Contact c1=(Contact) bs.getQuery(sql1, list1, Contact.class).get(0);
		
		String sql2="select id from touristtype where name='学生'";
		List<Object> list2=new ArrayList<Object>();
		TouristType t1=(TouristType) bs.getQuery(sql2, list2, TouristType.class).get(0);
		
		String sql=null;
		if(c1.getTouristtypeid()==t1.getId())
		{
			sql="select id,name,idtypeid,idcardnum,sex,countryid,birth,email,phonenum,touristtypeid,provinceid,schoolid,academy,classes,studentnum,schoollength,enterschoolyear,discountnum,startcityid,endcityid,userid,ismaincontact from contact where ismaincontact=1 and userid=?";
		}
		else
		{
			sql="select id,name,idtypeid,idcardnum,sex,countryid,birth,email,phonenum,touristtypeid,userid,ismaincontact from contact where ismaincontact=1 and userid=?";
		}
		c=(Contact) bs.getQuery(sql, list1, Contact.class).get(0);
		if(c==null)
		{
			return null;
		}
		else
		{
			return c;
		}
	}
	@Override
	public boolean updateSexAndBirthByUseridAndIsmaincontact(String sex, String birth,int userid)
	{
		boolean isflag=false;
		List<Object> list=new ArrayList<Object>();
		list.add(sex);
		list.add(birth);
		list.add(userid);
		String sql="update contact set sex=?,birth=? where userid=? and ismaincontact=1";
		isflag=bs.getUpdate(sql, list);
		return isflag;
	}
	
	@Override
	public List<Contact> findContactByUserid(int userid)
	{
		List<Contact> lc=null;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		String sql="select * from contact where userid=?";
		lc=bs.getQuery(sql, list, Contact.class);
		return lc;
	}
	@Override
	public List<Contact> findContactByUseridAndName(int userid, String name)
	{
		List<Contact> lc=null;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(name);
		String sql="select * from contact where userid=? and name=?";
		lc=bs.getQuery(sql, list, Contact.class);
		return lc;
	}
	@Override
	public boolean deleteContactByUseridAndName(int userid, String name)
	{
		boolean isflag=false;
		List<Object> list=new ArrayList<Object>();
		list.add(userid);
		list.add(name);
		String sql="delete from contact where userid=? and name=?";
		isflag=bs.getUpdate(sql, list);
		return isflag;
	}

	@Override
	public boolean deleteContactById(int id)
	{
		boolean isflag=false;
		List<Object> list=new ArrayList<Object>();
		list.add(id);
		String sql="delete from contact where id=?";
		isflag=bs.getUpdate(sql, list);
		return isflag;
	}

	@Override
	public List<Contact> findcontactByUserId(int userid)
	{
		String sql="select * from contact where userid=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(userid);
		List<Contact> lc=bs.getQuery(sql, lo, Contact.class);
		return lc;
	}
}
