<%@page import="cn.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>订购</title>
<link rel="stylesheet" type="text/css" href="css/yd.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
			var line = 1;
			var list = ${contact};
			$(function() {

				for(var i in list) {
					$("#pers").append("<li><input type='checkbox' id='"+i+"' name='cheb"+i+"' onchange='javascript:changebox(" + i + ")'/>" + list[i].name);
				}
			});

			function changebox(i) {
				var num = $("#data").find("tr").size();
				var selete = $("#" + i).prop("checked");
				if(selete) {
					if(num == 1 && $("#name0").val() == "") {
						$("#name0").val(list[i].name);
						$("#idcode0").val(list[i].idcard);
						$("#phone0").val(list[i].phone);
						$("#type0").val(list[i].touristid);
						$("#idtype0").val(list[i].idtypeid);

					} else {
						var yuju="<tr id='ticketinfo'><td align='center'>"+(line+1)+"</td><td><select id='seattype' name='seattype"+line+"'><c:forEach items='${seatprice}' var='seat'><option value='${seat.key}'>${seat.key}￥${seat.value}</option></c:forEach></select></td><td><select id='type"+line+"' name='touristtype"+line+"' ><option value='1'>成人</option><option value='3'>学生</option></select></td><td><input class='inptxt' type='text' id='name"+line+"' name='name"+line+"'class='name'  style='color: #999999;' /></td><td><select id='idtype'"+line+" name='idtype"+line+"' class='idtype'><option value='1'>二代身份证</option><option value='3'>台湾通行证</option><option value='4'>护照</option><option value='2'>港澳通行证</option></select></td><td><input class='inptxt' type='text' width='160px' id='idcode"+line+"' name='idcard"+line+"' value=''  /></td><td><input type='text' width='105px' class='inptxt phone'id='phone"+line+"' name='phone"+line+"' value=''  /></td><td title='删除'><span id='delete' onclick='delinfo("+line+")'></span></td></tr>";
						$("#data").append(yuju);
						$("#name"+line).val(list[i].name);
						$("#idcode"+line).val(list[i].idcard);
						$("#phone"+line).val(list[i].phone);
						$("#type"+line).val(list[i].touristid);
						$("#idtype"+line).val(list[i].idtypeid);
						line++;
					}
				} else {
					if(num == 1) {
						$("#name0").val("");
						$("#idcode0").val("");
						$("#phone0").val("");
					} else {
						drop(list[i].name,num);
					}
				}
			}

			function drop(i,num) {
				for(var t = 0; t < num; t++) 
				{
					if($("#name" + t).val() == i) {
						for(var m = t; m < num; m++) {
							if(m == (num - 1)) {
								$("#name" + m).parent().parent().remove();
								line--;
							} else {
								$("#name" + m).val($("#name" + (m + 1)).val());
								$("#idcode" + m).val($("#idcode" + (m + 1)).val());
								$("#phone" + m).val($("#phone" + (m + 1)).val());
								$("#type" + m).val($("#type" + (m + 1)).val());
								$("#idtype" + m).val($("#idtype" + (m + 1)).val());
							}
						}
					}
				}
				
			}

			function delinfo(a) {
				var num = $("#data").find("tr").size();
				var c = $("#name"+a).val();
				for(var i in list) {
					if(list[i].name == c) {
						$("#"+i).prop("checked", false);
					}
				}
				if(num == 1) {
					$("#name0").val("");
					$("#idcode0").val("");
					$("#phone0").val("");
				} else {
					drop(c,num);
				}
			}

			function tijiao() {
				
					if($("#name0").val()!="")
					{
					<%User u=(User)request.getSession().getAttribute("user");%>
					var password=<%=u.getPassword()%>
					for(var i=0;i<3;i++)
					{
					var passwor=promot("请输入密码(类比简陋交易后台)","");
					if(passwor==password)
					{$("#form").submit();
					break;
					}else
					{
					alert("输入错误")
					}
					}
				}
				else {
				alert("请确认购买人噢");
				}

			}
		</script>

</head>

