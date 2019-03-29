<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增线路信息</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/layui.css"  type="text/css">
</head>

<body class="write_bg">
<!-- <form action="${pageContext.request.contextPath}/LineManageServlet"  method="post">
<input type="hidden"  name="method"  value="addLine" /> -->
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
    <td width="771" height="30" valign="top"  class="text_blod_title">新增线路信息</td>
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
            <td width="100" height="40" align="left" class="text_cray1">线路编号：</td>
            <td colspan="4" class="text_cray"><input name="lid" type="text" class="text_cray" id="lid" value="${requestScope.line.lid}"/>
            
            <span class="layui-badge layui-bg-green" id="lid_info1" style="display:none;">√</span>
            <a id="lid_info2" style="display:none;">
            <span class="layui-badge"  >×</span>
                                  重复,请重新输入
            </a>
            </td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">列车号：</td>
            <td colspan="4" class="text_cray"><input name="trainCode" type="text" class="text_cray" id="trainCode" value="${requestScope.line.trainCode}"/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车站名：</td>
            <td colspan="4" class="text_cray"><input name="stationName" type="text" class="text_cray" id="stationName" value="${requestScope.line.stationName}"/></td>
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
</table><br>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="164"></td>
    <td width="99" height="130" align="center"><input name="button" type="button" class="buttj" id="button" value="" onclick="addline_info()"></td>
    <td width="98" ></td>
<!-- </form>   -->
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
	$('#lid').val('');
	$('#trainCode').val('');
	$('#stationName').val('');
	$('#startTime').val('');
	$('#endTime').val('');
	$('#distance').val('');
	$('#stayTime').val('');
	$('#totalTime').val('');
	$('#stationOrder').val('');
}

function addline_info(){
	var lid = $('#lid').val();
	var trainCode = $('#trainCode').val();
	var stationName =$('#stationName').val();
	var startTime = $('#startTime').val();
	var endTime =$('#endTime').val();
	var distance = $('#distance').val();
	var stayTime = $('#stayTime').val();
	var totalTime = $('#totalTime').val();
	var stationOrder = $('#stationOrder').val();
	if(lid ==""){
		alert("请输入线路编号");
		return
	}
	if(trainCode ==""){
		alert("请输入列车号");
		return
	}
	if(stationName ==""){
		alert("请输入车站名");
		return
	}
	if(startTime ==""){
		alert("请输入始发时间");
		return
	}
	if(endTime ==""){
		alert("请输入到达时间");
		return
	}
	if(distance ==""){
		alert("请输入里程");
		return
	}
	
	if(stayTime ==""){
		alert("请输入停留时间");
		return
	}
	if(totalTime ==""){
		alert("请输入历时");
		return
	}
	if(stationOrder ==""){
		alert("请输入车站序号");
		return
	}
	
	var method = "addLine";
	$.ajax({
		url:"${pageContext.request.contextPath}/LineManageServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{lid:lid,
			  trainCode:trainCode,
			  stationName:stationName,
			  startTime:startTime,
			  endTime:endTime,
			  distance:distance,
			  stayTime:stayTime,
			  totalTime:totalTime,
			  stationOrder:stationOrder,
			  method:method},
		success:function(data){
			if(data == "true"){
				alert("添加成功");
				document.location.href = "${pageContext.request.contextPath}/LineManageServlet?method=findAll";
			}else{
				alert("添加失败");
			}
		}
    });
}


$("#lid").focus(function(){
	$("#lid_info1").css("display","none");
	$("#lid_info2").css("display","none");
}); 

$("#lid").blur(function(){
	var lid = $(this).val();
	if(lid ==""){
		alert("请输入线路编号");
		return
	}
	var method = "findlid";
	$.ajax({
		url:"${pageContext.request.contextPath}/LineManageServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{lid:lid,method:method},
		success:function(data){
			if(data == "true"){
				$("#lid_info2").css("display","");
				return
			}else{
				$("#lid_info1").css("display","");
			}
		}
    });
	
	
  });
</script>
</body>
</html>
