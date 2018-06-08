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
		function changeLeft(sf)
		{
			sf.style.color="white";
		}
		function returnLeft(sf)
		{
			sf.style.color="black";
		}
		function checkMessage()
		{
			var oldpwd=document.getElementById("oldpwd").value;
			var newpwd=document.getElementById("newpwd").value;
			var cnewpwd=document.getElementById("cnewpwd").value;
			var isflag=null;
			if(oldpwd!=${user.password})
			{
				alert("用户名或密码不存在");
				isflag=false;
			}
			else
			{
				var reg=/^\w+$/;
				if(newpwd.length<6)
				{
					isflag=false;
					document.getElementById("ctr1-3-01").innerHTML="×新密码长度不少于6位";
				}
				else if(!reg.test(newpwd))
				{
					isflag=false;
					document.getElementById("ctr1-3-01").innerHTML="×新密码只能包括字母、数字、下划线";
				}
				else if(newpwd!=cnewpwd)
				{
					isflag=false;
					document.getElementById("ctr1-5-01").innerHTML="×确认密码与新密码不一致";
				}
				else
				{
					alert("修改密码成功！");
					isflag=true;
				}
			}
			return isflag;
		}
    </script>
  </head>
  
  <body>
  	<form action="changeloginpassword.do" method="post" onsubmit="return checkMessage()">
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
									<div id="ctr1">
										<div id="ctr1-1">密码修改</div>
										<div id="ctr1-2">
											<div id="ctr1-2-1">*&nbsp;</div>
											<div id="ctr1-2-2">原密码：</div>
											<div id="ctr1-2-3"><input type="password" id="oldpwd" style="height:26px;"/></div>
											<div id="ctr1-2-4">请输入原密码</div>
										</div>
										<div id="ctr1-2-01">
										</div>
										<div id="ctr1-3">
											<div id="ctr1-3-1">*&nbsp;</div>
											<div id="ctr1-3-2">新密码：</div>
											<div id="ctr1-3-3"><input type="password" id="newpwd" name="newpwd" style="height:26px;"/></div>
											<div id="ctr1-3-4">密码只能包含字母、数字、下划线且长度不少于6。</div>
										</div>
										<div id="ctr1-3-01" style="color:red;font-size:12px;">
										</div>
										
										<div id="ctr1-5">
											<div id="ctr1-5-1">*&nbsp;</div>
											<div id="ctr1-5-2">密码确认：</div>
											<div id="ctr1-5-3"><input type="password" id="cnewpwd" style="height:26px;"/></div>
											<div id="ctr1-5-4">请再次输入密码。</div>
										</div>
										<div id="ctr1-5-01" style="color:red;font-size:12px;">
										</div>
										<div id="ctr1-6">------------------------------------------------------------------------------------------------------------------------------------------</div>
										<div id="ctr1-7">
											<input type="reset" value="&nbsp;&nbsp;&nbsp;取&nbsp;&nbsp;&nbsp;消&nbsp;&nbsp;&nbsp;" style="height:40px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="submit" value="&nbsp;&nbsp;&nbsp;确&nbsp;&nbsp;&nbsp;认&nbsp;&nbsp;&nbsp;" style="background-color: orange;height:40px;"/>
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
			</center>
		</div>
	</form>
	
  </body>
</html>
