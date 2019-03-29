<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>所有用户管理</title>
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css"  media="all">
<script language="javascript">
	function UserAdd(){
	window.navigate("UserInfo_Add.html");
	}
</script>
<script>
function selectAllNullorReserve(obj,type){
   if(obj!=null&&obj!=""){
    if(document.getElementsByName(obj)!=undefined&&document.getElementsByName(obj).length>0){	//getElementsByName函数的作用按名字查找对象，返回一个数组。
     var userids = document.getElementsByName(obj);
     if(type=="全选"){
      for(var i=0;i<userids.length;i++){
       if(userids[i].checked == false){
        userids[i].checked = true;
       }
      }
     }else if(type=="全不选"){
      for(var i=0;i<userids.length;i++){
       if(userids[i].checked == true){
        userids[i].checked = false;
       }
      }
     }else if(type=="反选"){
      for(var i=0;i<userids.length;i++){
       if(userids[i].checked == true){
        userids[i].checked = false;
       }else{
        userids[i].checked = true;
       }
      }
     }
    }
   }  
}
</script>
</head>
<body class="write_bg">


<table width="1107" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"></td>
  </tr>
</table>
<table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" ></td>
  </tr>
  <tr>
    <td width="13" height="30" align="left" valign="top"  ></td>
    <td width="822" align="left" valign="top"  class="text_blod_title">用户管理</td>
  </tr>
  <tr>
    <td height="15" colspan="2" align="center" ><img src="../images/line.jpg" width="850" height="6"></td>
  </tr>
  <tr>
    <td height="15" colspan="2"  ></td>
  </tr>
</table>
<form name="form12" method="post" action="${pageContext.request.contextPath }/AdminServlet">
 	<input type="hidden"  name="method"  value="findUsersByDynamic" />

<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="835" background="../images/wb_01 (3).jpg">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5"></td>
        <td width="4%" height="25" align="left" class="text_cray1">姓名</td>
        <td width="11%" align="left" class="text_cray1"><label>
          <input name="username" type="text" class="text_cray" style="width:80px">
        </label></td>
        <td width="6%" align="center" class="text_cray1">性别</td>
        <td width="6%" align="left" class="text_cray1"><label>
          <select name="sex" class="text_cray">
            <option value="">==请选择==</option>
            <option value="1">男</option>
            <option value="2">女</option>
          </select>
        </label></td>
        <td width="9%" align="center" class="text_cray1">证件类型</td>
        <td width="13%" align="left" class="text_cray1"><label>
          <select class="cardtype" name="cardtype" id="cardType">
            <option value="">==请选择==</option>
            <option value="1">二代身份证</option>
            <option value="2">港澳通行证 </option>
            <option value="3">台湾通行证</option>
            <option value="4">护照</option>
          </select>
        </label></td>
        <td width="8%" align="center" class="text_cray1">证件号码</td>
        <td width="13%" align="left" class="text_cray1"><label>
          <input name="cardnum" type="text" class="text_cray" style="width:100px">
        </label></td>
        <td width="8%" align="center" class="text_cray1">旅客类型</td>
        <td width="13%" align="left" class="text_blod"><label>
          <select class="text_cray" id="passengerType" name="travellertype" style="width:100px">
            <option value="">==请选择==</option>
            <option value="1">成人</option>
            <option value="2">儿童</option>
            <option value="3">学生</option>
            <option value="4">残疾军人、伤残人民警察</option>
          </select>
        </label></td>
        <td width="8%" align="center" valign="middle" class="text_craybold"><label>
          <input name="Submit" type="submit" class="butcx" value="">
        </label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="20" colspan="11" align="center">&nbsp;</td>
      </tr>
    </table>
