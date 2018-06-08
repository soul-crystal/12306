package cn.bean;

import java.util.Date;


public class Contact
{
	private int id;
	private String name;
	private int idtypeid;
	private String idcardnum;
	private String sex;
	private int countryid;
	private Date birth;
	private String email;
	private String phonenum;
	private int touristtypeid;
	private int provinceid;
	private int schoolid;
	private String academy;
	private String classes;
	private String studentnum;
	private int schoollength;
	private String enterschoolyear;
	private String discountnum;
	private int startcityid;
	private int endcityid;
	private int userid;
	private int ismaincontact;
	public Contact()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public Contact(String name, int idtypeid, String idcardnum, String sex,
			int countryid, Date birth, String email, String phonenum,
			int touristtypeid, int provinceid, int schoolid, String academy,
			String classes, String studentnum, int schoollength,
			String enterschoolyear, String discountnum, int startcityid,
			int endcityid, int userid, int ismaincontact)
	{
		super();
		this.name = name;
		this.idtypeid = idtypeid;
		this.idcardnum = idcardnum;
		this.sex = sex;
		this.countryid = countryid;
		this.birth = birth;
		this.email = email;
		this.phonenum = phonenum;
		this.touristtypeid = touristtypeid;
		this.provinceid = provinceid;
		this.schoolid = schoolid;
		this.academy = academy;
		this.classes = classes;
		this.studentnum = studentnum;
		this.schoollength = schoollength;
		this.enterschoolyear = enterschoolyear;
		this.discountnum = discountnum;
		this.startcityid = startcityid;
		this.endcityid = endcityid;
		this.userid = userid;
		this.ismaincontact = ismaincontact;
	}
	public Contact(int id, String name, int idtypeid, String idcardnum,
			String sex, int countryid, Date birth, String email,
			String phonenum, int touristtypeid, int provinceid, int schoolid,
			String academy, String classes, String studentnum,
			int schoollength, String enterschoolyear, String discountnum,
			int startcityid, int endcityid, int userid, int ismaincontact)
	{
		super();
		this.id = id;
		this.name = name;
		this.idtypeid = idtypeid;
		this.idcardnum = idcardnum;
		this.sex = sex;
		this.countryid = countryid;
		this.birth = birth;
		this.email = email;
		this.phonenum = phonenum;
		this.touristtypeid = touristtypeid;
		this.provinceid = provinceid;
		this.schoolid = schoolid;
		this.academy = academy;
		this.classes = classes;
		this.studentnum = studentnum;
		this.schoollength = schoollength;
		this.enterschoolyear = enterschoolyear;
		this.discountnum = discountnum;
		this.startcityid = startcityid;
		this.endcityid = endcityid;
		this.userid = userid;
		this.ismaincontact = ismaincontact;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getIdtypeid()
	{
		return idtypeid;
	}
	public void setIdtypeid(int idtypeid)
	{
		this.idtypeid = idtypeid;
	}
	public String getIdcardnum()
	{
		return idcardnum;
	}
	public void setIdcardnum(String idcardnum)
	{
		this.idcardnum = idcardnum;
	}
	public String getSex()
	{
		return sex;
	}
	public void setSex(String sex)
	{
		this.sex = sex;
	}
	public int getCountryid()
	{
		return countryid;
	}
	public void setCountryid(int countryid)
	{
		this.countryid = countryid;
	}
	public Date getBirth()
	{
		return birth;
	}
	public void setBirth(Date birth)
	{
		this.birth = birth;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getPhonenum()
	{
		return phonenum;
	}
	public void setPhonenum(String phonenum)
	{
		this.phonenum = phonenum;
	}
	public int getTouristtypeid()
	{
		return touristtypeid;
	}
	public void setTouristtypeid(int touristtypeid)
	{
		this.touristtypeid = touristtypeid;
	}
	public int getProvinceid()
	{
		return provinceid;
	}
	public void setProvinceid(int provinceid)
	{
		this.provinceid = provinceid;
	}
	public int getSchoolid()
	{
		return schoolid;
	}
	public void setSchoolid(int schoolid)
	{
		this.schoolid = schoolid;
	}
	public String getAcademy()
	{
		return academy;
	}
	public void setAcademy(String academy)
	{
		this.academy = academy;
	}
	public String getClasses()
	{
		return classes;
	}
	public void setClasses(String classes)
	{
		this.classes = classes;
	}
	public String getStudentnum()
	{
		return studentnum;
	}
	public void setStudentnum(String studentnum)
	{
		this.studentnum = studentnum;
	}
	public int getSchoollength()
	{
		return schoollength;
	}
	public void setSchoollength(int schoollength)
	{
		this.schoollength = schoollength;
	}
	public String getEnterschoolyear()
	{
		return enterschoolyear;
	}
	public void setEnterschoolyear(String enterschoolyear)
	{
		this.enterschoolyear = enterschoolyear;
	}
	public String getDiscountnum()
	{
		return discountnum;
	}
	public void setDiscountnum(String discountnum)
	{
		this.discountnum = discountnum;
	}
	public int getStartcityid()
	{
		return startcityid;
	}
	public void setStartcityid(int startcityid)
	{
		this.startcityid = startcityid;
	}
	public int getEndcityid()
	{
		return endcityid;
	}
	public void setEndcityid(int endcityid)
	{
		this.endcityid = endcityid;
	}
	public int getUserid()
	{
		return userid;
	}
	public void setUserid(int userid)
	{
		this.userid = userid;
	}
	public int getIsmaincontact()
	{
		return ismaincontact;
	}
	public void setIsmaincontact(int ismaincontact)
	{
		this.ismaincontact = ismaincontact;
	}
	
}
