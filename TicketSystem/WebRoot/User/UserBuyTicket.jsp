<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购买车票</title>
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css"  media="all">
<script language="javascript">
	function UserAdd(){
	window.navigate("UserInfo_Add.html");
	}
</script>
<script>
function selectAllNullorReserve(obj,type){
   if(obj!=null&&obj!=""){
    if(document.getElementsByName(obj)!=undefined&&document.getElementsByName(obj).length>0){	//getElementsByName函数的作用按名字查找对象，返回一个数组。
     var userids = document.getElementsByName(obj);
     if(type=="全选"){
      for(var i=0;i<userids.length;i++){
       if(userids[i].checked == false){
        userids[i].checked = true;
       }
      }
     }else if(type=="全不选"){
      for(var i=0;i<userids.length;i++){
       if(userids[i].checked == true){
        userids[i].checked = false;
       }
      }
     }else if(type=="反选"){
      for(var i=0;i<userids.length;i++){
       if(userids[i].checked == true){
        userids[i].checked = false;
       }else{
        userids[i].checked = true;
       }
      }
     }
    }
   }  
}
</script>
</head>
<body class="write_bg">


<table width="1107" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"></td>
  </tr>
</table>
<table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" ></td>
  </tr>
  <tr>
    <td width="13" height="30" align="left" valign="top"  ></td>
    <td width="822" align="left" valign="top"  class="text_blod_title">购买车票</td>
  </tr>
  <tr>
    <td height="15" colspan="2" align="center" ><img src="../images/line.jpg" width="850" height="6"></td>
  </tr>
  <tr>
    <td height="15" colspan="2"  ></td>
  </tr>
</table>
<form name="form2" method="post" action="${pageContext.request.contextPath }/BuyTicketServlet">
 	<input type="hidden"  name="method"  value="findBuyTicketByDynamic" />

<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="835" background="../images/wb_01 (3).jpg">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5"></td>
        <td width="5%" height="25" align="left" class="text_cray1">起点：</td>
        <td width="11%" align="left" class="text_cray1"><label>
          <input name="startStation" type="text" class="text_cray" style="width:80px">
        </label></td>
        
        
        <td width="5%" height="25" align="left" class="text_cray1">终点：</td>
        <td width="11%" align="left" class="text_cray1"><label>
          <input name="endStation" type="text" class="text_cray" style="width:80px">
        </label></td>
        
        <td width="8%" align="center" valign="middle" class="text_craybold"><label>
          <input name="Submit" type="submit" class="layui-btn layui-btn-primary layui-btn-sm" value="查询">
        </label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="20" colspan="11" align="center">&nbsp;</td>
      </tr>
    </table>
</form>


        <table width="553" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#dadada" bgcolor="#FFFFFF">
          <tr align="center">
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1">选择</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">列车名</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">起点站</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">终点站</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">发车时间</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">到达时间</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">历经</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">距离</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">票数</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">列车类型</td>
            <td width="46" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">车体分类</td>
            <td width="47"  height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">价格</td>
          </tr>
          <tr align="center">
            <td height="15" colspan="12" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><img src="../images/line1.jpg" width="790" height="6"></td>
          </tr>
        <c:forEach items="${requestScope.trainList}" var="sta">
          <tr width="46" align="center" bgcolor="#FFFFFF">
            <td bordercolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="${sta.trainid }">            </td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.trainid}</td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.startStation }</td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.endStation}</td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.startTime}</td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.endTime}</td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.time}</td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.distance}</td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.noTicket}</td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.type}</td>
            <td width="46" bordercolor="#FFFFFF"  class="text_cray1">${sta.classification}</td>
            <td width="47" bordercolor="#FFFFFF"  class="text_cray1">120元</td>
          </tr>
      </c:forEach>
       
        </table>
      <br>
        <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr align="center">
            <td width="102" align="left"  class="text_cray1"><a href="#">
              <label></label>
              <label></label>
              <label>
              <input type="checkbox" name="checkbox2" value="11"  onclick="selectAllNullorReserve('checkbox','反选');" ><span class="text_blue">全选</span></label>
            </a></td>
            
            <td width="91" align="right"  class="text_cray1"><label>
              <input name="Submit3" type="button" class="layui-btn layui-btn-primary layui-btn-sm" value="购买" onclick="buy()">
            </label></td>
          </tr>
        </table>
      <br>
        <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr align="center" style="width:60%">
            <td width="335" align="center"  class="text_cray">&nbsp;</td>
          </tr>
        </table>
      <br></td>
  </tr>
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
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
<script type="text/javascript">

function buy(){
	var userid ="<%=(int)session.getAttribute("userid")%>";
	var realname="<%=(String)session.getAttribute("realname")%>";
	
	var param="";
	var checkboxObj = document.getElementsByName("checkbox");
	for(var i=0;i<checkboxObj.length;i++){
		if(checkboxObj[i].checked == true){
			param+=checkboxObj[i].value+"A";
		}
	}
	if(param==""){
		alert("请选择需要购买的车票");
		return
	}
	var method = "BuyTicket";
	
	$.ajax({
		url:"${pageContext.request.contextPath}/BuyTicketServlet",
		async:true,
		cache:false,
		type:"post",
		dateType:"text",
		data:{param:param,realname:realname,userid:userid,method:method},
		success:function(data){
			if(data == "true"){
				alert("购买成功");
				document.location.href = "${pageContext.request.contextPath}/BuyTicketServlet?method=findCartAll&userid=<%=(int)session.getAttribute("userid")%>";
				return
			}else{
				alert("购买失败，请重新尝试");
			}
		}
    });
}

</script>
</body>
</html>