<body>
	<jsp:include page="top.jsp" flush="true" />
	<div id="middle">
		<div class="layout">
			<div class="lay-hd">列车信息（以下余票信息仅供参考)</div>
			<div class="lay-bd">

				<p class="mr5" style="font-size:12px;">
					&nbsp;列车日期${date}&nbsp;列车班次${train}<br />&nbsp;始发站${startstation}&nbsp;
					${seat.starttime} &nbsp;--终点站${endstation}&nbsp; ${seat.endtime}
				</p>
				<p>
					<c:forEach items="${seatprice}" var="s">
							&nbsp;${s.key}￥${s.value} &nbsp;&nbsp;${seat.ticketnum["(${s.key})"]}&nbsp;
						</c:forEach>
				</p>
			</div>
		</div>
		<div class="layout person">
			<div class="lay-hd">乘客信息（填写说明)</div>
			<div class="lay-bd">
				<div class="per">
					<ul id="pers">

					</ul>
				</div>
			<form action="Submit.do" method="post" id="form">
				<table align="center" class="per-ticked">
					<thead>
						<tr style="background: #EEF1F8;">
							<th width="28" rowspan="1" colspan="1">序号</th>
							<th rowspan="1" colspan="1">车票类型</th>
							<th rowspan="1" colspan="1">身份</th>
							<th rowspan="1" colspan="1">姓名</th>
							<th rowspan="1" colspan="1">证件类型</th>
							<th rowspan="1" colspan="1">证件号</th>
							<th rowspan="1" colspan="1">手机号码</th>
							<th width="70" rowspan="1" colspan="1"><input type="hidden"
								name="trainname" value="${train}" /> <input type="hidden"
								name="startstation" value="${startstation}" /> <input
								type="hidden" name="endstation" value="${endstation}" /></th>
							<th width="30" rowspan="1" colspan="1"><c:forEach
									items="${seatprice}" var="seat">
									<input type="hidden" name="${seat.key}" value="${seat.value}" />
									<input type="hidden" name="date" value="${date}" />
								</c:forEach></th>
						</tr>
					</thead>
					
					<tbody id="data">
						<tr id="ticketinfo">
							<td align="center">1</td>
							<td><select id="seattype" name="seattype0">
									<c:forEach items="${seatprice}" var="seat">
										<option value="${seat.key}">
													${seat.key}￥${seat.value}
												</option>
									</c:forEach>
							</select></td>
							<td><select id="type0" name="touristtype0"
								>
									<option value="1" selected="selected">成人</option>
									<option value="3">学生</option>
							</select></td>
							<td><input type="text" class="inptxt" id="name0" name="name0"
								class="name"  style="color: #999999;"
								value="" /></td>
							<td><select id="idtype0" name="idtype0" class="idtype"
							>
									<option value="1" selected="selected">二代身份证</option>
									<option value="3">台湾通行证</option>
									<option value="4">护照</option>
									<option value="2">港澳通行证</option>
							</select></td>
							<td><input type="text" class="inptxt" width="160px" id="idcode0"
								name="idcard0" value=""  /></td>
							<td><input type="text" width="105px" class="inptxt phone"
								id="phone0" name="phone0" value=""  /></td>
							<td title="删除"><span id="delete" onclick="delinfo(0)">
							</span> </td>
							</tr>
						</tbody>
						
					</table>
				</form>
			</div>
		</div>
		<div class="lay-btn">
			<a id="prestep" href="#" class="btn122s" shape="rect"
				style="border: 1px solid #ccc">上一步</a> <a id="submit"
				href="javascript:void(0)" class="btn122s" shape="rect"
				onclick="tijiao()">提交</a>
		</div>
		<div class="tips-txt">
			<h2>温馨提示：</h2>
			<p>1. 一张有效身份证件同一乘车日期同一车次只能购买一张车票，高铁动卧列车除外。</p>
			<p>2.
				购票时可使用的有效身份证件包括：中华人民共和国居民身份证、港澳居民来往内地通行证、台湾居民来往大陆通行证和按规定可使用的有效护照。</p>
			<p>3.
				购买儿童票时，乘车儿童有有效身份证件的，请填
				</tr>
			。乘车儿童没有有效身份证件的，应使用同行成年人的有效身份证件信息；购票时不受第一条限制，但购票后、开车前须办理换票手续方可进站乘车。</p>
			<p>
				4. 购买学生票时，须在 我的常用联系人</a>
				中登记乘车人的学生详细信息。学生票乘车时间限为每年的暑假6月1日至9月30日、寒假12月1日至3月31日。购票后、开车前，须办理换票手续方可进站乘车。换票时，新生凭录取通知书，毕业生凭学校书面证明，其他凭学生优惠卡。

			</p>
			<p>5.
				购买残疾军人（伤残警察）优待票的，须在购票后、开车前办理换票手续方可进站乘车。换票时，不符合规定的减价优待条件，没有有效"中华人民共和国残疾军人证"或"中华人民共和国伤残人民警察证"的，不予换票，所购车票按规定办理退票手续。
			</p>
			<p>
				<strong>6.购买铁路乘意险的注册用户年龄须在18周岁以上，使用非二代居民身份证注册的用户如购买铁路乘意险，须在
					我的12306——个人信息 如实填写“出生日期”。 </strong>
			</p>
			<p>
				<strong>7.父母为未成年子女投保，须在我的常用联系人 登记未成年子女的有效身份证件信息。 </strong>
			</p>
		</div>

	</div>
	<div class="footer">
		<p>
			<a href="http://www.12306.cn/mormhweb/gljd/gywm" target="true">关于我们</a>
			| <a href="http://www.12306.cn/mormhweb/gljd/wzls/" target="true">网站声明</a>
		</p>
		<p>版权所有 © 2008-2017 中国铁路信息技术中心 中国铁道科学研究院</p>
		<p>京ICP备15003716号-3&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证150437号</p>
	</div>

</body>

</html>