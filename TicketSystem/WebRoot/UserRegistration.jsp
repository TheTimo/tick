<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册信息</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">

<link href="css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/layui.css"  type="text/css">
<link rel="stylesheet" href="css/laydate.css"  type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="UserServlet" method="post"> 
<input name="method" type="hidden" value="Register" />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" background="images/ny_top_img_bg.gif"><img src="images/ny_top_img.gif" width="650" height="108"></td>
    </tr>
  <tr>
    <td width="75" height="23" bgcolor="#deedf8">&nbsp;</td>
    <td width="958" align="left" bgcolor="#deedf8" class="text_cray1">当前位置:注册信息　</td>
    </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/bg_point_write.gif">
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" align="center">&nbsp;</td>
        </tr>
      <tr>
        <td width="41" height="7" align="center">&nbsp;</td>
        <td width="794" height="30" align="left" valign="top"><span class="text_blod_title">注册信息</span></td>
      </tr>
      <tr>
        <td height="15" colspan="2" align="center"><img src="images/line1.jpg" width="835" height="6"></td>
      </tr>
      <tr>
        <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5%">&nbsp;</td>
            <td width="95%" align="left" class="text_cray">注：标有 <span class="text_red">*</span> 处，均为必填项</td>
          </tr>
          <tr>
            <td height="15" colspan="2">&nbsp;</td>
            </tr>
          
        </table>
          <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" colspan="4" align="left" class="text_red1"><span class="text_title">登录信息</span></td>
                </tr>
          
          <tr>
            <td width="19" align="center" class="text_red">*</td>
                  <td width="98" height="40" align="left" class="text_cray1">登录名：</td>
                  <td width="160" align="left" class="text_cray1"><input name="loginname" type="text" class="text_cray" id="loginname" /></td>
                  
                  <td width="423" height="35" align="left" class="text_cray" id="loginname_info1" style="display:none;">
                  <span class="layui-badge layui-bg-green">√</span>
                  </td>
                  
                  <td width="423" height="35" align="left" class="text_cray" id="loginname_info2" style="display:none;">
                  <span class="layui-badge">×</span>
                                   由字母、数字或“_”组成，长度不少于6位，不多于30位
                  </td>
                  
                  <td width="423" height="35" align="left" class="text_cray" id="loginname_info3" style="display:none;">
                  <span class="layui-badge">×</span>
                                  用户名重复
                  </td>
                </tr>
          <tr>
            <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">密码：</td>
                  <td align="left" class="text_cray1"><input name="password" type="text" class="text_cray" id="password" /></td>
                  
                  <td height="35" align="left" class="text_cray" id="password_info1" style="display:none;">
                  <span class="layui-badge layui-bg-green">√</span>
                  </td>
                  
                  <td height="35" align="left" class="text_cray" id="password_info2" style="display:none;">
                  <span class="layui-badge">×</span>不少于6位字符
                  </td>
                  <td></td>
                </tr>
          <tr>
            <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">确认密码：</td>
                  <td align="left" class="text_cray1"><input name="repassword" type="password" class="text_cray" id="repassword" /></td>
                  
                  <td height="35" align="left" class="text_cray" id="repassword_info2" style="display:none;">
                  <span class="layui-badge">×</span>请再次输入密码
                  </td>
                  <td height="35" align="left" class="text_cray" id="repassword_info1" style="display:none;">
                  <span class="layui-badge layui-bg-green">√</span>
                  </td>
                </tr>
        </table>
          <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="35" colspan="5" align="left" class="text_red1"><span class="text_title">详细信息</span></td>
                </tr>
            
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">真实姓名：</td>
                  <td height="35" colspan="3" align="left"><input name="realname" type="text" class="text_cray" id="textfield2" /></td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">性 别：</td>
                  <td height="35" colspan="3" align="left" class="text_cray1">
                    <span class="mr25">
                    <input type="radio" name="sex" value="1" checked="checked" />
                    </span>
                    <span class="text_cray">
                    <label>男</label>
                    <input type="radio" name="sex" value="2" />
                    <label>女</label>
                    </span>
                    <label></label>
                    <span><label></label>
                  </span>				</td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">省份：</td>
                  <td width="104" height="35" align="left"><label>
                    <select name="provice" class="text_cray" id="province">
                      <option value="省份" selected="selected">省份</option>
                    </select>
                  </label></td>
                  <td width="43" height="35" align="left"  class="text_cray">城市：</td>
                  <td width="436" height="35" align="left" class="text_cray"><label>
                    <select name="citty" class="text_cray" id="city">
                      <option value="城市" selected="selected">市县</option>
                    </select>
                  </label></td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">证件类型：</td>
                  <td height="35" colspan="3" align="left">
                    <select class="text_cray" name="cardtype" id="cardType">
                      <option value="1"><span>二代身份证</span>				</option>
                      <option value="2"><span>港澳通行证</span>				</option>
                      <option value="3"><span>台湾通行证</span>				</option>
                      <option value="4"><span>护照</span>				</option>
                  </select>				</td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">证件号码：</td>
                  <td height="35" colspan="2" align="left"><input name="cardnum" type="text" class="text_cray" id="cardnum" /></td>
                  
                  <td width="100" height="40" align="left" class="text_cray1" id="cardnum_info1" style="display:none;">
                  <span class="layui-badge layui-bg-green">√</span>
                  </td>
                  
                  <td width="100" height="40" align="left" class="text_cray1" id="cardnum_info2" style="display:none;">
                  <span class="layui-badge">×</span>
                                   由数字组成，证件号码长度为18位
                  </td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">出生日期：</td>
                  <td height="35" colspan="3" align="left">
                  <div class="layui-input-inline">
                        <input name="birthday" type="text" class="text_cray" id="birthday"/>
                  </div>
                  </td>
                </tr>
            
            <tr>
              <td width="19" align="center">&nbsp;</td>
                  <td width="98" height="40" align="left" class="text_cray1">旅客类型：</td>
                  <td height="35" colspan="3" align="left">
                    <select class="text_cray" id="passengerType" name="travellertype">
                      <option value="1">成人</option>
                      <option value="2">儿童</option>
                      <option value="3">学生</option>
                      <option value="4">残疾军人、伤残人民警察</option>
                    </select>				
                  </td>
                </tr>
            <tr>
              <td height="10" colspan="5" align="center">	</td>
	            </tr>
            
            <tr>
              <td width="19" align="center">&nbsp;</td>
                  <td width="98" height="30" align="left" class="text_cray1">备注：</td>
                  <td colspan="3" align="left" height="80">
                  <textarea name="info" rows="8" class="text_cray" style="width:100%"></textarea>				</td>
                </tr>
            
            
            
            <tr>
              <td align="center">&nbsp;</td>
                  <td height="30" align="left" class="text_cray1"></td>
                  <td height="50" colspan="3" align="left" valign="middle" class="text_cray1">
                  <input type="checkbox" class="check" id="checkAgree" /> 
                  我已阅读并同意遵守				<a href="/otn/regist/rule;jsessionid=FA97B306AACF75E37DD4D10CFD59994A" class="ft14" target="_blank" shape="rect"> 《中国铁路客户服务中心网站服务条款》</a></td>
                </tr>
          </table> <br>        
          <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="234">&nbsp;</td>
                  <td width="147" height="30" align="center"><input name="button3" type="submit" class="buttj" id="button3" value="" onclick="register()"></td>
                  <td width="141" align="center">&nbsp;</td>
                  <td width="147" align="center"><input name="button4" type="button" class="butcz" id="button4" value="" onclick="cleanregister()"></td>
                  <td width="166" align="center">&nbsp;</td>
                </tr>
              </table></td>
      </tr>
      </table></td>
  </tr>
