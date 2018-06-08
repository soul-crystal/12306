<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>账号安全</title>
	<link rel="stylesheet" type="text/css" href="css/AccountSecurity.css" />
	<script type="text/javascript">
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
		function changeView()
		{
			location.href="ChangeUserPassword.jsp";
		}
    </script>
  </head>
  
  <body>
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
							<div id="ctr">账号安全</div>
							<div id="changepwd">
								<div id="l-1"><img src="images/mima.jpg"></div>
								<div id="l-2">登录密码</div>
								<div id="l-3">|</div>
								<div id="l-4">建议您定期更改密码以保护账户安全。</div>
								<div id="l-5"><input type="button" value="修改密码" onclick="changeView()" style="height:32px;width:90px;background-color:orange;" /></div>	
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
		</center>
	</div>		
  </body>
</html>
