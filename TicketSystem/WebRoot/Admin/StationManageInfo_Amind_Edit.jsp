<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车站信息修改</title>
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
<form action="${pageContext.request.contextPath}/StationServlet" method="post">
<input type="hidden"  name="method"  value="changeStationInfo" />
<input type="hidden"  name="sid"  value="${requestScope.stationList12.sid}" />
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
    <td width="794" height="30" valign="top" class="text_blod_title">修改车站信息</td>
  </tr>
  <tr>
    <td height="15" colspan="2" ><img src="${pageContext.request.contextPath}/images/line1.jpg" width="835" height="6"></td>
    </tr>
  <tr>
    <td colspan="2" background="../images/wb_01 (3).jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="64">&nbsp;</td>
        <td width="771" height="25" align="left" class="text_cray">注：标有 <span class="text_red">*</span> 处，均为必填项</td>
      </tr>
      <tr>
        <td height="20" colspan="2">&nbsp;</td>
        </tr>
    </table>
        <!-- <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="15" colspan="4" align="left" class="text_title">登录信息</td>
          </tr>
          <tr>
            <td height="10" colspan="4" ></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red1"></td>
            <td width="100" height="40" align="left" class="text_cray1">登录名：</td>
            <td class="text_cray"><input type="text" name="textfield22" id="textfield22" readonly="readonly" disabled="true" value="Test"/></td>
            <td width="239" rowspan="6" align="center" ><img src="../images/photo.jpg" width="120" height="120"></td>
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
          </tr>
        </table> -->
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
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车站名：</td>
            <td colspan="4" class="text_cray"><input name="stationName" type="text" class="text_cray" id="stationName" value="${requestScope.stationList12.stationName}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车站英文名：</td>
            <td colspan="4" class="text_cray"><input name="stationEnglish" type="text" class="text_cray" id="stationEnglish" value="${requestScope.stationList12.stationEnglish}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">所属铁路局：</td>
            <td colspan="4" class="text_cray"><input name="belongTo" type="text" class="text_cray" id="belongTo" value="${requestScope.stationList12.belongTo}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车站等级：</td>
            <td colspan="4" class="text_cray"><input name="stationRank" type="text" class="text_cray" id="stationRank" value="${requestScope.stationList12.stationRank}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">所属行政区域：</td>
            <td colspan="4" class="text_cray"><input name="administrativeArea" type="text" class="text_cray" id="administrativeArea" value="${requestScope.stationList12.administrativeArea}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">联系地址：</td>
            <td colspan="4" class="text_cray"><input name="address" type="text" class="text_cray" id="address" value="${requestScope.stationList12.address}"/></td>
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
      <td width="99" height="30" align="center"><input name="button" type="submit" class="buttj" id="button" value=""></td>
      <td width="98" align="center">&nbsp;</td>
      <td width="97" align="center"><input name="button2" type="button" class="butcz" id="button2" value="" onclick="cleantext()"></td>
      <td width="92" align="center">&nbsp;</td>
    </tr>
  </table>  
  </form>
  <table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="170">&nbsp;</td>
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

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
function cleantext(){
	$("#stationName").val('${requestScope.stationList12.stationName}');
	$("#stationEnglish").val('${requestScope.stationList12.stationEnglish}');
	$("#belongTo").val('${requestScope.stationList12.belongTo}');
	$("#stationRank").val('${requestScope.stationList12.stationRank}');
	$("#administrativeArea").val('${requestScope.stationList12.administrativeArea}');
	$("#address").val('${requestScope.stationList12.address}');
}

</script>
</body>
</html>
