<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单信息</title>
    <link rel="stylesheet" type="text/css" href="css/OrderInformation.css" />
   	<script type="text/javascript">
		function changeLeft(sf)
		{
			sf.style.color="white";
		}
		function returnLeft(sf)
		{
			sf.style.color="black";
		}
		function changeOrder()
		{
			location.href="OrderInformation2.jsp";
		}
		function deleteContext2()
		{
			document.getElementById("touristname2").value="";
		}
    </script>
  </head>
  
  <body>
  	<form action="selectorder.do" method="post">
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
								<div id="ctr">订单信息</div>
									
								<div id="ordersearch2" style="display:block;margin-bottom:50px;">
									<div id="ctr-01">
										<div id="ctr01-1" >
											查看订单
										</div>
										<div id="ctr01-3">
										</div>
									</div>
									<div id="ctr-02">
										<div id="ctr02-1">
											<select id="selectss" name="selectss" style="width:120px;height:28px;">
												<option value="按订票日期查询">按订票日期查询</option>
												<option value="按乘车日期查询">按乘车日期查询</option>
											</select>
										</div>
										<div id="ctr02-2">查询日期</div>	
										<div id="ctr02-3"><input type="date" id="starttime2" name="starttime2" value="${date2}" style="height:28px;"/>--</div>
										<div id="ctr02-4"><input type="date" id="endtime2" name="endtime2"  value="${date1}" style="height:28px;"/></div>	
										<div id="ctr02-5"><input type="text" id="touristname2" name="touristname2" placeholder="乘客姓名" size="15" style="height:28px;" />  </div>	
										<div id="ctr02-6"><input type="button" value="&nbsp;×&nbsp;" style="height:28px;" onclick="deleteContext2()"/></div>
										<div id="ctr02-7"><input type="submit" value="&nbsp;&nbsp;查&nbsp;&nbsp;询&nbsp;&nbsp;" style="background-color: orange;height:28px;"/></div>	
									</div>
								</div>
								<!-- 
								<div id="ordersselect">
									 
									<select style="height:28px;width:100px;"  id="ordersselect" name="ordersselect">
										<option value="全部">全部</option>
										<option value="可改签">可改签</option>
										<option value="可退票">可退票</option>
									</select>
								</div>
								-->
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
						
	</form>
	
	
  </body>
</html>
