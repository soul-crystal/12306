package cn.dao;

import java.util.List;

import cn.bean.User;

public interface UserDao
{
	public List<User> findAllUser();
	
	public boolean addUser(User u);
	
	public User findUserById(int id);
	
	public User login(String username,String password);
	
	public boolean checkName(String name);
	
	public User findUserByUsername(String username);
	
	public boolean changePasswordByUsername(String username,String newpassword);
}
