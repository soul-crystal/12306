<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="css/register.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <title>注册界面</title>
        <script>
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
			function addValue()
			{
				var tvalue=document.getElementById("username").value;
				NameAjax(tvalue);
			}
			var xmlHttp;
		    function NameAjax(name)
		    {
		      	xmlHttp=new XMLHttpRequest();
		      	xmlHttp.open("post","CheckName.do?name="+name,true);
		      	xmlHttp.onreadystatechange=callBackName;
		      	xmlHttp.send(null);
		    }
		    function callBackName()
		    {
		      	if(xmlHttp.readyState==4)
		      	{
		      		if(xmlHttp.status==200)
		      		{
		      			var message=xmlHttp.responseText;
		      			document.getElementById("u1").innerHTML=message;
		      		}
		      	}
		    }
			function addPwd()
			{
				var tvalue=document.getElementById("password").value;
				PwdAjax(tvalue);
			}
			function PwdAjax(name)
		    {
		      	xmlHttp=new XMLHttpRequest();
		      	xmlHttp.open("post","CheckPwd.do?name="+name,true);
		      	xmlHttp.onreadystatechange=callBackPwd;
		      	xmlHttp.send(null);
		    }
		    function callBackPwd()
		    {
		      	if(xmlHttp.readyState==4)
		      	{
		      		if(xmlHttp.status==200)
		      		{
		      			var message=xmlHttp.responseText;
		      			document.getElementById("p1").innerHTML=message;
		      		}
		      	}
		    }
			function addPwd2()
			{
				var tvalue=document.getElementById("password2").value;
				var tvalue1=document.getElementById("password").value;
				document.getElementById("p2").innerHTML="";
				if(tvalue!=tvalue1)
				{
					document.getElementById("p2").innerHTML="确认密码与密码不同!";
				}
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
			function checkAll()
			{
				var username=document.getElementById("username").value;
				var u1=document.getElementById("u1").innerHTML;
				if(username==""||(u1.length!=0&&u1.length!=1))
				{
					alert("用户名输入有误!");
					return false;
				}
				var password=document.getElementById("password").value;
				var p1=document.getElementById("p1").innerHTML;
				var password2=document.getElementById("password2").value;
				if(password==""||(p1.length!=0&&p1.length!=1)||password!=password2)
				{
					alert("密码或确认密码输入有误!");
					return false;
				}
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
				var protocol1=document.getElementById("protocol1").checked;
				if(!protocol1)
				{
					alert("请选择同意协议!");
					return false;
				}
				return true;
			}
			function showrule()
			{
				document.getElementById("rule").style.display="block";
			}
			function hiderule()
			{
				document.getElementById("rule").style.display="none";
			}
        </script>
    </head>
    <body>
    	<center>
    	<div id="pagec">
            <jsp:include page="top.jsp" flush="true"/>
            <div id="maintop">
            	您现在的位置:&nbsp;<a href="trainnum.jsp">客运首页</a>&nbsp;>&nbsp;<a href="register.do">注册</a>
            </div>
            <div id="main">
                <div id="maintitle"></div><br/><br/><br/>
                <form action="AddUserAndContact.do" method="post" onsubmit="return checkAll()">
                    <div id="main1">
                    	<table border="0">
                        	<tr>
                            	<td class="td1"><img src="images/register_p3.png">用户名:</td>
                                <td class="td2">
                                	<input type="text" placeholder="用户名设置成功后不可修改" id="username" name="username" onblur="addValue()"/>
                                </td>
                                <td class="td3">6-30位字母、数字或“_”,字母开头</td>
                            </tr>
							<tr>
								<td style="width:100px"></td>
								<td colspan="2" id="u1" style="color:red"></td>
							</tr>
                            <tr>
                            	<td class="td1"><img src="images/register_p3.png">登录密码:</td>
                                <td class="td2"><input type="password" placeholder="6-20位字母,数字或符号" id="password" name="password" onblur="addPwd()"/></td>
                                <td class="td3"></td>
                            </tr>
							<tr>
								<td style="width:100px"></td>
								<td colspan="2" id="p1" style="color:red"></td>
							</tr>
                            <tr>
                            	<td class="td1"><img src="images/register_p3.png">确认密码:</td>
                                <td class="td2"><input type="password" placeholder="再次输入您的登录密码" id="password2" name="password2" onblur="addPwd2()"/></td>
                                <td class="td3"></td>
                            </tr>
							<tr>
								<td style="width:100px"></td>
								<td colspan="2" id="p2" style="color:red"></td>
							</tr>
                            <tr>
                            	<td class="td1"><img src="images/register_p3.png">姓名:</td>
                                <td class="td2"><input type="text" placeholder="请输入姓名" id="rname" name="rname" onblur="addRname()"/></td>
                                <td class="td3" style="position:absolute" onmouseover="showrule()" onmouseout="hiderule()">姓名填写规则
                                	<div id="rule" style="position:relative;display:none;">
                    				<img src="images/register_p4.png"/></div>
                                </td>
                            </tr>
							<tr>
								<td style="width:100px"></td>
								<td colspan="2" id="r1" style="color:red"></td>
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
                    <div id="main3">
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
								<td colspan="2" id="mail1" style="color:red"></td>
							</tr>
                            <tr>
                            	<td class="td1"><img src="images/register_p3.png">手机号码:</td>
                                <td class="td2">
								<input type="text" placeholder="请输入您的手机号码" id="phone" name="phone" onblur="addPhone()"/>
								</td>
                                <td class="td3">请正确填写手机号码，稍后将向该手机号码发送短信验证码</td>
                            </tr>
							<tr>
								<td style="width:100px"></td>
								<td colspan="2" id="phone1" style="color:red"></td>
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
                                <tr>
                                <tr>
                                	<td class="td1"><img src="images/register_p3.png">学校名称:</td>
                                    <td class="td2"><select id="school" name="school">
                                    	<c:forEach var="school" items="${lschool}">
	                                    		<option value="${school.id}">${school.name}</option>
	                                    </c:forEach>
                                    </select></td>
                                    <td class="td3"></td>
                                <tr>
                                <tr>
                                	<td class="td1">院系:</td>
                                    <td class="td2"><input type="text" name="academy"/></td>
                                    <td class="td3"></td>
                                <tr>
                                <tr>
                                	<td class="td1">班级:</td>
                                    <td class="td2"><input type="text" name="classes"/></td>
                                    <td class="td3"></td>
                                <tr>
                                <tr>
                                	<td class="td1"><img src="images/register_p3.png">学号:</td>
                                    <td class="td2"><input type="text" id="studentnum" name="studentnum"/></td>
                                    <td class="td3"></td>
                                <tr>
                                <tr>
                                	<td class="td1"><img src="images/register_p3.png">学制:</td>
                                    <td class="td2"><select id="schoollength" name="schoollength">
                                    	<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option>
                                    	<option>6</option><option>7</option><option>8</option><option>9</option>
                                    </select></td>
                                    <td class="td3"></td>
                                <tr>
                                <tr>
                                	<td class="td1"><img src="images/register_p3.png">入学年份:</td>
                                    <td class="td2"><select id="enterschoolyear" name="enterschoolyear">
                                    	<c:forEach var="year" items="${li}">
                                    		<option>${year}</option>
                                    	</c:forEach>
                                    </select></td>
                                    <td class="td3"></td>
                                <tr>
                                <tr>
                                	<td class="td1">优惠卡号:</td>
                                    <td class="td2"><input type="text" name="discountnum"/></td>
                                    <td class="td3"></td>
                                <tr>
                                <tr>
                                	<td class="td1"><img src="images/register_p3.png">优惠区间:</td>
                                    <td class="td2">
	                                    <select style="width:87px" id="startcity" name="startcity">
	                                    	<c:forEach var="city" items="${lcity}">
	                                    		<option value="${city.id}">${city.name}</option>
	                                    	</c:forEach>
	                                    </select>&nbsp;--
	                                    <select style="width:87px" id="endcity" name="endcity">
	                                    	<c:forEach var="city" items="${lcity}">
	                                    		<option value="${city.id}">${city.name}</option>
	                                    	</c:forEach>
	                                    </select>
                                    </td>
                                    <td class="td3">填写与学生证一致的优惠区间（选择车站所在城市）</td>
                                <tr>
                            </table>
                        </div>
                        <table border="0">
                            <tr>
                            	<td style="width:100px"></td>
                                <td colspan="2" style="width:506px;">
                                <input type="checkbox" style="width:15px;height:15px" id="protocol1" name="protocol1"/>
                                我已阅读并同意遵守<a href="#" style="color:#03F">《中国铁路客户服务中心网站服务条款》</a></td>
                            </tr>
                            <tr><td colspan="3" style="height:30px"></td></tr>
                            <tr>
                            	<td style="width:100px"></td>
                            	<td colspan="3" style="width:506px;">
                                <input type="submit" value="注册" style="width:120px;height:30px;color:#FFF;background-color:#F60;border:0px;">
                                </td>
                            </tr>
                        </table>
                    </div>
                </form><br/><br/><br/>
            </div><br/>
            <div id="footer"><br/><br/>
            <a href="#" style="color:#666">关于我们</a>&nbsp;|&nbsp;<a href="#" style="color:#666">网站声明</a><br/>
            版权所有&nbsp;©&nbsp;2008-2017&nbsp;中国铁路信息技术中心&nbsp;中国铁道科学研究院<br/>
            京ICP备15003716号-3&nbsp;|&nbsp;京ICP证150437号
            </div>
        </div>
        </center>
    </body>
</html>