<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<title>主页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<c:url value='/css/index.css'/>" rel="stylesheet" type="text/css">
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
		</script>
	</head>
	<body>
		<jsp:include page="top.jsp" flush="true"/>
		<div class="index">
			<div class="title">车票查询</div>
			<div class="content">
				<form action="<c:url value='/trainnum.do'/>" method="post" id="subform">
					<div style="position: relative;">
						<span>出发地</span>
						<input type="text" class="inputbox" name="start" value="${start }" oninput="getCityOrStation(this)" onblur="clearValue(this)" placeholder="简拼/全拼/汉字"/>
					</div>
					<div style="position: relative;">
						<span>目的地</span>
						<input type="text" class="inputbox" name="end" value="${end }" oninput="getCityOrStation(this)" onblur="clearValue(this)" placeholder="简拼/全拼/汉字"/>
					</div>
					<div>
						<span>出发日</span>
						<input type="date" class="inputbox" value="${startdate }" onchange="recover(this)" name="startdate"/>
					</div>
					<div>
						<a class="query" href="javascript:void(0)" onclick="formSubmit()">查&nbsp;&nbsp;&nbsp;询</a>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>