<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>线路信息修改</title>
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
<form action="${pageContext.request.contextPath}/LineManageServlet" method="post">
<input type="hidden"  name="method"  value="changeLineInfo" />
<input type="hidden"  name="sid"  value="${requestScope.line.lid}" />
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
    <td width="794" height="30" valign="top" class="text_blod_title">修改线路信息</td>
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
            <td width="100" height="40" align="left" class="text_cray1">线路编号：</td>
            <td colspan="4" class="text_cray"><input name="" type="text" class="text_cray" id="" disabled="true" value="${requestScope.line.lid}"/></td>
            <input type="hidden"  name="lid"  value="${requestScope.line.lid}" />
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">列车号：</td>
            <td colspan="4" class="text_cray"><input name="" type="text" class="text_cray" id="" disabled="true" value="${requestScope.line.trainCode}"/></td>
            <input type="hidden"  name="trainCode"  value="${requestScope.line.trainCode}" />
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车站名：</td>
            <td colspan="4" class="text_cray"><input name="" type="text" class="text_cray" id="" disabled="true" value="${requestScope.line.stationName}"/></td>
            <input type="hidden"  name="stationName"  value="${requestScope.line.stationName}" />
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">始发时间：</td>
            <td colspan="4" class="text_cray"><input name="startTime" type="text" class="text_cray" id="startTime" value="${requestScope.line.startTime}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">终到时间：</td>
            <td colspan="4" class="text_cray"><input name="endTime" type="text" class="text_cray" id="endTime" value="${requestScope.line.endTime}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">里程：</td>
            <td colspan="4" class="text_cray"><input name="distance" type="text" class="text_cray" id="distance" value="${requestScope.line.distance}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">停留时间：</td>
            <td colspan="4" class="text_cray"><input name="stayTime" type="text" class="text_cray" id="stayTime" value="${requestScope.line.stayTime}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">历时：</td>
            <td colspan="4" class="text_cray"><input name="totalTime" type="text" class="text_cray" id="totalTime" value="${requestScope.line.totalTime}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车站序号：</td>
            <td colspan="4" class="text_cray"><input name="stationOrder" type="text" class="text_cray" id="stationOrder" value="${requestScope.line.stationOrder}"/></td>
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
	$("#startTime").val('${requestScope.line.startTime}');
	$("#endTime").val('${requestScope.line.endTime}');
	$("#stayTime").val('${requestScope.line.stayTime}');
	$("#distance").val('${requestScope.line.distance}');
	$("#totalTime").val('${requestScope.line.totalTime}');
	$("#stationOrder").val('${requestScope.line.stationOrder}');
}

</script>
</body>
</html>
