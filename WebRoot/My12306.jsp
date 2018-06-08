<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的12306</title>
    <link rel="stylesheet" type="text/css" href="css/My12306.css" />
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
			if(hour>=5 && hour<=12)
			{
				a="上午好!";
			}
			else if(hour>12 && hour<=18)
			{
				a="下午好!";
			}
			else
			{
				a="晚上好!";
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
			document.getElementById("ctr-4").innerHTML=a;
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
    </script>
  </head>
  
  <body onload="showTime()">
  	<div id="layout">
  			<center>
  				<div id="sum">
				    <jsp:include page="top.jsp" flush="true"/>
				    <div id="center">
						<div id="c-one">
							您现在的位置：<a href="index.jsp">客运首页</a> > 我的12306
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
								<div id="ctr">系统信息</div>
								<div id="ctr-1">
									<img src="images/hi.jpg">
								</div>
								<div id="ctr-2">
									${user.username} &nbsp;
								</div>
								<div id="ctr-3">
									<c:if test="${contact.sex=='女'}">女士，</c:if>
									<c:if test="${contact.sex=='男'}">先生，</c:if>
								</div>
								<div id="ctr-4"></div>
								<div id="ctr-5">欢迎您登录中国铁路客户服务中心网站。</div>
							</div>    
						</div>
					</div>

					<div id="footer"><br/><br/>
			           <a href="#" style="color:#666">关于我们</a>&nbsp;|&nbsp;<a href="#" style="color:#666">网站声明</a><br/>
						            版权所有&nbsp;©&nbsp;2008-2017&nbsp;中国铁路信息技术中心&nbsp;中国铁道科学研究院<br/>
						           京ICP备15003716号-3&nbsp;|&nbsp;京ICP证150437号
			        </div>
				</div>
			</center>
		</div>
  </body>
</html>
