<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户信息修改</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">

</head>

<body class="write_bg">
<form name="form1" method="post" action="${pageContext.request.contextPath}/UserServlet">
<input name="method" value="userinfoedit" type="hidden"  />
<input name="userid" value="<%=(int)session.getAttribute("userid")%>" type="hidden"  />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><br>
            <br></td>
  </tr>
</table>
<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" align="center" ></td>
  </tr>
  <tr>
    <td width="64" height="11" class="text_blod_title"></td>
    <td width="786" height="30" align="left" class="text_blod_title">修改个人信息</td>
  </tr>
  <tr>
    <td height="15" colspan="2" ><img src="../images/line1.jpg" width="835" height="6"></td>
  </tr>
  <tr>
    <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="64"></td>
        <td width="772" height="25" align="left" class="text_cray">注：标有 <span class="text_red">*</span> 处，均为必填项</td>
      </tr>
      <tr>
        <td height="20" colspan="2"></td>
        </tr>
    </table>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="15" colspan="4" align="left" class="text_title">详细信息</td>
          </tr>
          <tr>
            <td height="10" colspan="4" ></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red1"></td>
            <td width="100" height="40" align="left" class="text_cray1">登录名：</td>
            <td width="350" align="left" class="text_cray1"><input name="loginname" type="text" class="text_cray" id="loginname"  placeholder = "<%=(String)session.getAttribute("loginname")%>" value = "<%=(String)session.getAttribute("loginname")%>"/></td>
            <td width="230" colspan="-1" rowspan="7" align="center" background="../images/bg_point_write.gif" class="text_cray1"><img src="../images/photo_mr.jpg" width="120">              <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="15" ></td>
                </tr>
                <tr>
                  <td height="7" align="center" class="text_cray">上传照片</td>
                </tr>
                <tr>
                  <td height="8" ></td>
                </tr>
                <tr>
                  <td align="center"><input name="uploadFile" type="file" class="text_cray" size="20" /></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td width="20" ></td>
            <td width="100" height="40" align="left" class="text_cray1">真实姓名：</td>
            <td align="left" class="text_cray1"><input name="realname" type="text" value="<%=(String)session.getAttribute("realname")%>" class="text_cray" id="realname" /></td>
          </tr>
          <tr>
            <td width="20" ></td>
            <td width="100" height="30" align="left" class="text_cray1">性 别：</td>
            <!-- <td align="left" class="text_cray1">
              <input type="radio" name="sex" value="1" readonly="readonly" disabled="true" checked="checked"/>
          <span class="text_cray">
              <label>男</label>
              <input type="radio" name="sex" value="2" readonly="readonly" disabled="true"/>
              <label>女</label>
              </span>
              <label></label>
              <span><label></label>
              </span> 
          </td> -->
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
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">省份：</td>
            <!-- <td align="left" class="text_cray1"><input name="provice" type="text" disabled="true" class="text_cray" id="textfield2" value="辽宁" readonly="readonly"/> </td> -->  
            <td width="104" height="35" align="left"><label>
                    <select name="provice" class="text_cray" id="province">
                      <option value="<%=(String)session.getAttribute("provice")%>" selected="selected">省份</option>
                    </select>
              </label></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">城市：</td>
           <!--  <td align="left" class="text_cray1"><input name="citty" type="text" disabled="true" class="text_cray" id="textfield2" value="沈阳" readonly="readonly"/>            </td> -->
           <td width="436" height="35" align="left" class="text_cray"><label>
                    <select name="citty" class="text_cray" id="city">
                      <option value="<%=(String)session.getAttribute("citty")%>" selected="selected">市县</option>
                    </select>
                  </label></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件类型：</td>
            <!-- <td align="left" class="text_cray1"><input name="cardtype" type="text" disabled="true" class="text_cray" id="textfield2" value="二代身份证" readonly="readonly"/>            </td> -->
            <td height="35" colspan="3" align="left">
                    <select class="text_cray" name="cardtype" id="cardType">
                      <option value="1"><span>二代身份证</span>				</option>
                      <option value="2"><span>港澳通行证</span>				</option>
                      <option value="3"><span>台湾通行证</span>				</option>
                      <option value="4"><span>护照</span>				</option>
                  </select>				</td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件号码：</td>
            <td align="left" class="text_cray1"><input name="cardnum" type="text" value="<%=(String)session.getAttribute("cardnum")%>" class="text_cray" id="cardnum"  /></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">出生日期：</td>
            <td colspan="2" align="left" class="text_cray1"><input name="birthday" type="text" value="<%=(String)session.getAttribute("birthday")%>" class="text_cray" id="birthday" /></td>
          </tr>
          <tr>
            <td width="20" height="35" ></td>
            <td width="100" height="40" align="left" class="text_cray1">旅客类型：</td>
            <td height="35" colspan="2" align="left" class="text_cray1">
            <select class="text_cray" id="travellertype" name="travellertype">
              <option value="1">成人</option>
                <option value="2">儿童</option>
                <option value="3">学生</option>
                <option value="4">残疾军人、伤残人民警察</option>
            </select>            </td>
          </tr>
          <tr>
            <td height="10" colspan="4" align="center"></td>
          </tr>
          <tr>
            <td width="20" ></td>
            <td width="100" height="80" align="left" class="text_cray1">备注：</td>
            <td height="80" colspan="2" align="left" class="text_cray1"><textarea name="info" id="info" rows="8" class="text_cray" placeholder="<%=(String)session.getAttribute("info")%>" style="width:100%"></textarea>            </td>
          </tr>
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
            <td width="97" align="center"><input name="button2" type="button" class="butcz" id="button2" onclick="cleantext()"></td>
            <td width="92" ></td>
          </tr>
        </table>
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
</td>
  </tr>
</table>
</form>

<script type="text/JavaScript" src="../js/common.js"></script>
<script src="../js/layui.all.js" charset="utf-8"></script>
<script src="../js/laydate.js"></script>
<script type="text/JavaScript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">

function cleantext(){
	$("#loginname").val("");
	$("#realname").val("");
	$("#cardnum").val("");
	$("#birthday").val("");
	$("#info").val("");
	
}
</script>
</body>
</html>
