<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="css/ViewPersonalInformation.css" />
  </head>
  
  <body onload="showTime()">
  	<div id="layout">
  		<center>
  			<div id="sum">
			    <jsp:include page="top.jsp" flush="true"/>
			    <div id="center1">
					<div id="c-one">
						您现在的位置：<a href="index.jsp" >客运首页</a> > 我的12306
					</div>
					<div id="c-two">
						<div id="c-two-left">
							<div id="ctl">我的12306</div>
							<div id="ctl-1"><a href="ViewPersonalInformation.do" onmouseover="changeLeft(this)" onmouseout="returnLeft(this)">个人信息</a></div>
							<hr/>
							<div id="ctl-2"><a href="CommonContact.do" onmouseover="changeLeft(this)" onmouseout="returnLeft(this)">常用联系人</a></div>
							<hr/>
							<div id="ctl-3"><a href="AccountSecurity.jsp" onmouseover="changeLeft(this)" onmouseout="returnLeft(this)">账号安全</a></div>
							<hr/>
							<div id="ctl-4"><a href="OrdersInformation.do" onmouseover="changeLeft(this)" onmouseout="returnLeft(this)">订单信息</a></div>
						</div>
						<div id="c-two-right">
							<div id="ctr">个人信息</div>
							<div id="ctr-1">
								<div id="ctr1-1">
									<div id="ctr1-11">
										*&nbsp;
									</div>
									<div id="ctr1-12">
										基本信息
									</div>	
									<div id="ctr1-13">
										----------------------------------------------------------------------------------------
									</div>
								</div>
								<div id="ctr1-2">
									<div id="ctr1-21">
										*&nbsp;
									</div>
									<div id="ctr1-22">
										用户名：
									</div>
									<div id="ctr1-23">
										${user.username}
									</div>
								</div>
								<div id="ctr1-3">
									<div id="ctr1-31">
										*&nbsp;
									</div>
									<div id="ctr1-32">
										姓名：
									</div>
									<div id="ctr1-33">
										${contact.name}
									</div>
								</div>
								<div id="ctr1-4">
									<div id="ctr1-41">
										*&nbsp;
									</div>
									<div id="ctr1-42">
										性别：
									</div>
									<div id="ctr1-43">
										${contact.sex}
									</div>
								</div>
								<div id="ctr1-5">
									<div id="ctr1-51">
										国家/地区:
									</div>
									<div id="ctr1-52">
										${country.name}
									</div>
								</div>
								<div id="ctr1-6">
									<div id="ctr1-61">
										*&nbsp;
									</div>
									<div id="ctr1-62">
										证件类型：
									</div>
									<div id="ctr1-63">
										${idtype.name}
									</div>
								</div>
								<div id="ctr1-7">
									<div id="ctr1-71">
										*&nbsp;
									</div>
									<div id="ctr1-72">
										证件号码：
									</div>
									<div id="ctr1-73">
										${contact.idcardnum}
									</div>
								</div>
								<div id="ctr1-8">
									<div id="ctr1-81">
										出生日期：
									</div>
									<div id="ctr1-82">
										${contact.birth}
									</div>
								</div>
								<div id="ctr1-9">
									<div id="ctr1-91">
										核验状态：
									</div>
									<div id="ctr1-92">
										已通过
									</div>
								</div>
							</div>
							
							
							
							<div id="ctr-2">
								<div id="ctr2-1">
									<div id="ctr2-11">
										*&nbsp;
									</div>
									<div id="ctr2-12">
										联系方式
									</div>	
									<div id="ctr2-13">
										---------------------------------------------------------------------------------------
									</div>
								</div>
								<div id="ctr2-2">
									<div id="ctr2-21">
										*&nbsp;
									</div>
									<div id="ctr2-22">
										手机号码：
									</div>
									<div id="ctr2-23">
										${contact.phonenum}
									</div>
									<div id="ctr2-24">
										已通过核验
									</div>
								</div>
								<div id="ctr2-4">
									<div id="ctr2-41">
										电子邮件：
									</div>
									<div id="ctr2-42">
										${contact.email}
									</div>
								</div>
							</div>
							
							<div id="ctr-3">
								<div id="ctr3-1">
									<div id="ctr3-11">
										*&nbsp;
									</div>
									<div id="ctr3-12">
										附加信息
									</div>	
									<div id="ctr3-13">
										------------------------------------------------------------------------------------------
									</div>
								</div>
								<div id="ctr3-2">
									<div id="ctr3-21">
										旅客类型：
									</div>
									<div id="ctr3-22">
										${touristtype.name}
									</div>
								</div>
								<div id="studentlists" <c:if test="${touristtype.name!='学生'}">style="display:none;"</c:if>>									
									<div id="ctr3-3">
										<div id="ctr3-31">
											学校所在省份：
										</div>
										<div id="ctr3-32">
											${province.name}
										</div>
									</div>
									<div id="ctr3-4">
										<div id="ctr3-41">
											学校名称：
										</div>
										<div id="ctr3-42">
											${school.name}
										</div>
									</div>
									<div id="ctr3-5">
										<div id="ctr3-51">
											院系：
										</div>
										<div id="ctr3-52">
											${contact.academy}
										</div>
									</div>
									<div id="ctr3-6">
										<div id="ctr3-61">
											班级：
										</div>
										<div id="ctr3-62">
											${contact.classes}
										</div>
									</div>
									<div id="ctr3-7">
										<div id="ctr3-71">
											学号：
										</div>
										<div id="ctr3-72">
											${contact.studentnum}
										</div>
									</div>
									<div id="ctr3-8">
										<div id="ctr3-81">
											学制：
										</div>
										<div id="ctr3-82">
											${contact.schoollength}
										</div>
									</div>
									<div id="ctr3-9">
										<div id="ctr3-91">
											入学年份：
										</div>
										<div id="ctr3-92">
											${contact.enterschoolyear}
										</div>
									</div>
									<div id="ctr3-10">
										<div id="ctr3-101">
											优惠卡号：
										</div>
										<div id="ctr3-102">
											${contact.discountnum}
										</div>
									</div>
									<div id="ctr3-011">
										<div id="ctr3-0111">
											优惠区间：
										</div>	
										<div id="ctr3-0112">
											${startcity.name}	
										</div>
										<div id="ctr3-0113">
											--
										</div>
										<div id="ctr3-0114">
											${endcity.name}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="footer"><br/><br/>
	           		<a href="#" style="color:#666">关于我们</a>&nbsp;|&nbsp;<a href="#" style="color:#666">网站声明</a><br/>
				           	 版权所有&nbsp;©&nbsp;2008-2017&nbsp;中国铁路信息技术中心&nbsp;中国铁道科学研究院<br/>
				        	 京ICP备15003716号-3&nbsp;|&nbsp;京ICP证150437号
		           	</div>
				</div>
			</div>
		</center>
	</div>
	<script type="text/javascript">
    	function showTime()
    	{
    		var date=new Date();
    		var a=null;
    		var year=date.getFullYear();
    		var month=date.getMonth();
    		if(month<10)
    		{
    			month="0"+month;
    		}
    		var day=date.getDate();
    		if(day<10)
			{
				day="0"+day;
			}
    		var week=date.getDay();
    		if(week=="0")
			{
				week="星期天";
			}
			if(week=="1")
			{
				week="星期一";
			}
			if(week=="2")
			{
				week="星期二";
			}
			if(week=="3")
			{
				week="星期三";
			}
			if(week=="4")
			{
				week="星期四";
			}
			if(week=="5")
			{
				week="星期五";
			}
			if(week=="6")
			{
				week="星期六";
			}
    		var hour=date.getHours();
    		if(hour<10)
			{
				hour="0"+hour;
			}
    		var minute=date.getMinutes();
    		if(minute<10)
			{
				minute="0"+minute;
			}
    		var second=date.getSeconds();
    		if(second<10)
			{
				second="0"+second;
			}
			
			setTimeout("showTime()",1000); 
    	}
    	function changeFontColor(sf) 
    	{
			sf.style.color="red";
		}
		function returnFontColor(sf)
		{
			sf.style.color="black";	
		}
		function showMy12306()
		{
			document.getElementById("my12306").style.display="block";
			document.getElementById("headerMy12306").style.color="red";
		}
		function hideMy12306()
		{
			document.getElementById("my12306").style.display="none";
			document.getElementById("headerMy12306").style.color="white";
		}
		function changeLeft(sf)
		{
			sf.style.color="white";
		}
		function returnLeft(sf)
		{
			sf.style.color="black";
		}
		function changeBaseInformationEditable()
		{
			location.href="ViewPersonalInformation2.jsp";
		}
		function changeContactWayEditable()
		{
			document.getElementById("ctr-2").style.display="none";
			document.getElementById("ctr-2-write").style.display="block";
		}
		function changeInformationEditable()
		{
			document.getElementById("ctr-3").style.display="none";
			document.getElementById("ctr-3-write").style.display="block";
		}
		function truePassword()
		{
			var password=document.getElementById("password").value;
			if(${user.password}==password)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
    </script>
  </body>
</html>
