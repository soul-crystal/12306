<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
    	<link rel="stylesheet" type="text/css" href="css/top.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>top</title>
        <script type="text/javascript">
        	function mouseover(str)
			{
				setTimeout(
					function()
					{
						document.getElementById(str).style.display="block";
					}
					,50);
			}
			function mouseout(str)
			{
				setTimeout(
					function()
					{
						document.getElementById(str).style.display="none";
					}
					,50);
			}
        </script>
    </head>
    <body>
    	<div class="top_header">
	    	<div class="header">
	    		<div style="z-index: 2000" class="header-bd">
	    			<a href="index.jsp">
	    				<h1 class="logo">中国铁路客户服务中心-客运中心</h1>
	    			</a>
	    			<div class="login-info">
	    				<c:choose>
	    					<c:when test="${empty sessionScope.user }">
			    				您好，请
			    	        	</span>
				    				<a id="login_user" href="login.jsp" class="colorA" style="margin-left:-0.5px;">登录</a>|
				    				<a id="regist_out" href="register.do">注册</a>
			    				</span>
	    					</c:when>
		    				<c:otherwise>
		    					您好，
		    					</span>
				    				<a id="login_user" href="My12306.do" class="colorA" style="margin-left:-0.5px;">${sessionScope.user.username }</a>|
				    				<a id="regist_out" href="exit.do">退出</a>
			    				</span>
		    				</c:otherwise>
	    				</c:choose>
	    				<div class="menu">
	    					<a href="My12306.do" class="menu-bd" id="js-my" onmouseover="mouseover('detail')" onmouseout="mouseout('detail')">我的12306</a>
	    					<div class="menu-list" id="detail" onmouseover="mouseover('detail')" onmouseout="mouseout('detail')">
	    						<ul>
	    							<li>
	    								<a href="ViewPersonalInformation.do">查看个人信息</a>
	    							</li>
	    							<li>
	    								<a href="OrdersInformation.do">查看订单信息</a>
	    							</li>
	    							<li class="line"></li>
	    							<li>
	    								<a href="CommonContact.do">常用联系人</a>
	    							</li>
	    							<li>
	    								<a href="AccountSecurity.jsp">账户安全</a>
	    							</li>
	    						</ul>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="nav">
	    				<ul>
	    					<li>
	    						<a href="index.jsp">客运首页</a>
	    					</li>
	    					<li>
	    						<a href="trainnum.jsp">车票预订</a>
	    					</li>
	    					<li>
	    						<a href="ticketprice.jsp">票价查询</a>
	    					</li>
	    					<li>
	    						<a href="agency.jsp">代售点查询</a>
	    					</li>
	    				</ul>
	    			</div>
	    		</div>
	    	</div>
    	</div>
 	</body>
</html>