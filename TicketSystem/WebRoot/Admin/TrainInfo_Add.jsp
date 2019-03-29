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
<!-- <form action="${pageContext.request.contextPath}/TrainServlet"  method="post">
<input type="hidden"  name="method"  value="addTrain" /> -->
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
            <td width="100" height="40" align="left" class="text_cray1">列车名：</td>
            <td colspan="4" class="text_cray"><input name="trainid" type="text" class="text_cray"  id="trainid" value=""/>
            <span class="layui-badge layui-bg-green" id="trainid_info1" style="display:none;">√</span>
            <a id="trainid_info2" style="display:none;">
            <span class="layui-badge"  >×</span>
                                  重复,请重新输入
            </a>
            </td>
            
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">起点站：</td>
            <td colspan="4" class="text_cray"><input name="startStation" type="text" class="text_cray" id="startStation" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">终点站：</td>
            <td colspan="4" class="text_cray"><input name="endStation" type="text" class="text_cray" id="endStation" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">发车时间：</td>
            <td colspan="4" class="text_cray"><input name="startTime" type="text" class="text_cray" id="startTime" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">到达时间：</td>
            <td colspan="4" class="text_cray"><input name="endTime" type="text" class="text_cray" id="endTime" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">历经（小时）：</td>
            <td colspan="4" class="text_cray"><input name="time" type="text" class="text_cray" id="time" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">距离（公里）：</td>
            <td colspan="4" class="text_cray"><input name="distance" type="text" class="text_cray" id="distance" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">票数：</td>
            <td colspan="4" class="text_cray"><input name="noTicket" type="text" class="text_cray" id="noTicket" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">列车类型：</td>
            <td colspan="4" class="text_cray"><input name="type" type="text" class="text_cray" id="type" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车体分类：</td>
            <td colspan="4" class="text_cray"><input name="classification" type="text" class="text_cray" id="classification" value=""/></td>
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
    <td width="99" height="130" align="center"><input name="button" type="button" class="buttj" id="button" value="" onclick="addtrain_info()"></td>
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
function cleantext(){
	$("#trainid").val('');
	$("#startStation").val('');
	$("#endStation").val('');
	$("#startTime").val('');
	$("#endTime").val('');
	$("#time").val('');
	$("#distance").val('');
	$("#noTicket").val('');	
	$("#type").val('');
	$("#classification").val('');
}

function addtrain_info(){
	var trainid = $('#trainid').val();
	var startStation = $('#startStation').val();
	var endStation =$('#endStation').val();
	var startTime = $('#startTime').val();
	var endTime =$('#endTime').val();
	var time = $('#time').val();
	var distance = $('#distance').val();
	var noTicket = $('#noTicket').val();
	var type = $('#type').val();
	var classification = $('#classification').val();
	if(trainid ==""){
		alert("请输入列车名");
		return
	}
	if(startStation ==""){
		alert("请输入起点站");
		return
	}
	if(endStation ==""){
		alert("请输入终点站");
		return
	}
	if(startTime ==""){
		alert("请输入发车时间");
		return
	}
	if(endTime ==""){
		alert("请输入到达时间");
		return
	}
	if(time ==""){
		alert("请输入历经（小时）");
		return
	}
	
	if(distance ==""){
		alert("请输入距离（公里）");
		return
	}
	if(noTicket ==""){
		alert("请输入票数");
		return
	}
	if(type ==""){
		alert("请输入列车类型");
		return
	}
	if(classification ==""){
		alert("请输入车体分类");
		return
	}
	var method = "addTrain";
	$.ajax({
		url:"${pageContext.request.contextPath}/TrainServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{trainid:trainid,
			  startStation:startStation,
			  endStation:endStation,
			  startTime:startTime,
			  endTime:endTime,
			  time:time,
			  distance:distance,
			  noTicket:noTicket,
			  type:type,
			  classification:classification,
			  method:method},
		success:function(data){
			if(data == "true"){
				alert("添加成功");
				document.location.href = "${pageContext.request.contextPath}/TrainServlet?method=findAll";
			}else{
				alert("添加失败");
			}
		}
    });
}


$("#trainid").focus(function(){
	$("#trainid_info1").css("display","none");
	$("#trainid_info2").css("display","none");
}); 

$("#trainid").blur(function(){
	var trainid = $(this).val();
	if(trainid ==""){
		alert("请输入列车名");
		return
	}
	var method = "findtrainid";
	$.ajax({
		url:"${pageContext.request.contextPath}/TrainServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{trainid:trainid,method:method},
		success:function(data){
			if(data == "true"){
				$("#trainid_info2").css("display","");
				return
			}else{
				$("#trainid_info1").css("display","");
			}
		}
    });
	
	
  });
</script>
</body>
</html>