</table><br>

<table width="100%" border="0" cellspacing="0">
<tr>
    <td height="2" background="images/bottom_point.gif"></td>
  </tr>
  <tr>
    <td height="25" align="center" background="images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
  </tr>
</table>
</form>
<script type="text/JavaScript" src="js/common.js"></script>
<script src="js/layui.all.js" charset="utf-8"></script>
<script src="js/laydate.js"></script>
<script type="text/JavaScript" src="js/jquery-1.7.2.js"></script>
<script>
//信息重置
function cleanregister(){
	$('#loginname').val('');
	$('#password').val('');
	$('#repassword').val('');
	$('#realname').val('');
	$('#sex').val('');
	//$('#provice').val('');
	//$('#citty').val('');
	//$('#cardtype').val('');
	$('#cardnum').val('');
	$('#birthday').val('');
	//$('#travellertype').val('');
	$('#info').val('');
}

//点击输入框隐藏错误信息
$("#loginname").focus(function(){
	$("#loginname_info1").css("display","none");
	$("#loginname_info2").css("display","none");
	$("#loginname_info3").css("display","none");
}); 
$("#password").focus(function(){
	$("#password_info1").css("display","none");
	$("#password_info2").css("display","none");
}); 

$("#repassword").focus(function(){
	$("#repassword_info1").css("display","none");
	$("#repassword_info2").css("display","none");
}); 

$("#cardnum").focus(function(){
	$("#cardnum_info1").css("display","none");
	$("#cardnum_info2").css("display","none");
}); 
//$("#loginname").focus(function(){
//	  showError($("#loginname"));
//    $("loginname_info1").css("background-color","#FFFFCC");
// });
//当焦点失去时，进行信息的校验
$("#loginname").blur(function(){
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

$("#password").blur(function(){
	var password = $(this).val();
	if(password.length < 6){
		//alert(loginname.length);
		$("#password_info2").css("display","");
		return
	}
	$("#password_info1").css("display","");
});

$("#repassword").blur(function(){
	var repassword = $(this).val();
	var password = $("#password").val();
	if(password != ""){
		if(password == repassword){
			//alert(loginname.length);
			$("#repassword_info1").css("display","");
			return
		}else{
			$("#repassword_info2").css("display","");
		}
	}else{
		alert("密码不能为空");
	}
});

$("#cardnum").blur(function(){
	var cardnum = $(this).val();
    if(cardnum.length != 18){
	    $("#cardnum_info2").css("display","");
	    return
	}else{
		$("#cardnum_info1").css("display","");
	}
	
});

//判断元素是否存在内容，如果存在
function showError(ele){
	var text = ele.text();
	if(!text){
		ele.css("display","none");
	}else{
		ele.css("display","");
	}
}
//执行一个laydate实例
laydate.render({
  elem: '#birthday' //指定元素
});

</script>
</body>
</html>
