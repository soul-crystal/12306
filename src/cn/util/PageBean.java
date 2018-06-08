package cn.util;

public class PageBean
{
	private int count; 
	private int pages;
	private int pageIndex;
	private int pageSize;
	public PageBean()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public PageBean(int count, int pages, int pageIndex, int pageSize)
	{
		super();
		this.count = count;
		this.pages = pages;
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
	}
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
	public int getPages()
	{
		return pages;
	}
	public void setPages(int pages)
	{
		this.pages = pages;
	}
	public int getPageIndex()
	{
		return pageIndex;
	}
	public void setPageIndex(int pageIndex)
	{
		this.pageIndex = pageIndex;
	}
	public int getPageSize()
	{
		return pageSize;
	}
	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
	}
	public int getPage()
	{
		pages=count%pageSize==0?count/pageSize:count/pageSize+1;
		return pages;
	}
}
