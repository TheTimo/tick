<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息修改</title>
<link href="${pageContext.request.contextPath }/css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
<form action="${pageContext.request.contextPath }/AdminServlet" method="post">
<input name="method" value="userinfoeditadmin" type="hidden"  />
<input name="userid" value="${requestScope.userid123}" type="hidden"  />
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="30"></td>
    </tr>
  </table>
  <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" ></td>
  </tr>
  <tr>
    <td width="64" ></td>
    <td width="794" height="30" valign="top" class="text_blod_title">修改用户信息</td>
  </tr>
  <tr>
    <td height="15" colspan="2" ><img src="${pageContext.request.contextPath }/images/line1.jpg" width="835" height="6"></td>
    </tr>
  <tr>
    <td colspan="2" background="${pageContext.request.contextPath }/images/wb_01 (3).jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="64">&nbsp;</td>
        <td width="771" height="25" align="left" class="text_cray">注：标有 <span class="text_red">*</span> 处，均为必填项</td>
      </tr>
      <tr>
        <td height="20" colspan="2">&nbsp;</td>
        </tr>
    </table><!-- 
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="15" colspan="4" align="left" class="text_title">登录信息</td>
          </tr>
          <tr>
            <td height="10" colspan="4" ></td>
          </tr>
          
          <tr>
            <td width="20" align="center" class="text_red1"></td>
            <td width="100" height="40" align="left" class="text_cray1">密码初始化：</td>
            <td class="text_cray"><label>
              <input name="Submit" type="submit" class="text_cray" value="密码初始化">
            </label></td>
          </tr>
          <tr>
            <td height="20" colspan="3"></td>
          </tr>
          <tr>
            <td height="15" colspan="3" align="left" class="text_title">权限设置</td>
          </tr>
          <tr>
            <td height="10" colspan="3"></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">用户权限：</td>
            <td><select name="select" class="text_cray">
                <option>管理员</option>
                <option>普通用户</option>
            </select>            
            </td>
          </tr> -->
        </table>
      <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <!-- <tr>
            <td height="20" colspan="6"></td>
          </tr> -->
          <tr>
            <td height="15" colspan="6" align="left" class="text_title">详细信息</td>
          </tr>
          <tr>
            <td height="10" colspan="6" ></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red1"></td>
            <td width="100" height="40" align="left" class="text_cray1">登录名：</td>
            <td class="text_cray"><input type="text" name="loginname" id="loginname" readonly="readonly"  value="${requestScope.user.loginname}"/></td>
            <!-- <td width="239" rowspan="6" align="center" ><img src="${pageContext.request.contextPath }/images/photo.jpg" width="120" height="120"></td> -->
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">真实姓名：</td>
            <td colspan="4" class="text_cray"><input name="realname" type="text" class="text_cray" id="realname" value="${requestScope.user.realname}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">性 别：</td>
            <td colspan="4" class="text_cray"><span class="mr25">
              <input type="radio" name="sex" value="1"  <c:if test="${requestScope.user.sex == 1}">checked="checked"</c:if>/>
              <label>男</label>
              </span> <span>
                <input type="radio" name="sex" value="2" <c:if test="${requestScope.user.sex == 2}">checked="checked"</c:if>  />
              <label>女</label>
              </span> </td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">省份：</td>
            <td width="106"><label>
              <select name="provice" class="text_cray" id="province">
                <option value="${requestScope.user.provice}" selected="selected">${requestScope.user.provice}</option>
              </select>
            </label>            </td>
            <td width="24" align="left"  class="text_cray">&nbsp;</td>
            <td width="43" align="left"  class="text_cray">城市：</td>
            <td width="407" align="left" class="text_cray"><label>
              <select name="citty" class="text_cray" id="city">
                <option value="${requestScope.user.citty}" selected="selected">${requestScope.user.citty}</option>
              </select>
            </label>            </td>
          </tr>
         <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件类型：</td>
            <td colspan="4" ><select class="text_cray" name="cardtype" id="cardtype">
                <option value="1" <c:if test="${requestScope.user.cardtype == 1}">selected = "selected"</c:if> >二代身份证 </option>
                <option value="2" <c:if test="${requestScope.user.cardtype == 2}">selected = "selected"</c:if> >港澳通行证 </option>
                <option value="3" <c:if test="${requestScope.user.cardtype == 3}">selected = "selected"</c:if> >台湾通行证 </option>
                <option value="4" <c:if test="${requestScope.user.cardtype == 4}">selected = "selected"</c:if> >护照 </option>
            </select>            </td>
          </tr> 
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件号码：</td>
            <td colspan="4" class="text_cray"><input type="text" name="cardnum" id="cardnum" value="${requestScope.user.cardnum}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">出生日期：</td>
            <td colspan="4" class="text_cray"><input type="text" name="birthday" id="birthday" value="${requestScope.user.birthday}"/></td>
          </tr>
          <tr>
            <td width="20" align="center">&nbsp;</td>
            <td width="100" height="40" align="left" class="text_cray1">旅客类型：</td>
            <td colspan="4" class="text_cray"><select class="text_cray" id="travellertype" name="travellertype">
                <option value="1" <c:if test="${requestScope.user.travellertype == 1}">selected = "selected"</c:if> >成人</option>
                <option value="2" <c:if test="${requestScope.user.travellertype == 2}">selected = "selected"</c:if> >儿童</option>
                <option value="3" <c:if test="${requestScope.user.travellertype == 3}">selected = "selected"</c:if> >学生</option>
                <option value="4" <c:if test="${requestScope.user.travellertype == 4}">selected = "selected"</c:if> >残疾军人、伤残人民警察</option>
            </select>            </td> 
          </tr>
          <tr>
            <td height="10" colspan="6" >&nbsp;</td>
          </tr>
          <tr>
            <td width="20" align="center">&nbsp;</td>
            <td height="15" align="left" class="text_cray1">备注：</td>
            <td height="15" colspan="4"><textarea name="info" id="info" rows="8" class="text_cray" style="width:100%">${requestScope.user.info}</textarea></td>
          </tr>
        </table>
      <table width="100%" border="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
    </table>
  <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="164">&nbsp;</td>
      <td width="99" height="30" align="center"><input name="button" type="submit" class="buttj" id="button"value=""></td>
      <td width="98" align="center">&nbsp;</td>
      <td width="97" align="center"><input name="button2" type="button" class="butcz" id="button2" value="" onclick="cleantext()"></td>
      <td width="92" align="center">&nbsp;</td>
    </tr>
  </table>  
  <table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="20">&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="2" background="${pageContext.request.contextPath }/images/bottom_point.gif"></td>
  </tr>
  <tr>
    <td height="25" align="center" background="${pageContext.request.contextPath }/images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
  </tr>
</table>
</td>
  </tr>
</table>
</form>

<script type="text/JavaScript" src="${pageContext.request.contextPath }/js/common.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
function cleantext(){
	$("#loginname").val("${requestScope.user.loginname}");
	$("#realname").val("${requestScope.user.realname}");
	$("#cardnum").val("${requestScope.user.cardnum}");
	$("#birthday").val("${requestScope.user.birthday}");
	$("#info").val("${requestScope.user.info}");
	
}

</script>
</body>
</html>
