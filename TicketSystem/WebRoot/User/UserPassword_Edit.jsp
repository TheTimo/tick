<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户密码修改</title>
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css"  media="all">
</head>

<body class="write_bg">
 <!-- <form name="form1" method="post" action="${pageContext.request.contextPath}/UserServlet">
<input name="method" value="Changepassword" type="hidden"  /> -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"></td>
  </tr>
</table>
<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2"></td>
  </tr>
  <tr>
    <td width="64" height="12" ></td>
    <td width="744" height="30" align="left" class="text_blod_title">密码修改</td>
  </tr>
  <tr>
    <td height="15" colspan="2"><img src="${pageContext.request.contextPath}/images/line1.jpg" width="835" height="6"></td>
    </tr>
  <tr>
    <td colspan="2"  ><table width="700" border="0" align="center" cellspacing="0">
      <tr>
        <td width="20"></td>
        <td width="100" height="40" class="text_cray1">用户名：</td>
        <td align="left" class="text_cray1"><input name="textfield4" type="text" disabled="true" class="text_cray" id="textfield4" value="${sessionScope.loginname}" size="30" readonly="reasonly"/></td>
      </tr>
      <tr>
        <td width="20" align="center" class="text_red">*</td>
        <td width="100" height="40" class="text_cray1">原密码：</td>
        <td align="left" class="text_cray1"><input name="password" type="text" class="text_cray" id="password" size="30" /></td>
      </tr>
      <tr>
        <td width="20" align="center"  class="text_red">*</td>
        <td width="100" height="40" class="text_cray1">新密码：</td>
        <td align="left" class="text_cray1"><input name="newpassword" type="text" class="text_cray" id="newpassword" size="30" /></td>
      </tr>
      <tr>
        <td width="20" align="center" class="text_red">*</td>
        <td width="100" height="40" class="text_cray1">确认新密码：</td>
        <td align="left" class="text_cray1"><input name="renewpassword" type="text" class="text_cray" id="renewpassword" size="30" /></td>
      </tr>
    </table>
      <br></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="124" height="30"></td>
    <td width="78" align="left"><input type="button" class="layui-btn" id="button"  onclick="checkChangePassword()" value="提交"></td>
    <td width="39" align="center"></td>
    <td align="left"><input name="button2" type="button" class="layui-btn" id="button2"  value="重置" onclick="clean()"></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="275"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="2" background="${pageContext.request.contextPath}/images/bottom_point.gif"></td>
  </tr>
  <tr>
    <td height="25" align="center" background="${pageContext.request.contextPath}/images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
  </tr>
</table>
<!-- </form> -->
<script src="${pageContext.request.contextPath}/js/layui.all.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
function checkChangePassword(){
	var password = $('#password').val();
    var newpassword = $('#newpassword').val();
    var renewpassword = $('#renewpassword').val();
    var method = "Changepassword";
    if(password == ''){
  	  alert('请输入原密码'); 
  	  return
  	  
    }
    if(newpassword == ''){
    	  alert('请输入新密码'); 
    	  return
    	  
      }
    if(renewpassword == ''){
    	  alert('请输入重复密码'); 
    	  return
    	  
      }
    if(newpassword != renewpassword){
      alert('新密码不一致，请重新填写');
      return
    }
    
    $.ajax({
		url:"${pageContext.request.contextPath}/UserServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{newpassword:newpassword,password:password,method:method},
		success:function(data){
			if(data == "true"){
				alert('修改成功');
				$('#password').val('');
			    $('#newpassword').val('');
			    $('#renewpassword').val('');
			}else{
				alert('修改失败，请重新尝试');
			}
		}
    });
}
function clean(){
	$('#password').val('');
    $('#newpassword').val('');
    $('#renewpassword').val('');
}
</script>

</body>
</html>

