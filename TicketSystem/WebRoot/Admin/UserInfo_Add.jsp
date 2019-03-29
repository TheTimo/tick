<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增用户信息</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/layui.css"  type="text/css">
</head>

<body class="write_bg">
<form action="${pageContext.request.contextPath}/AdminServlet"  method="post">
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="30">
      	<input type="hidden" name="method"  value="insert">
       </td>
    </tr>
  </table>
<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" ></td>
  </tr>
  <tr>
    <td width="64" height="30"  ></td>
    <td width="771" height="30" valign="top"  class="text_blod_title">新增用户信息</td>
  </tr>
  <tr>
    <td height="15" colspan="2" ><img src="../images/line1.jpg" width="835" height="6"></td>
    </tr>
  <tr>
    <td colspan="2" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="64"></td>
        <td width="771" height="25" align="left" class="text_cray">注：标有<span class="text_red"> *</span> 处，均为必填项</td>
      </tr>
      <tr>
        <td></td>
        <td height="15"></td>
      </tr>
    </table>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="15" colspan="3" align="left" class="text_title">登录信息</td>
          </tr>
          <tr>
            <td height="10" colspan="3"></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">登录名：</td>

            <td class="text_cray" align="left" ><input type="text" name="loginName" id="loginName"> 

            <span class="layui-badge layui-bg-green" id="loginname_info1" style="display:none; margin-left : 40px;">√</span>
            </td>                  
            <td class="text_cray" align="left" id="loginname_info2" style="display:none;">
                  <span class="layui-badge">×</span>
                                   由字母、数字或“_”组成，长度不少于6位，不多于30位
            </td>
                  
            <td class="text_cray" align="left" id="loginname_info3" style="display:none;">
                  <span class="layui-badge">×</span>
                                  用户名重复
            </td>
   
            
          </tr>
        </table>
      <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="3" ></td>
          </tr>
          <tr>
            <td height="15" colspan="3" align="left" class="text_title">权限设置</td>
          </tr>
          <tr>
            <td height="10" colspan="3" align="left" class="text_red1"></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">用户权限：</td>
            <td><label>
              <select name="select" class="text_cray">
                <option>管理员</option>
                <option>普通用户</option>
              </select>
            </label></td>
          </tr>
        </table>
      <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="6" ></td>
          </tr>
          <tr>
            <td height="15" colspan="6" align="left" class="text_title">详细信息</td>
          </tr>
          <tr>
            <td height="10" colspan="6" ></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">真实姓名：</td>
            <td width="14"></td>
            <td colspan="3" align="left"><input name="realName" type="text" class="text_cray" id="textfield2" /></td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">性 别：</td>
            <td></td>
            <td colspan="3" align="left" class="text_cray1">
              <input name="sex" type="radio" value="1" checked />
              <span class="text_cray">
              <label>男</label>
              <input type="radio" name="sex" value="2" />
                <label>女</label>
                <label></label>
              </span> </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">省 份：</td>
            <td>&nbsp;</td>
            <td align="left" class="text_cray"><select name="provice" class="text_cray" id="province">
                <option value="省份" selected="selected">省份</option>
            </select> 
            </td>
            <td width="48" align="left" class="text_cray">城市：</td>
            <td width="343" align="left" class="text_cray"><select name="city" class="text_cray" id="city">
                <option value="城市" selected="selected">市县</option>
            </select>            </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件类型：</td>
            <td>&nbsp;</td>
            <td colspan="3" align="left"><select class="text_cray" name="cardType" id="cardType">
                <option value="1">二代身份证</option>
                <option value="2">港澳通行证</option>
                <option value="3">台湾通行证</option>
                <option value="4">护照</option>
            </select>            </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件号码：</td>
            <td></td>
            <td colspan="3" align="left" class="text_cray"><input type="text" name="cardNumber" id="cardnum" /></td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">出生日期：</td>
            <td></td>
            <td width="175" align="left" class="text_cray"><input type="text" name="birthday" id="birthday" /></td>
            <td colspan="2" align="left"></td>
          </tr>
          <tr>
            <td align="center"></td>
            <td width="100" height="40" align="left" class="text_cray1">旅客类型：</td>
            <td></td>
            <td width="175" align="left" class="text_cray"><select class="text_cray" id="passengerType" name="lvkeType">
              <option value="1" selected="selected">成人</option>
                <option value="2">儿童</option>
                <option value="3">学生</option>
                <option value="4">残疾军人、伤残人民警察</option>
            </select>            </td>
            <td colspan="2" align="left"></td>
          </tr>
          <tr>
            <td height="10" colspan="6"></td>
          </tr>
          <tr>
            <td align="center"></td>
            <td height="15" align="left" class="text_cray1">备注：</td>
            <td></td>
            <td height="15" colspan="3" align="left"><textarea name="info" style="width:100%" rows="8" id="info"></textarea></td>
          </tr>
        </table>
</table><br>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="164"></td>
    <td width="99" height="30" align="center"><input name="button" type="submit" class="buttj" id="button"value=""></td>
    <td width="98" ></td>
</form>
    <td width="97" align="center"><input name="button2" type="button" class="butcz" id="button2" value="" onclick="cleantext()"></td>
    <td width="92" ></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0">
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

<script type="text/JavaScript" src="../js/common.js"></script>
<script src="../js/layui.all.js" charset="utf-8"></script>
<script type="text/JavaScript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
//点击输入框隐藏错误信息
$("#loginName").focus(function(){
	$("#loginname_info1").css("display","none");
	$("#loginname_info2").css("display","none");
	$("#loginname_info3").css("display","none");
}); 


//当焦点失去时，进行信息的校验
$("#loginName").blur(function(){
	var loginname = $(this).val();
	if(loginname.length < 6 || loginname.length > 30){
		//alert(loginname.length);
		$("#loginname_info2").css("display","");
		return
	}
	var method = "findloginname";
	$.ajax({
		url:"${pageContext.request.contextPath}/UserServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{loginname:loginname,method:method},
		success:function(data){
			if(data == "true"){
				$("#loginname_info3").css("display","");
				return
			}else{
				$("#loginname_info1").css("display","");
			}
		}
    });
  });
  
  
function cleantext(){
	$('#loginName').val('');
	//$('#password').val('');
	//$('#repassword').val('');
	$('#realName').val('');
	//$('#sex').val('');
	//$('#provice').val('');
	//$('#citty').val('');
	//$('#cardtype').val('');
	$('#cardnum').val('');
	$('#birthday').val('');
	//$('#travellertype').val('');
	$('#info').val('');
}
</script>
</body>
</html>