</form>


        <table width="553" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#dadada" bgcolor="#FFFFFF">
          <tr align="center">
            <td width="44" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1">选择</td>
            <td width="98" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">姓名</td>
            <td width="80" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">性别</td>
            <td width="132" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">证件类型</td>
            <td width="247" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">证件号码</td>
            <td width="82" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">旅客类型</td>
            <td width="89" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">操作</td>
          </tr>
          <tr align="center">
            <td height="15" colspan="7" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><img src="../images/line1.jpg" width="790" height="6"></td>
          </tr>
        <c:forEach items="${requestScope.userList}" var="user">
          <tr align="center" bgcolor="#FFFFFF">
            <td bordercolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="${user.userid }">            </td>
            <td width="98" bordercolor="#FFFFFF"  class="text_cray1">${user.realname }</td>
            <td width="80" bordercolor="#FFFFFF"  class="text_cray1">
            <c:if test="${user.sex == 1}">
                                男
            </c:if>
            <c:if test="${user.sex == 2}">
                                女
            </c:if>
            </td>
            <td width="132" bordercolor="#FFFFFF"  class="text_cray1">
            <c:if test="${user.cardtype == 1}">
                                二代身份证
            </c:if>
            <c:if test="${user.cardtype == 2}">
                                港澳通行证
            </c:if>
            <c:if test="${user.cardtype == 3}">
                                台湾通行证
            </c:if>
            <c:if test="${user.cardtype == 4}">
                                护照
            </c:if>
            </td>
            <td width="247" bordercolor="#FFFFFF"  class="text_cray1">${user.cardnum}</td>
            <td width="82" bordercolor="#FFFFFF"  class="text_cray1">
            <c:if test="${user.travellertype == 1}">
                                成人
            </c:if>
            <c:if test="${user.travellertype == 2}">
                                儿童
            </c:if>
            <c:if test="${user.travellertype == 3}">
                                学生
            </c:if>
            <c:if test="${user.travellertype == 4}">
                                残疾军人、伤残人民警察
            </c:if>
            </td>
            <td width="89" bordercolor="#FFFFFF"  class="text_cray1"><a href="${pageContext.request.contextPath }/AdminServlet?userid=${user.userid}&method=userinfoedit" class="text_red">编辑</a></td>
          </tr>
      </c:forEach>
       
        </table>
      <br>
        <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr align="center">
            <td width="102" align="left"  class="text_cray1"><a href="#">
              <label></label>
              <label></label>
              <label>
              <input type="checkbox" name="checkbox2" value="11"  onclick="selectAllNullorReserve('checkbox','反选');" ><span class="text_blue">全选</span></label>
            </a></td>
            <td width="525" align="right"  class="text_cray1"><a href="#">
              <!--<input type="button" name="Submit23" value="新增" onClick="UserAdd()"> -->
            </a></td>
            <td width="55" align="right"  class="text_cray1"><a href="#">
              <input name="Submit22" type="button" class="butsc" value="" onclick="deleteUsers()">
            </a></td>
            <td width="91" align="right"  class="text_cray1"><label>
              <input name="Submit3" type="submit" class="butdc" value="">
            </label></td>
          </tr>
        </table>
      <br>
        <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr align="center" style="width:60%">
            <td width="335" align="center"  class="text_cray">&nbsp;</td>
            <td width="284" align="center"  class="text_cray"><c:if test="${aa == 1}">   
        <a href="${pageContext.request.contextPath }/AdminServlet?method=findAll&curpage=1">首页</a>
        <c:forEach begin="${page.lpage}" end="${page.rpage}" var="pageNum">
            <a href="${pageContext.request.contextPath }/AdminServlet?method=findAll&curpage=${pageNum }">${pageNum }</a>
        </c:forEach>
        <a href="${pageContext.request.contextPath }/AdminServlet?method=findAll&curpage=${page.last }">尾页</a> 
        </c:if>
        
        <c:if test="${aa == 2}">   
        <a href="${pageContext.request.contextPath }/AdminServlet?method=findUsersByDynamic&username=${requestScope.u.realname}&sex=${requestScope.u.sex}&cardtype=${requestScope.u.cardtype}&cardnum=${requestScope.u.cardnum}&travellertype=${requestScope.u.travellertype}&curpage=1">首页</a>
        <c:forEach begin="${page.lpage}" end="${page.rpage}" var="pageNum">
            <a href="${pageContext.request.contextPath }/AdminServlet?method=findUsersByDynamic&username=${requestScope.u.realname}&sex=${requestScope.u.sex}&cardtype=${requestScope.u.cardtype}&cardnum=${requestScope.u.cardnum}&travellertype=${requestScope.u.travellertype}&curpage=${pageNum }">${pageNum }</a>
        </c:forEach>
        <a href="${pageContext.request.contextPath }/AdminServlet?method=findUsersByDynamic&username=${requestScope.u.realname}&sex=${requestScope.u.sex}&cardtype=${requestScope.u.cardtype}&cardnum=${requestScope.u.cardnum}&travellertype=${requestScope.u.travellertype}&curpage=${page.last }">尾页</a> 
        </c:if>
        
            </td>
            <td width="154" align="right"  class="text_cray1" style="width:20%"><label class="text_cray"> 每页显示 3 条信息</label></td>
            
          </tr>
        </table>
      <br></td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="2" background="../images/bottom_point.gif"></td>
  </tr>
  <tr>
    <td height="25" align="center" background="../images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
  </tr>
</table>
<script type="text/javascript">

function deleteUsers(){
	
	var param="";
	var checkboxObj = document.getElementsByName("checkbox");
	for(var i=0;i<checkboxObj.length;i++){
		if(checkboxObj[i].checked == true){
			param+=checkboxObj[i].value+":";
		}
	}
	document.location.href = "${pageContext.request.contextPath }/AdminServlet?method=delete&param="+param;
}


</script>
</body>
</html>
