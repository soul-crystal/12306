<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>车票预定</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    	
	<link href="<c:url value='/css/trainnum_style.css'/>" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<c:url value='/js/ajaxutils.js'/>"></script>
	<script type="text/javascript">
		function formSubmit()
		{
			var start=document.getElementsByName("start")[0];
			var end=document.getElementsByName("end")[0];
			var startdate=document.getElementsByName("startdate")[0];
			if(start.value!="" && start.value.replace(/^\s+|\s+$/g, '')!=""
				&& end.value!="" && end.value.replace(/^\s+|\s+$/g, '')!=""
				&& startdate.value!="")
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
				if(startdate.value=="")
				{
					startdate.style.border="1px solid red";
				}
			}
		}
		function recover(obj)
		{
			obj.style.border="1px solid rgba(169,169,169,1.00)";
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
		var tableNode;
		function getStops(obj,trainnumid)
		{
			if(tableNode!=null)
			{
				tableNode.parentNode.removeChild(tableNode);
				tableNode=null;
			}
			var oParentNode=obj.parentNode;
			ajax(
				{
					url:"<c:url value='/stops.do'/>",
					method:"POST",
					params:"trainnumid="+trainnumid,
					type:"json",
					callback:function(data)
					{
						var startstation,endstation;
						var oDivNode=document.createElement("div");
						tableNode=oDivNode;
						oParentNode.appendChild(oDivNode);
						oDivNode.className="stops";
						var oTableNode=document.createElement("table");
						oDivNode.appendChild(oTableNode);
						oTableNode.className="stopstable";
						var oTrTopNode=oTableNode.insertRow();
						oTrTopNode.className="stopstrtop";
						var oTdTopNode=oTrTopNode.insertCell();
						oTdTopNode.className="table5";
						oTdTopNode.innerHTML="站序";
						oTdTopNode=oTrTopNode.insertCell();
						oTdTopNode.className="table5";
						oTdTopNode.innerHTML="站名";
						oTdTopNode=oTrTopNode.insertCell();
						oTdTopNode.className="table5";
						oTdTopNode.innerHTML="到站时间";
						oTdTopNode=oTrTopNode.insertCell();
						oTdTopNode.className="table5";
						oTdTopNode.innerHTML="出发时间";
						oTdTopNode=oTrTopNode.insertCell();
						oTdTopNode.className="table5";
						oTdTopNode.innerHTML="停留时间";
						oTdTopNode=oTrTopNode.insertCell();
						var oANode=document.createElement("a");
						oTdTopNode.appendChild(oANode);
						oANode.className="close";
						oANode.href="javascript:void(0)";
						oANode.onclick=function()
						{
							oDivNode.parentNode.removeChild(tableNode);
							tableNode=null;
						}
						for(var x=1;x<=data.length;x++)
						{
							var oTrNode=oTableNode.insertRow();
							oTrNode.className="stopstr";
							var oTdNode=oTrNode.insertCell();
							oTdNode.className="table6";
							oTdNode.innerHTML=x;
							for(var y=0;y<data.length;y++)
							{
								if(data[y].position==x)
								{
									if(x==1)
									{
										startstation=data[y].station;
									}
									if(x==data.length)
									{
										endstation=data[y].station;
									}
									oTdNode=oTrNode.insertCell();
									oTdNode.className="table6";
									oTdNode.innerHTML=data[y].station;
									oTdNode=oTrNode.insertCell();
									oTdNode.className="table6";
									if(data[y].arrivetime!="")
									{
										oTdNode.innerHTML=data[y].arrivetime;
									}
									else
									{
										oTdNode.innerHTML="----";
									}
									oTdNode=oTrNode.insertCell();
									oTdNode.className="table6";
									if(data[y].leavetime!="")
									{
										oTdNode.innerHTML=data[y].leavetime;
									}
									else
									{
										oTdNode.innerHTML="----";
									}
									oTdNode=oTrNode.insertCell();
									oTdNode.className="table6";
									if(data[y].staytime!="")
									{
										oTdNode.innerHTML=data[y].staytime;
									}
									else
									{
										oTdNode.innerHTML="----";
									}
								}
							}
							oTdNode=oTrNode.insertCell();
							oTdNode.style.width="20px";
						}
						var oTrBottomNode=oTableNode.insertRow();
						oTrBottomNode.className="stopstr";
						var oTdBottomNode=oTrBottomNode.insertCell();
						oTdBottomNode.className="table7";
						oTdBottomNode.style.fontWeight="bold";
						oTdBottomNode.innerHTML=obj.innerHTML+"次";
						oTdBottomNode=oTrBottomNode.insertCell();
						oTdBottomNode.className="table7";
						oTdBottomNode.colSpan="4";
						oTdBottomNode.innerHTML=startstation+"-->"+endstation;
						oTdBottomNode=oTrBottomNode.insertCell();
						oTdBottomNode.style.width="20px";
						oTdBottomNode.style.borderTop="thin solid rgba(99,199,231,1.00)";
					}
				}
			);
		}
	</script>
  </head>

  <body>
	<div id="layout">
		<jsp:include page="top.jsp" flush="true"/>
		<div id="main">
			<div id="m_up">
				<form action="<c:url value='/trainnum.do'/>" method="post" id="subform">
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
							<span>出发日</span>
							<input type="date" class="inputbox" value="${startdate }" onchange="recover(this)" name="startdate"/>
						</li>
						<li>
							<a class="query" href="javascript:void(0)" onclick="formSubmit()">查询</a>
						</li>
					</ul>
				</form>
			</div>
			<div id="m_middle">
				<ul>
					<li><b>车次类型：</b></li>
					<li style="width: 35px;"><a class="all" style="color: white;" href="">全部</a></li>
					<li><input type="checkbox" name="traintype"/>D-动车</li>
					<li><input type="checkbox" name="traintype"/>Z-直达</li>
					<li><input type="checkbox" name="traintype"/>T-特快</li>
					<li><input type="checkbox" name="traintype"/>K-快速</li>
					<li style="width: 120px;"><input type="checkbox" name="traintype"/>GC-高铁/城际</li>
					<li><input type="checkbox" name="traintype"/>其他</li>
					<li style="width: 260px; text-align: right;">
						发车时间：<select>
							<option class="optionbox">00:00--24:00</option>
							<option class="optionbox">00:00--06:00</option>
							<option class="optionbox">06:00--12:00</option>
							<option class="optionbox">12:00--18:00</option>
							<option class="optionbox">18:00--24:00</option>
						</select>
					</li>
				</ul> 
				<ul>
					<li><b>出发车站：</b></li>
					<li style="width: 35px;"><a class="all" href="">全部</a></li>
					<li><input type="checkbox" name="startstation"/>广州南</li>
					<li><input type="checkbox" name="startstation"/>广州东</li>
				</ul>
			</div>
			<div id="m_bottom">
				<div id="show">
					<c:if test="${trainnumList!=null }">
						<span><b>${start }-->${end }（<fmt:formatDate pattern="M月d日 E" value="${date }"/>）</b>共计<b>${fn:length(trainnumList) }</b>个车次</span>
					</c:if>
					<span style="float:right"><input type="checkbox" name="traintype"/>显示全部可预订车次</span>
				</div>
                <div id="result">
                	<table cellspacing="0px">
                    	<tr height="50px" style="background-color:rgba(37,136,202,1.00)">
                        	<td class="table1">车次</td>
                            <td class="table1">
                            	出发站<br/>
                            	到达站
                            </td>
                            <td class="table1">
                            	<a class="b2" href="javascript:void(0)" style="color:white">出发时间</a><br/>
                                <a class="b2" href="javascript:void(0)" style="color:white">到达时间</a>
                            </td>
                            <td class="table1">
                            	<a class="b2" href="javascript:void(0)" style="color:white">历时</a>
                            </td>
                            <td class="table2">
                            	商务座<br/>
                            	特等座
                            </td>
                            <td class="table2">一等座</td>
                            <td class="table2">二等座</td>
                            <td class="table2">
                            	高级<br/>
                            	软卧
                            </td>
                            <td class="table2">软卧</td>
                            <td class="table2">动卧</td>
                            <td class="table2">硬卧</td>
                            <td class="table2">软座</td>
                            <td class="table2">硬座</td>
                            <td class="table2">无座</td>
                            <td class="table2">其他</td>
                            <td class="table1" style="border-style: none;">备注</td>
                        </tr>
                        <c:forEach items="${trainnumList }" var="trainnum">
	                        <tr height="50px" style="background-color:white">
	                        	<td class="table3">
	                            	<a href="javascript:void(0)" onclick="getStops(this,${trainnum.id})" title="点击查看停靠站信息">${trainnum.name }</a>
	                            </td>
	                            <td class="table3">
	                            	${trainnum.startstation }<br/>
	                            	${trainnum.endstation }
	                            </td>
	                            <td class="table3">
	                            	<fmt:formatDate pattern="HH:mm" value="${trainnum.starttime }"/><br/>
	                            	<fmt:formatDate pattern="HH:mm" value="${trainnum.endtime }"/>
	                            </td>
	                            <td class="table3">${trainnum.passtime }</td>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['商务座特等座']!=null }">
                            			<td class="table4">${trainnum.ticketnum['商务座特等座'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['一等座']!=null }">
                            			<td class="table4">${trainnum.ticketnum['一等座'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['二等座']!=null }">
                            			<td class="table4">${trainnum.ticketnum['二等座'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['高级软卧']!=null }">
                            			<td class="table4">${trainnum.ticketnum['高级软卧'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['软卧']!=null }">
                            			<td class="table4">${trainnum.ticketnum['软卧'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['动卧']!=null }">
                            			<td class="table4">${trainnum.ticketnum['动卧'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['硬卧']!=null }">
                            			<td class="table4">${trainnum.ticketnum['硬卧'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['软座']!=null }">
                            			<td class="table4">${trainnum.ticketnum['软座'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['硬座']!=null }">
                            			<td class="table4">${trainnum.ticketnum['硬座'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <c:choose>
                            		<c:when test="${trainnum.ticketnum['无座']!=null }">
                            			<td class="table4">${trainnum.ticketnum['无座'] }</td>
                            		</c:when>
                            		<c:otherwise>
                            			<td class="table4">--</td>
                            		</c:otherwise>
	                            </c:choose>
	                            <td class="table4">--</td>
	                            <td class="table3">
	                            	<c:choose>
	                            		<c:when test="${trainnum.reserve }">
	                            			<a class="reserve" href="book.do?id=${trainnum.id }&startstation=${trainnum.startstation }&endstation=${trainnum.endstation }">预定</a>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<div>预定</div>
	                            		</c:otherwise>
	                            	</c:choose>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>
                </div>
			</div>
		</div>
	</div>
  </body>

</html>
