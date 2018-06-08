<%@ page import="cn.bean.Agency"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/agency.css" />
		<script src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/provincesData.js"></script>
		<script type="text/javascript" src="js/jquery.provincesCity.js"></script>

		<script>
			$(function() {
				$().ProvinceCity()
			});
		</script>

	</head>

	<body>
		<jsp:include page="top.jsp" flush="true"/>
		<div id="middle">
			<div class="chaxun">
				<form action="SearchAgency.do" method="post" id="form">
					<div class="btn-area">
						<a class="btn122s" href="javascript:$('#form').submit()">查询</a>
					</div>
					<ul>
						<li><span class="label"><b class="colorA">*</b>所在地区</span>
							<div class="inp-w">
								<select name="province" id="province">
									<option value="" selected="selected">请选择省</option>
								</select>
							</div>
							<span class="fg-line">--</span>
							<div class="inp-w">
								<select name="city" id="city">
									<option value="" selected="selected">请选择市</option>
								</select>
							</div>
							<span class="fg-line">--</span>
							<div class="inp-w">

								<input type="hidden" name="123" value="番禺区">
								<select name="district" id="district">
									<option value="" selected="selected">请选择区/县</option>
								</select>

							</div>
						</li>
					</ul>
				</form>
			</div>

			<div class="tips">
				<c:if test="${district!=null}">
				<p>
					<strong class="colorA">${district}</strong> &nbsp;共有&nbsp;
					<strong class="colorA">${num}</strong> &nbsp;个代售点
				</p>
				</c:if>
			</div>

			<div class="t-list agencySellTicket">
				<table>
					<tbody>
						<tr class="th" id="float">
							<th width="95" rowspan="1" colspan="1">序号</th>
							<th width="300" rowspan="1" colspan="1">代售点名称</th>
							<th width="300" rowspan="1" colspan="1">地址</th>
							<th width="130" rowspan="1" colspan="1">营业时间</th>
							<th class="last" width="130" rowspan="1" colspan="1">窗口数量</th>
						</tr>
					</tbody >
					<tbody id="data">
						<c:forEach items="${list}" var="li" step="1">
							<tr>
								<td align="center">${li.id}</td>
								<td class="t1" align="center">${li.name}</td>
								<td class="t1" align="center">${li.address}</td>
								<td align="center">${li.starttime}--${li.endtime}</td>
								<td align="center">${li.windownum}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="footer">
			<p>
				<a href="http://www.12306.cn/mormhweb/gljd/gywm" target="true">关于我们</a>
				|
				<a href="http://www.12306.cn/mormhweb/gljd/wzls/" target="true">网站声明</a>
			</p>
			<p>版权所有 © 2008-2017 中国铁路信息技术中心 中国铁道科学研究院</p>
			<p>京ICP备15003716号-3&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证150437号</p>
		</div>

	</body>

</html>