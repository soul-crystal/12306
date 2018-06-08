package cn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.bean.User;
import cn.dao.UserDao;
import cn.dbc.BaseDao;

public class UserDaoImpl implements UserDao
{
	BaseDao bs=new BaseDao();
	
	public List<User> findAllUser()
	{
		String sql="select * from user";
		List<User> lu=bs.getQuery(sql, new ArrayList<Object>(), User.class);
		return lu;
	}

	public boolean addUser(User u)
	{
		String sql="insert into user(username,password) values(?,?)";
		List<Object> lo=new ArrayList<Object>();
		lo.add(u.getUsername());
		lo.add(u.getPassword());
		return bs.getUpdate(sql, lo);
	}

	public User findUserById(int id)
	{
		String sql="select * from user where id=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(id);
		List<User> lu=bs.getQuery(sql, lo, User.class);
		if(lu.size()>0) 
		{
			return lu.get(0);
		}
		return null;
	}

	public User login(String username, String password)
	{
		String sql="select * from user where username=? and password=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(username);
		lo.add(password);
		List<User> lu=bs.getQuery(sql, lo, User.class);
		if(lu.size()>0) 
		{
			return lu.get(0);
		}
		return null;
	}

	public boolean checkName(String name)
	{
		String sql="select * from user where username=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(name);
		if(bs.getQuery(sql, lo, User.class).size()>0) 
		{
			return true;
		}
		return false;
	}

	public User findUserByUsername(String username)
	{
		String sql="select * from user where username=?";
		List<Object> lo=new ArrayList<Object>();
		lo.add(username);
		List<User> lu=bs.getQuery(sql, lo, User.class);
		if(lu.size()>0) 
		{
			return lu.get(0);
		}
		return null;
	}

	@Override
	public boolean changePasswordByUsername(String username, String newpassword)
	{
		boolean isflag=false;
		List<Object> list=new ArrayList<Object>();
		list.add(newpassword);
		list.add(username);
		String sql="update user set password=? where username=?";
		isflag=bs.getUpdate(sql, list);
		return isflag;
	}
}
