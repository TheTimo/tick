<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增车站信息</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/layui.css"  type="text/css">
</head>

<body class="write_bg">
<!-- <form action="${pageContext.request.contextPath}/StationServlet"  method="post">
<input type="hidden"  name="method"  value="addStation" /> -->
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="30">
       </td>
    </tr>
  </table>
<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" ></td>
  </tr>
  <tr>
    <td width="64" height="30"  ></td>
    <td width="771" height="30" valign="top"  class="text_blod_title">新增车站信息</td>
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
            <td width="100" height="40" align="left" class="text_cray1">车站名：</td>
            <td width="14"></td>
            <td colspan="3" align="left"><input name="stationName" type="text" class="text_cray" id="stationName" /></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车站英文名：</td>
            <td width="14"></td>
            <td colspan="3" align="left"><input name="stationEnglish" type="text" class="text_cray" id="stationEnglish" /></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">所属铁路局：</td>
            <td width="14"></td>
            <td colspan="3" align="left"><input name="belongTo" type="text" class="text_cray" id="belongTo" /></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车站等级：</td>
            <td width="14"></td>
            <td colspan="3" align="left"><input name="stationRank" type="text" class="text_cray" id="stationRank" /></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">所属行政区域：</td>
            <td width="14"></td>
            <td colspan="3" align="left"><input name="administrativeArea" type="text" class="text_cray" id="administrativeArea" /></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">联系地址：</td>
            <td width="14"></td>
            <td colspan="3" align="left"><input name="address" type="text" class="text_cray" id="address" /></td>
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
    <td width="99" height="130" align="center"><input name="button" type="button" class="buttj" id="button" value="" onclick="addstation_info()"></td>
    <td width="98" ></td>
<!-- </form> -->
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
function cleantext(){
	$('#stationName').val('');
	$('#stationEnglish').val('');
	$('#belongTo').val('');
	$('#stationRank').val('');
	$('#administrativeArea').val('');
	$('#address').val('');
}

function addstation_info(){
	var stationName = $('#stationName').val();
	var stationEnglish = $('#stationEnglish').val();
	var belongTo =$('#belongTo').val();
	var stationRank = $('#stationRank').val();
	var administrativeArea =$('#administrativeArea').val();
	var address = $('#address').val();
	if(stationName ==""){
		alert("请输入车站名");
		return
	}
	if(stationEnglish ==""){
		alert("请输入车站英文名");
		return
	}
	if(belongTo ==""){
		alert("请输入所属铁路局");
		return
	}
	if(stationRank ==""){
		alert("请输入车站等级");
		return
	}
	if(administrativeArea ==""){
		alert("请输入所属行政区域");
		return
	}
	if(address ==""){
		alert("请输入联系地址");
		return
	}
	var method = "addStation";
	$.ajax({
		url:"${pageContext.request.contextPath}/StationServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{stationName:stationName,stationEnglish:stationEnglish,belongTo:belongTo,stationRank:stationRank,administrativeArea:administrativeArea,address:address,method:method},
		success:function(data){
			if(data == "true"){
				alert("添加成功");
				document.location.href = "${pageContext.request.contextPath}/StationServlet?method=findAll";
			}else{
				alert("添加失败");
			}
		}
    });
}
</script>
</body>
</html>
