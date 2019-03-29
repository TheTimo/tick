<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单信息修改</title>
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
<form action="${pageContext.request.contextPath}/TrainServlet" method="post">
<input type="hidden"  name="method"  value="changeTrainInfo" />
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
    <td width="794" height="30" valign="top" class="text_blod_title">修改订单信息</td>
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
      <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="15" colspan="6" align="left" class="text_title">详细信息</td>
          </tr>
          <tr>
            <td height="10" colspan="6" ></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">订单号：</td>
            <td colspan="4" class="text_cray"><input name="" type="text" class="text_cray"  disabled="true" id="" value="${requestScope.trainList12.trainid}"/></td>
            <input type="hidden"  name="trainid"  value="${requestScope.trainList12.trainid}" />
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">用户名：</td>
            <td colspan="4" class="text_cray"><input name="startStation" type="text" class="text_cray" id="startStation" value="${requestScope.trainList12.startStation}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">真实姓名：</td>
            <td colspan="4" class="text_cray"><input name="endStation" type="text" class="text_cray" id="endStation" value="${requestScope.trainList12.endStation}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">起始站：</td>
            <td colspan="4" class="text_cray"><input name="startTime" type="text" class="text_cray" id="startTime" value="${requestScope.trainList12.startTime}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">终点站：</td>
            <td colspan="4" class="text_cray"><input name="endTime" type="text" class="text_cray" id="endTime" value="${requestScope.trainList12.endTime}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">：</td>
            <td colspan="4" class="text_cray"><input name="time" type="text" class="text_cray" id="time" value="${requestScope.trainList12.time}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">距离（公里）：</td>
            <td colspan="4" class="text_cray"><input name="distance" type="text" class="text_cray" id="distance" value="${requestScope.trainList12.distance}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">票数：</td>
            <td colspan="4" class="text_cray"><input name="noTicket" type="text" class="text_cray" id="noTicket" value="${requestScope.trainList12.noTicket}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">列车类型：</td>
            <td colspan="4" class="text_cray"><input name="type" type="text" class="text_cray" id="type" value="${requestScope.trainList12.type}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车体分类：</td>
            <td colspan="4" class="text_cray"><input name="classification" type="text" class="text_cray" id="classification" value="${requestScope.trainList12.classification}"/></td>
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
	$("#startStation").val('${requestScope.trainList12.startStation}');
	$("#endStation").val('${requestScope.trainList12.endStation}');
	$("#startTime").val('${requestScope.trainList12.startTime}');
	$("#endTime").val('${requestScope.trainList12.endTime}');
	$("#time").val('${requestScope.trainList12.time}');
	$("#distance").val('${requestScope.trainList12.distance}');
	$("#noTicket").val('${requestScope.trainList12.noTicket}');	
	$("#type").val('${requestScope.trainList12.type}');
	$("#classification").val('${requestScope.trainList12.classification}');
}

</script>
</body>
</html>
