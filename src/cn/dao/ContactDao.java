package cn.dao;

import java.util.List;

import cn.bean.Contact;

public interface ContactDao
{
	public boolean addContact(Contact c);
	
	public boolean addContactNotStudent(Contact c);
	
	public Contact findMainContactByUseridandIsmaincontact(int userid);
	
	public boolean updateSexAndBirthByUseridAndIsmaincontact(String sex,String birth,int userid);
	
	public boolean deleteContactByUseridAndName(int userid,String name);
	
	public List<Contact> findContactByUserid(int userid);
	
	public List<Contact> findContactByUseridAndName(int userid,String name);
	
	public boolean deleteContactById(int id);
	
	public List<Contact> findcontactByUserId(int userid);
}
