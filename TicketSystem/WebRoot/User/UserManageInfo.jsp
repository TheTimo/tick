<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看个人信息</title>
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css"  media="all">
<script language="javascript">
function UpdateInfo(){
	window.location.href="${pageContext.request.contextPath}/User/UserManageInfo_Edit.jsp";
	}
</script>
</head>
<body class="write_bg">
<form name="form1" method="post" action="">
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="30">&nbsp;</td>
    </tr>
  </table>
  <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" align="center" ></td>
  </tr>
  <tr>
    <td width="64" align="center" ></td>
    <td width="771" height="30" align="left" valign="top" ><span class="text_blod_title">查看个人信息</span></td>
  </tr>
  <tr>
    <td height="15" colspan="2" ><img src="${pageContext.request.contextPath}/images/line1.jpg" width="835" height="6"></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"  ><table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="4"  ></td>
          </tr>
          <tr>
            <td height="15" colspan="4" align="left" class="text_title">个人详细信息</td>
          </tr>
          <tr>
            <td height="10" colspan="4" ></td>
          </tr>
          
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">登录名：</td>
            <td width="350" align="left" class="text_cray"><%=(String)session.getAttribute("loginname")%></td>
            <td width="230" rowspan="5" align="center" background="${pageContext.request.contextPath}/images/bg_point_write.gif" class="text_cray"><img src="${pageContext.request.contextPath}/images/photo.jpg" width="139" height="139"></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">真实姓名：</td>
            <td align="left" class="text_cray"><%=(String)session.getAttribute("realname")%></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">性 别：</td>
            <td align="left" class="text_cray">
            <c:set var="salary" scope="session" value="${sessionScope.sex}"/>
            <c:if test="${salary == 1}">
                                男
            </c:if>
            <c:if test="${salary == 2}">
                                女
            </c:if>
            </td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">省份：</td>
            <td align="left" class="text_cray"><%=(String)session.getAttribute("provice")%></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">城市：</td>
            <td align="left" class="text_cray"><%=(String)session.getAttribute("citty")%></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件类型：</td>
            <td colspan="2" align="left" class="text_cray">
            <c:set var="salary1" scope="session" value="${sessionScope.cardtype}"/>
            <c:if test="${salary1 == 1}">
                                二代身份证
            </c:if>
            <c:if test="${salary1 == 2}">
                                港澳通行证
            </c:if>
            <c:if test="${salary1 == 3}">
                                台湾通行证
            </c:if>
            <c:if test="${salary1 == 4}">
                                护照
            </c:if>
            </td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件号码：</td>
            <td colspan="2" align="left" class="text_cray"><%=(String)session.getAttribute("cardnum")%></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">出生日期：</td>
            <td colspan="2" align="left" class="text_cray"><%=(String)session.getAttribute("birthday")%></td>
          </tr>
          <tr>
            <td width="20" height="40" ></td>
            <td width="100" height="40" align="left" class="text_cray1">旅客类型：</td>
            <td colspan="3" align="left" class="text_cray">
            <c:set var="salary3" scope="session" value="${sessionScope.travellertype}"/>
            <c:if test="${salary3 == 1}">
                                成人
            </c:if>
            <c:if test="${salary3 == 2}">
                                儿童
            </c:if>
            <c:if test="${salary3 == 3}">
                                学生
            </c:if>
            <c:if test="${salary3 == 4}">
                                残疾军人、伤残人民警察
            </c:if>
            </td>
          </tr>
          <tr>
            <td width="20" height="40"></td>
            <td width="100" height="40" align="left" class="text_cray1">备注：</td>
            <td height="40" colspan="2" align="left" class="text_cray"><%=(String)session.getAttribute("info")%></td>
          </tr>
        </table><br>
      <table width="100%" border="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="263" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" align="center"><input name="button"  type="button" class="layui-btn" id="button"value="修改" onClick="UpdateInfo()" ></td>
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
      <td height="2" background="${pageContext.request.contextPath}/images/bottom_point.gif"></td>
    </tr>
    <tr>
      <td height="25" align="center" background="${pageContext.request.contextPath}/images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
    </tr>
  </table>
  </td>
  </tr>
</table>
</form>
<script src="${pageContext.request.contextPath}/js/layui.all.js" charset="utf-8"></script>
</body>
</html>




<!--  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>²é¿´¸öÈËÐÅÏ¢</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">

<script language="javascript">
	function UpdateInfo(){
	
	window.location.href="UserManageInfo_Edit.html";
	
	}
</script>
</head>
<body class="write_bg">
<form name="form1" method="post" action="">
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="30">&nbsp;</td>
    </tr>
  </table>
  <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" align="center" ></td>
  </tr>
  <tr>
    <td width="64" align="center" ></td>
    <td width="771" height="30" align="left" valign="top" ><span class="text_blod_title">²é¿´¸öÈËÐÅÏ¢</span></td>
  </tr>
  <tr>
    <td height="15" colspan="2" ><img src="../images/line1.jpg" width="835" height="6"></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"  ><table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="4"  ></td>
          </tr>
          <tr>
            <td height="15" colspan="4" align="left" class="text_title">¸öÈËÏêÏ¸ÐÅÏ¢</td>
          </tr>
          <tr>
            <td height="10" colspan="4" ></td>
          </tr>
          
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">µÇÂ¼Ãû£º</td>
            <td width="350" align="left" class="text_cray">ÓÃ»§1</td>
            <td width="230" rowspan="5" align="center" background="../images/bg_point_write.gif" class="text_cray"><img src="../images/photo.jpg" width="139" height="139"></td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">ÕæÊµÐÕÃû£º</td>
            <td align="left" class="text_cray">ÍõÐ¡Ã÷</td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">ÐÔ ±ð£º</td>
            <td align="left" class="text_cray">ÄÐ</td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">Ê¡·Ý£º</td>
            <td align="left" class="text_cray">ÁÉÄþ</td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">³ÇÊÐ£º</td>
            <td align="left" class="text_cray">ÉòÑô</td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">Ö¤¼þÀàÐÍ£º</td>
            <td colspan="2" align="left" class="text_cray">¶þ´úÉí·ÝÖ¤</td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">Ö¤¼þºÅÂë£º</td>
            <td colspan="2" align="left" class="text_cray">220221199802051028</td>
          </tr>
          <tr>
            <td width="20" height="40" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">³öÉúÈÕÆÚ£º</td>
            <td colspan="2" align="left" class="text_cray">1998-2-5</td>
          </tr>
          <tr>
            <td width="20" height="40" ></td>
            <td width="100" height="40" align="left" class="text_cray1">ÂÃ¿ÍÀàÐÍ£º</td>
            <td colspan="3" align="left" class="text_cray">Ñ§Éú</td>
          </tr>
          <tr>
            <td width="20" height="40"></td>
            <td width="100" height="40" align="left" class="text_cray1">±¸×¢£º</td>
            <td height="40" colspan="2" align="left" class="text_cray">ÎÞ</td>
          </tr>
        </table><br>
      <table width="100%" border="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="263" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" align="center"><input name="button" type="button" class="layui-btn" id="button"value="ÐÞ¸Ä" onClick="UpdateInfo()" target="mainFrame"></td>
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
      <td height="25" align="center" background="../images/bottom_ny_bg.gif" class="text_cray">copyright@12306 ¹ºÆ±Íø</td>
    </tr>
  </table>
  </td>
  </tr>
</table>
</form>
<script src="../js/layui.all.js" charset="utf-8"></script>
</body>
</html>
-->