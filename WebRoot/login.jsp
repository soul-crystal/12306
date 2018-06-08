<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录界面</title>
		<link href="css/register.css" rel="stylesheet" type="text/css">
		<script>
			function addValue()
			{
				var tvalue=document.getElementById("loginname").value;
				if(tvalue=="")
				{
					document.getElementById("l1").innerHTML="登录名必须填写!";
				}
				else
				{
					document.getElementById("l1").innerHTML="";
				}
			}
			function addPwd()
			{
				var tvalue=document.getElementById("password").value;
				if(tvalue.length<6)
				{
					document.getElementById("message1").innerHTML="密码必须填写,且不少于6位!";
				}
				else
				{
					document.getElementById("message1").innerHTML="";
				}
			}
			function checkAll()
			{
				var tvalue=document.getElementById("loginname").value;
				if(tvalue=="")
				{
					alert("请填写登录名!");
					return false;
				}
				var tvalue1=document.getElementById("password").value;
				if(tvalue1.length<6)
				{
					alert("请填写正确的密码!");
					return false;
				}
				return true;
			}
			function goRegister()
			{
				location.href="Register.do";
			}
		</script>
	</head>
	<body>
		<center>
    	<div id="pagec">
            <jsp:include page="top.jsp" flush="true"/>
            <div id="maintop">
                	您现在的位置:&nbsp;<a href="#">客运首页</a>&nbsp;>&nbsp;<a href="login.jsp">登录</a>
            </div>
            <div id="m1">
            	<div id="m1l">
            		<div style="float:left"><img src="images/login_1.png"/></div>
            		<div style="float:right;height:100%;width:518px;">
            		<center><br/><br/><br/><br/>
            		<form action="Login.do" method="post" onsubmit="return checkAll()">
            			<h2>用户登录&nbsp;&nbsp;&nbsp;</h2><br/>
            			<table>
            				<tr>
            					<td style="text-align:right;font-size:14px;">登录名:&nbsp;</td>
            					<td><input type="text" style="width:280px;" id="loginname" name="loginname" onblur="addValue()" placeholder="用户名/邮箱/手机号"/></td>
            					<td></td>
            				</tr>
            				<tr>
            					<td></td><td colspan="2" id="l1" style="color:red"></td>
            				</tr>
            				<tr></tr><tr></tr>
            				<tr>
            					<td style="text-align:right;font-size:14px;">密码:&nbsp;</td>
            					<td><input type="password" style="width:280px" id="password" name="password" onblur="addPwd()"/></td>
            					<td><a href="#" style="color:blue;">&nbsp;忘记用户名/密码?</a>
            					</td>
            				</tr>
            				<tr>
            					<td></td><td colspan="2" id="message1" style="color:red">${message}</td>
            				</tr>
            				<tr></tr><tr></tr>
            				<tr>
            					<td></td>
            					<td colspan="2">
            					<input type="submit" value="登录" style="width:140px;color:#FFF;background-color:#F60;border:0px;"/>
            					<input type="button" value="快速注册" style="width:140px;border:0px;" onclick="goRegister()"/>
            					</td>
            				</tr>
            			</table>
            		</form>
            		</center>
            		</div>
            	</div>
            	<div id="m1r"><br/><br/>
            		<a href="#"><img src="images/login_11.png"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            		<a href="#"><img src="images/login_22.png"/></a><br/><br/>
            		<a href="#"><img src="images/login_33.png"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            		<a href="#"><img src="images/login_44.png"/></a><br/><br/>
            		<a href="#"><img src="images/login_55.png"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            		<a href="#"><img src="images/login_66.png"/></a>
            	</div>
            </div><br/>
            <div id="m2"><img src="images/login_2.png"/></div><br/>
            <div id="footer"><br/><br/>
            <a href="#" style="color:#666">关于我们</a>&nbsp;|&nbsp;<a href="#" style="color:#666">网站声明</a><br/>
			            版权所有&nbsp;©&nbsp;2008-2017&nbsp;中国铁路信息技术中心&nbsp;中国铁道科学研究院<br/>
			            京ICP备15003716号-3&nbsp;|&nbsp;京ICP证150437号
            </div>
        </div>
        </center>
	</body>
</html>