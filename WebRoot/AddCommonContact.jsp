<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加常用联系人</title>
    <link rel="stylesheet" type="text/css" href="css/AddCommonContact.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
	    	$(function(){
	            $("select[name=province]").change(function(){
	                $.ajax({
	                    type:"post",
	                    url:"SelectSchoolByPid.do",
	                    data:{provinceid:$(this).val()},
	                    success:function(data){
	                         var text=eval(data);
	                         $("select[name=school]").empty();
	                         for(var i=0;i<text.length;i++){
	                              var option="<option value='"+text[i].schoolid+"'>"+text[i].schoolname+"</option>";
	                              $("select[name=school]").append(option);
	                         } 
	                    }
	                });
	            });
	        })
			function checkAll()
			{
				var rname=document.getElementById("rname").value;
				var r1=document.getElementById("r1").innerHTML;
				if(rname==""||(r1.length!=0&&r1.length!=1))
				{
					alert("姓名输入有误!");
					return false;
				}
				var cardnum=document.getElementById("cardnum").value;
				var cn=document.getElementById("cn").innerHTML;
				if(cardnum==""||(cn.length!=0&&cn.length!=1))
				{
					alert("证件号码输入有误!");
					return false;
				}
				var mail1=document.getElementById("mail1").innerHTML;
				if(mail1.length!=0&&mail1.length!=1)
				{
					alert("邮箱输入有误!");
					return false;
				}
				var phone=document.getElementById("phone").value;
				var phone1=document.getElementById("phone1").innerHTML;
				if(phone==""||(phone1.length!=0&&phone1.length!=1))
				{
					alert("手机号码输入有误!");
					return false;
				}
				var touristtype=document.getElementById("touristtype").value;
				if(touristtype=="学生")
				{
					var studentnum=document.getElementById("studentnum").value;
					if(studentnum=="")
					{
						alert("请输入学号!");
						return false;
					}
				}
				return true;
			}
			function addRname()
			{
				var tvalue=document.getElementById("rname").value;
				if(tvalue=="")
				{
					document.getElementById("r1").innerHTML="请输入姓名!";
				}
				else if(tvalue.length<3)
				{
					document.getElementById("r1").innerHTML="允许输入的字符串在3-30个字符之间!";
				}
				else
				{
					document.getElementById("r1").innerHTML="";
				}
			}
			function changeIDType(num)
			{
				if(num==0)
				{
					document.getElementById("main21").style.display="none";
					document.getElementById("main22").style.display="none";
				}
				else if(num==3)
				{
					document.getElementById("main21").style.display="block";
					document.getElementById("main22").style.display="block";
				}
				else
				{
					document.getElementById("main21").style.display="block";
					document.getElementById("main22").style.display="none";
				}
			}
			function addCnum()
			{
				var tvalue=document.getElementById("cardnum").value;
				CnumAjax(tvalue);
			}
			function CnumAjax(name)
		    {
				var num=document.getElementById("idtype").value;
		      	xmlHttp=new XMLHttpRequest();
		      	xmlHttp.open("post","CheckCnum.do?name="+name+"&num="+num,true);
		      	xmlHttp.onreadystatechange=callBackCnum;
		      	xmlHttp.send(null);
		    }
		    function callBackCnum()
		    {
		      	if(xmlHttp.readyState==4)
		      	{
		      		if(xmlHttp.status==200)
		      		{
		      			var message=xmlHttp.responseText;
		      			document.getElementById("cn").innerHTML=message;
		      		}
		      	}
		    }
			function addMail()
			{
				var tvalue=document.getElementById("mail").value;
				MailAjax(tvalue);
			}
			function MailAjax(name)
		    {
		      	xmlHttp=new XMLHttpRequest();
		      	xmlHttp.open("post","CheckMail.do?name="+name,true);
		      	xmlHttp.onreadystatechange=callBackMail;
		      	xmlHttp.send(null);
		    }
		    function callBackMail()
		    {
		      	if(xmlHttp.readyState==4)
		      	{
		      		if(xmlHttp.status==200)
		      		{
		      			var message=xmlHttp.responseText;
		      			document.getElementById("mail1").innerHTML=message;
		      		}
		      	}
		    }
			function addPhone()
			{
				var tvalue=document.getElementById("phone").value;
				PhoneAjax(tvalue);
			}
			function PhoneAjax(name)
		    {
		      	xmlHttp=new XMLHttpRequest();
		      	xmlHttp.open("post","CheckPhone.do?name="+name,true);
		      	xmlHttp.onreadystatechange=callBackPhone;
		      	xmlHttp.send(null);
		    }
		    function callBackPhone()
		    {
		      	if(xmlHttp.readyState==4)
		      	{
		      		if(xmlHttp.status==200)
		      		{
		      			var message=xmlHttp.responseText;
		      			document.getElementById("phone1").innerHTML=message;
		      		}
		      	}
		    }
			function changeTourType(num)
			{
				if(num==2)
				{
					document.getElementById("main31").style.display="block";
				}
				else
				{
					document.getElementById("main31").style.display="none";
				}
			}
			function showrule()
			{
				document.getElementById("rule").style.display="block";
			}
			function hiderule()
			{
				document.getElementById("rule").style.display="none";
			}
			function cancelAddContact()
			{
				location.href="CommonContact.jsp";
			}
    	</script>
  </head>
  	<body>
  	<div id="layout">
  	<center>
  		<div id="sum">
			<div id="head">
				<iframe width="100%" height="66px" frameborder="0" scrolling="no" src="top.jsp"></iframe>
			</div>
			<form action="AddContact.do?username=${sessionScope.user.username}" method="post" onsubmit="return checkAll()">
			<div id="center">
				<div id="c-one">
					您现在的位置：<a href="trainnum.jsp">客运首页</a> > 我的12306
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
						<div id="ctr">添加常用联系人</div>
							<div id="ctr1">
								<div id="ctr1-1"><br/>
									<div id="ctr1-1-1">基本信息</div>
									<div id="ctr1-1-2">（*为必填项）</div>
									<div id="ctr1-1-3">----------------------------------------------------------------------------------------------------------------<br/><br/></div>
								</div>
								<div>
									<table border="0">
			                            <tr>
			                            	<td class="td1"><img src="images/register_p3.png">姓名:</td>
			                                <td class="td2"><input type="text" placeholder="请输入姓名" id="rname" name="rname" onblur="addRname()"/></td>
			                                <td class="td3" style="position:absolute;line-height:25px;" onmouseover="showrule()" onmouseout="hiderule()">姓名填写规则
                                				<div id="rule" style="position:relative;display:none;">
                    							<img src="images/register_p4.png"/></div>
                                			</td>
			                            </tr>
										<tr>
											<td style="width:100px"></td>
											<td colspan="2" id="r1" style="color:red;font-size:12px;"></td>
										</tr>
			                            <tr>
			                            	<td class="td1"><img src="images/register_p3.png">证件类型:</td>
			                                <td class="td2"><select id="idtype" name="idtype" onchange="changeIDType(this.options.selectedIndex)">
			                                	<option value="1">二代身份证</option>
			                                    <option value="2">港澳通行证</option>
			                                    <option value="3">台湾通行证</option>
			                                    <option value="4">护照</option>
			                                </select></td>
			                                <td class="td3"></td>
			                            </tr>
			                            <tr>
			                            	<td class="td1"><img src="images/register_p3.png">证件号码:</td>
			                                <td class="td2">
											<input type="text" placeholder="请输入您的证件号码" id="cardnum" name="cardnum" onblur="addCnum()"/>
											</td>
			                                <td class="td3" id="cn" style="color:red"></td>
			                            </tr>
			                    	</table>
			                    </div>
			                    <div id="main2">
			                    	<div id="main21" style="display:none">
			                        	<table border="0">
			                            	<tr>
			                                    <td class="td1"><img src="images/register_p3.png">性别:</td>
			                                    <td class="td2">
			                                    <input type="radio" name="sex" value="男" style="width:12px;height=12px" checked="true"/>男
			                                    <input type="radio" name="sex" value="女" style="width:12px;height=12px"/>女
			                                    </td>
			                                    <td class="td3"></td>
			                            	</tr>
			                                <tr>
			                                    <td class="td1"><img src="images/register_p3.png">出生日期:</td>
			                                    <td class="td2"><input type="date" id="birth" name="birth"/></td>
			                                    <td class="td3"></td>
			                            	</tr>
			                            </table>
			                        </div>
			                        <div id="main22" style="display:none">
			                        	<table border="0">
			                            	<tr>
			                                	<td class="td1"><img src="images/register_p3.png">国家/地区:</td>
			                                    <td class="td2">
			                                    <select id="country" name="country" style="width:202px">
			                                    	<c:forEach var="country" items="${lcountry}">
			                                    		<option value="${country.id}">${country.name}</option>
			                                    	</c:forEach>
			                                    </select></td>
			                                    <td class="td3"></td>
			                                </tr>
			                            </table>
			                        </div>
			                    </div>
							</div>
							<div id="ctr2">
								<div id="ctr2-1">
									<div id="ctr2-1-1">联系方式</div>
									<div id="ctr2-1-2">--------------------------------------------------------------------------------------------------------------------------------<br/><br/></div>
								</div>
								<table border="0">
			                        <tr>
			                            <td class="td1">邮箱:</td>
			                            <td class="td2">
										<input type="text" placeholder="请正确填写邮箱地址" id="mail" name="mail" onblur="addMail()"/>
										</td>
			                            <td class="td3"></td>
			                        </tr>
									<tr>
										<td style="width:100px"></td>
										<td colspan="2" id="mail1" style="color:red;font-size:12px;"></td>
									</tr>
			                        <tr>
			                            <td class="td1"><img src="images/register_p3.png">手机号码:</td>
			                            <td class="td2">
										<input type="text" placeholder="请输入您的手机号码" id="phone" name="phone" onblur="addPhone()"/>
										</td>
			                            <td class="td3"></td>
			                        </tr>
									<tr>
										<td style="width:100px"></td>
										<td colspan="2" id="phone1" style="color:red;font-size:12px;"></td>
									</tr>
			                        <tr>
			                            <td class="td1"><img src="images/register_p3.png">旅客类型:</td>
			                            <td class="td2"><select id="touristtype" name="touristtype" onchange="changeTourType(this.options.selectedIndex)">
			                                <option>成人</option><option>儿童</option><option>学生</option>
			                                <option>残疾军人,伤残人民警察</option>
			                            </select></td>
			                            <td class="td3"></td>
			                        </tr>
			                	</table>
							</div>
							<div id="ctr3">
								<div id="ctr3-1">
									<div id="ctr3-1-1">附加信息</div>
									<div id="ctr3-1-2">--------------------------------------------------------------------------------------------------------------------------------<br/><br/></div>
								</div>
								<div id="main31" style="display:none">
			                        <table border="0">
			                            <tr>
			                                <td class="td1"><img src="images/register_p3.png">学校所在省份:</td>
			                                <td class="td2"><select id="province" name="province">
			                                	<c:forEach var="province" items="${lprovince}">
			                                    	<option value="${province.id}">${province.name}</option>
			                                    	</c:forEach>
			                            	</select></td>
			                                <td class="td3"></td>
			                            </tr>
			                            <tr>
			                                <td class="td1"><img src="images/register_p3.png">学校名称:</td>
			                                <td class="td2"><select id="school" name="school">
			                                    <c:forEach var="school" items="${lschool}">
				                                    <option value="${school.id}">${school.name}</option>
				                                </c:forEach>
			                                </select></td>
			                                <td class="td3"></td>
			                            </tr>
			                            <tr>
			                                <td class="td1">院系:</td>
			                                <td class="td2"><input type="text" name="academy"/></td>
			                                <td class="td3"></td>
			                            </tr>
			                            <tr>
			                            	<td class="td1">班级:</td>
			                            	<td class="td2"><input type="text" name="classes"/></td>
			                            	<td class="td3"></td>
			                            </tr>
			                            <tr>
			                            	<td class="td1"><img src="images/register_p3.png">学号:</td>
			                            	<td class="td2"><input type="text" id="studentnum" name="studentnum"/></td>
			                            	<td class="td3"></td>
			                            </tr>
			                            <tr>
			                            	<td class="td1"><img src="images/register_p3.png">学制:</td>
			                            	<td class="td2"><select id="schoollength" name="schoollength">
			                                	<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option>
			                                	<option>6</option><option>7</option><option>8</option><option>9</option>
			                                </select></td>
			                                <td class="td3"></td>
			                            </tr>
			                            <tr>
			                                <td class="td1"><img src="images/register_p3.png">入学年份:</td>
			                                    <td class="td2"><select id="enterschoolyear" name="enterschoolyear">
			                                    	<c:forEach var="year" items="${li}">
			                                    		<option>${year}</option>
			                                    	</c:forEach>
			                                    </select></td>
			                            	<td class="td3"></td>
			                            </tr>
			                            <tr>
			                                <td class="td1">优惠卡号:</td>
			                                <td class="td2"><input type="text" name="discountnum"/></td>
			                            	<td class="td3"></td>
			                            </tr>
			                            <tr>
			                                <td class="td1"><img src="images/register_p3.png">优惠区间:</td>
			                                    <td class="td2">
				                                    <select style="width:87px" id="startcity" name="startcity">
				                                    	<c:forEach var="city" items="${lcity}">
				                                    		<option value="${city.id}">${city.name}</option>
				                                    	</c:forEach>
				                                    </select>--
				                                    <select style="width:87px" id="endcity" name="endcity">
				                                    	<c:forEach var="city" items="${lcity}">
				                                    		<option value="${city.id}">${city.name}</option>
				                                    	</c:forEach>
				                                    </select>
			                                    </td>
			                            	<td class="td3"></td>
			                            </tr>
			                        </table>
			                    </div>
			                    <table border="0">
			                    	<tr><td colspan="3" style="height:30px"></td></tr>
			                        <tr>
			                            <td style="width:100px"></td>
			                            <td colspan="3" style="width:506px;">
			                            &nbsp;&nbsp;&nbsp;<input type="submit" value="保存" style="width:120px;height:30px;color:#FFF;background-color:#F60;border:0px;">
			                            &nbsp;&nbsp;<input type="reset" value="取消" style="width:120px;height:30px;border:0px;">
			                            </td>
			                        </tr>
			                    </table>
							</div><br/><br/>
						</div>    
					</div>
				</div>
			</form>
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
