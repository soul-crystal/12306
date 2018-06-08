<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>车票预定</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    	
	<link href="<c:url value='/css/ticketprice_style.css'/>" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<c:url value='/js/ajaxutils.js'/>"></script>
	<script type="text/javascript">
		function formSubmit()
		{
			var start=document.getElementsByName("start")[0];
			var end=document.getElementsByName("end")[0];
			var startdate=document.getElementsByName("startdate")[0];
			if(start.value!="" && start.value.replace(/^\s+|\s+$/g, '')!=""
				&& end.value!="" && end.value.replace(/^\s+|\s+$/g, '')!=""
				)
			{
				document.getElementById('subform').submit();
			}
			else
			{
				if(start.value=="" || start.value.replace(/^\s+|\s+$/g, '')=="")
				{
					start.style.border="1px solid red";
				}
				if(end.value=="" || end.value.replace(/^\s+|\s+$/g, '')=="")
				{
					end.style.border="1px solid red";
				}
			}
		}
		var divNode;
		function getCityOrStation(obj)
		{
			var msg=obj.value;
			if(divNode!=null)
			{
				divNode.parentNode.removeChild(divNode);
				divNode=null;
			}
			var oParentNode=obj.parentNode;
			ajax(
					{
						url:"<c:url value='/cityOrStation.do'/>",
						method:"POST",
						params:"msg="+msg,
						asyn : false,
						type:"json",
						callback:function(data)
						{
							var oDivNode=document.createElement("div");
							divNode=oDivNode;
							oParentNode.appendChild(oDivNode);
							oDivNode.className="fuzzyquery";
							var oDivNode1=document.createElement("div");
							oDivNode.appendChild(oDivNode1);
							oDivNode1.className="divquery1";
							var oSpanNode=document.createElement("span");
							oDivNode1.appendChild(oSpanNode);
							oSpanNode.innerHTML="按\"";
							oSpanNode=document.createElement("span");
							oDivNode1.appendChild(oSpanNode);
							oSpanNode.className="spanquery";
							oSpanNode.innerHTML=msg;
							oSpanNode=document.createElement("span");
							oDivNode1.appendChild(oSpanNode);
							oSpanNode.innerHTML="\"检索：";
							var oDivNode2=document.createElement("div");
							oDivNode.appendChild(oDivNode2);
							oDivNode2.className="divquery2";
							for(var x=0;x<data.length;x++)
							{
								var oANode=document.createElement("a");
								oDivNode2.appendChild(oANode);
								oANode.innerHTML=data[x];
								oANode.className="aquery";
								oANode.href="javascript:void(0)";
								oANode.onmouseover=function()
								{
									mouseOver(this);
								}
								function mouseOver(o)
								{
									o.style.borderTop="thin solid rgba(104,167,246,1.00)";
									o.style.borderBottom="thin solid rgba(104,167,246,1.00)";
									o.style.backgroundColor="rgba(200,227,252,1.00)";
								}
								oANode.onmouseout=function()
								{
									mouseOut(this);
								}
								function mouseOut(o)
								{
									o.style.borderTop="thin solid rgba(255,255,255,1.00)";
									o.style.borderBottom="thin solid rgba(255,255,255,1.00)";
									o.style.backgroundColor="white";
								}
								oANode.onclick=function()
								{
									click(this);
								}
								function click(o)
								{
									divNode.parentNode.removeChild(divNode);
									divNode=null;
									obj.value=o.innerHTML;
									obj.style.border="1px solid rgba(169,169,169,1.00)";
								}
							}
						}
					}
				);
		}
		function clearValue(obj)
		{
			setTimeout(
					function()
					{
						if(divNode!=null)
						{
							divNode.parentNode.removeChild(divNode);
							divNode=null;
							obj.value="";
						}
					}
					,500);
		}
	</script>
  </head>

  <body>
	<div id="layout">
		<jsp:include page="top.jsp" flush="true"/>
		<div id="main">
			<div id="m_up">
				<form action="<c:url value='/ticketprice.do'/>" method="post" id="subform">
					<ul>
						<li>
							<span>出发地</span>
							<input type="text" class="inputbox" name="start" value="${start }" oninput="getCityOrStation(this)" onblur="clearValue(this)" placeholder="简拼/全拼/汉字"/>
						</li>
						<li>
							<span>目的地</span>
							<input type="text" class="inputbox" name="end" value="${end }" oninput="getCityOrStation(this)" onblur="clearValue(this)" placeholder="简拼/全拼/汉字"/>
						</li>
						<li>
							<a class="query" href="javascript:void(0)" onclick="formSubmit()">查询</a>
						</li>
					</ul>
				</form>
			</div>
			<div id="m_bottom">
		    	<table id="table">
			        <tr height="50px" style="background-color:rgba(37,136,202,1.00)">
		        		<td class="table1">起始站-->终点站</td>
			            <td class="table2">
			            	商务座<br/>
			            	特等座
			            </td>
			            <td class="table2">一等座</td>
			            <td class="table2">二等座</td>
			            <td class="table2">高级软卧</td>
			            <td class="table2">软卧</td>
			            <td class="table2">动卧</td>
			            <td class="table2">硬卧</td>
			            <td class="table2">软座</td>
			            <td class="table2">硬座</td>
			            <td class="table2">无座</td>
			        </tr>
			        <c:choose>
			        <c:when test="${ticketpriceList!=null and fn:length(ticketpriceList)==0}">
			        	<tr height="100px" style="background-color:white">
		                    <td class="table5" colspan="11">${start }-->${end }的票价不存在</td>
	                	</tr>
			        </c:when>
			        <c:otherwise>
			        	<c:forEach items="${ticketpriceList }" var="ticketprice">
					        <tr height="50px" style="background-color:white">
			                    <td class="table3">${ticketprice.startstation }-->${ticketprice.endstation }</td>
					            <td class="table4">¥${ticketprice.price['商务座特等座'] }</td>
					            <td class="table4">¥${ticketprice.price['一等座'] }</td>
					            <td class="table4">¥${ticketprice.price['二等座'] }</td>
					            <td class="table4">¥${ticketprice.price['高级软卧'] }</td>
					            <td class="table4">¥${ticketprice.price['软卧'] }</td>
					            <td class="table4">¥${ticketprice.price['动卧'] }</td>
					            <td class="table4">¥${ticketprice.price['硬卧'] }</td>
					            <td class="table4">¥${ticketprice.price['软座'] }</td>
					            <td class="table4">¥${ticketprice.price['硬座'] }</td>
					            <td class="table4">¥${ticketprice.price['无座'] }</td>
			                </tr>
		                </c:forEach>
	                </c:otherwise>
	                </c:choose>
	        	</table>
			</div>
		</div>
	</div>
  </body>

</html>
