package cn.dbc;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BaseDao
{
	Connection conn=null;
	PreparedStatement pst=null;
	ResultSet rs=null;
	
	public Connection getConnection()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/12306?characterEncoding=utf-8","root","123456");
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}
	
	public boolean getUpdate(String sql,List<Object> list)
	{
		try 
		{
			pst=getConnection().prepareStatement(sql);
			if(list.size()>0)
			{
				for(int i=0;i<list.size();i++)
				{
					pst.setObject(i+1, list.get(i));
				}
			}
			int num = pst.executeUpdate();
			if(num>0)
			{
				return true;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			closeConn(conn, pst, rs);
		}
		return false;
	}

	public <T> List<T> getQuery(String sql,List<Object> list,Class<T> clazz)
	{
		List<T> li = new ArrayList<T>();
		try
		{
			pst = getConnection().prepareStatement(sql);
			if(list.size()>0)
			{
				for(int i=0;i<list.size();i++)
				{
					pst.setObject(i+1, list.get(i));
				}
			}
			rs = pst.executeQuery();
			ResultSetMetaData rsm = rs.getMetaData();
			int count = rsm.getColumnCount();
			while(rs.next())
			{
				T t = clazz.newInstance();
				for(int i=1;i<=count;i++)
				{
					String name = rsm.getColumnName(i);
					Object o = rs.getObject(i);
					Field f=clazz.getDeclaredField(name);
					f.setAccessible(true);
					if(o!=null)
						f.set(t,o);
				}
				li.add(t);
			}
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			closeConn(conn, pst, rs);
		}
		return li;
	}
	
	public void closeConn(Connection conn,PreparedStatement pstmt,ResultSet rs)
	{
		try
		{
			if(rs!=null)
			{
				rs.close();
				rs=null;
			}
			if(pstmt!=null)
			{
				pstmt.close();
				pstmt=null;
			}
			if(conn!=null)
			{
				conn.close();
				conn=null;
			}
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
