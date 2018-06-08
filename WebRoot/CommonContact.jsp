<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>常用联系人</title>
    <link rel="stylesheet" type="text/css" href="css/CommonContact.css" />
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
		function checkMeg()
		{
			if(document.getElementById("contactname").value=="输入联系人姓名!")
			{
				document.getElementById("contactname").value="";
			}
		}
		function deleteContact(num,name)
		{
			alert("成功删除联系人！");
			location.href="deletecontact.do?num="+num+"&username="+name;
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
							<div id="ctr">常用联系人</div>
							<div id="commomcontacts">
								<div id="l-1">
									<div id="l1-1"><a href="AddCommonContact.do" style="color:green;">+增加</a></div>
								</div>
								<div id="l-2">
									<div style="width:50px;text-align: center;float:left;">
										<br/>序号<br/><br/>
										<c:forEach var="listContact" items="${listContact}" >
											<div  style="height:38px;">
												<input type="text" value="${listContact.id}" style="border:0px;padding-left:22px;"  readonly="readonly" />
												<br/>
											</div>
										</c:forEach>
									</div>
									<div style="width:80px;text-align: center;float:left;">
										<br/>姓名<br/><br/>
										<c:forEach var="listContact" items="${listContact}" >
											<div  style="height:38px;">
												${listContact.name}
												<br/>
											</div>
										</c:forEach>
									</div>
									<div style="width:100px;text-align: center;float:left;">
										<br/>证件类型<br/><br/>
										<c:forEach  var="lidtype" items="${lidtype}"> 
											<div  style="height:38px;">
												${lidtype}
												<br/>
											</div>
										</c:forEach>
									</div>
									<div style="width:160px;text-align: center;float:left;">
										<br/>证件号码<br/><br/>
										<c:forEach var="listContact" items="${listContact}" >
											<div  style="height:38px;">
												${listContact.idcardnum}
												<br/>
											</div>
										</c:forEach>
									</div>
									<div style="width:90px;text-align: center;float:left;">
										<br/>手机号码<br/><br/>
										<c:forEach var="listContact" items="${listContact}" >
											<div  style="height:38px;">
												${listContact.phonenum}
												<br/>
											</div>
										</c:forEach>
									</div>
									<div style="width:80px;text-align: center;float:left;">
										<br/>旅客类型<br/><br/>
										<c:forEach var="lidtype2" items="${lidtype2}"> 
											<div  style="height:38px;">
												${lidtype2}<br/>
											</div>
										</c:forEach>	
									</div>
									<div style="width:75px;text-align: center;float:left;">
										<br/>核验状态<br/><br/>
										<c:forEach var="listContact" items="${listContact}" >
											<div style="color:blue;height:38px;">已通过</div>
										</c:forEach>
									</div>
									<div style="width:75px;text-align: center;float:left;">
										<br/>操作<br/><br/>
										<c:forEach var="listContact" items="${listContact}" >
											<div  style="height:38px;">
												<input type="submit"  name="${listContact.id}"  value="删除" style="background-color:orange;width:60px;" onclick="deleteContact(${listContact.id},'${user.username}')"/><br/>
											</div>
										</c:forEach>
									</div>
								</div>
								
								
								<div id="l-3"></div>
							</div>
							<!--  
							<div id="l-4">
								<div id="l4-1"><input type="submit" value="&nbsp;&nbsp;&nbsp;首&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;" style="height:40px;"/></div>
								<div id="l4-2"><input type="submit" value="&nbsp;上&nbsp;一&nbsp;页&nbsp;" style="height:40px;"/></div>
								<div id="l4-3"><input type="submit" style="background-color: orange;height:40px;"/></div>
								<div id="l4-4"><input type="submit" value="&nbsp;下&nbsp;一&nbsp;页&nbsp;" style="height:40px;"/></div>
								<div id="l4-5"><input type="submit" value="&nbsp;&nbsp;&nbsp;末&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;" style="height:40px;"/></div>
							</div>
							-->
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
