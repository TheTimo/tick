<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增列车组</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/layui.css"  type="text/css">
</head>

<body class="write_bg">
<!-- <form action="${pageContext.request.contextPath}/TrainGroupServlet"  method="post">
<input type="hidden"  name="method"  value="addTrainGroup" /> -->
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
    <td width="771" height="30" valign="top"  class="text_blod_title">新增列车组信息</td>
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
            <td width="100" height="40" align="left" class="text_cray1">列车组号：</td>
            <td colspan="4" class="text_cray"><input name="gid" type="text" class="text_cray" id="gid" value=""/>
            <span class="layui-badge layui-bg-green" id="gid_info1" style="display:none;">√</span>
            <a id="gid_info2" style="display:none;">
            <span class="layui-badge"  >×</span>
                                  重复,请重新输入
            </a>
            </td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">列车码：</td>
            <td colspan="4" class="text_cray"><input name="gCode" type="text" class="text_cray" id="gCode" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车厢号：</td>
            <td colspan="4" class="text_cray"><input name="gBox" type="text" class="text_cray" id="gBox" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车厢座席类型：</td>
            <td colspan="4" class="text_cray"><input name="gboxType" type="text" class="text_cray" id="gboxType" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车厢座席数量：</td>
            <td colspan="4" class="text_cray"><input name="gchairNum" type="text" class="text_cray" id="gchairNum" value=""/></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">车厢类型：</td>
            <td colspan="4" class="text_cray"><input name="gchairType" type="text" class="text_cray" id="gchairType" value=""/></td>
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
    <td width="99" height="130" align="center"><input name="button" type="button" class="buttj" id="button" value="" onclick="addtraingroup_info()"></td>
    <td width="98" ></td>
<!-- </form>  -->
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
	$("#gid").val('');
	$("#gCode").val('');
	$("#gBox").val('');
	$("#gboxType").val('');
	$("#gchairNum").val('');
	$("#gchairType").val('');
}

function addtraingroup_info(){
	var gid = $('#gid').val();
	var gCode = $('#gCode').val();
	var gBox =$('#gBox').val();
	var gboxType = $('#gboxType').val();
	var gchairNum =$('#gchairNum').val();
	var gchairType = $('#gchairType').val();
	if(gid ==""){
		alert("请输入列车组号");
		return
	}
	if(gCode ==""){
		alert("请输入列车码");
		return
	}
	if(gBox ==""){
		alert("请输入车厢号");
		return
	}
	if(gboxType ==""){
		alert("请输入车厢座席类型");
		return
	}
	if(gchairNum ==""){
		alert("请输入车厢座席数量");
		return
	}
	if(gchairType ==""){
		alert("请输入车厢类型");
		return
	}
	var method = "addTrainGroup";
	$.ajax({
		url:"${pageContext.request.contextPath}/TrainGroupServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{gid:gid,
			  gCode:gCode,
			  gBox:gBox,
			  gboxType:gboxType,
			  gchairNum:gchairNum,
			  gchairType:gchairType,
			  method:method},
		success:function(data){
			if(data == "true"){
				alert("添加成功");
				document.location.href = "${pageContext.request.contextPath}/TrainGroupServlet?method=findAll";
			}else{
				alert("添加失败");
			}
		}
    });
}

$("#gid").focus(function(){
	$("#gid_info1").css("display","none");
	$("#gid_info2").css("display","none");
}); 

$("#gid").blur(function(){
	var gid = $(this).val();
	if(gid ==""){
		alert("请输入列车组号");
		return
	}
	var method = "findgid";
	$.ajax({
		url:"${pageContext.request.contextPath}/TrainGroupServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{gid:gid,method:method},
		success:function(data){
			if(data == "true"){
				$("#gid_info2").css("display","");
				return
			}else{
				$("#gid_info1").css("display","");
			}
		}
    });
	
	
  });
</script>
</body>
</html>
