<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>所有线路管理</title>
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
    <td width="822" align="left" valign="top"  class="text_blod_title">线路管理</td>
  </tr>
  <tr>
    <td height="15" colspan="2" align="center" ><img src="../images/line.jpg" width="850" height="6"></td>
  </tr>
  <tr>
    <td height="15" colspan="2"  ></td>
  </tr>
</table>
<form name="form2" method="post" action="${pageContext.request.contextPath }/LineManageServlet">
 	<input type="hidden"  name="method"  value="findLineManageByDynamic" />

<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="835" background="../images/wb_01 (3).jpg">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5"></td>
        <td width="4%" height="25" align="left" class="text_cray1">站名</td>
        <td width="11%" align="left" class="text_cray1"><label>
          <input name="stationName" type="text" class="text_cray" style="width:80px">
        </label></td>
        <td width="9%" align="center" class="text_cray1">列车号</td>
        <td width="11%" align="left" class="text_cray1"><label>
          <input name="trainCode" type="text" class="text_cray" style="width:80px">
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
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1">选择</td>
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">线路编号</td>
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">列车号</td>
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">车站名</td>
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">始发时间</td>
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">终到时间</td>
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">里程</td>
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">停留时间</td>
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">历时</td>
            <td width="50" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">车站序号</td>
            <td width="53"  height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">操作</td>
          </tr>
          <tr align="center">
            <td height="15" colspan="11" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><img src="../images/line1.jpg" width="790" height="6"></td>
          </tr>
        <c:forEach items="${requestScope.lineManage}" var="sta">
          <tr align="center" bgcolor="#FFFFFF">
            <td bordercolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="${sta.lid }">            </td>
            <td width="50" bordercolor="#FFFFFF"  class="text_cray1">${sta.lid }</td>
            <td width="50" bordercolor="#FFFFFF"  class="text_cray1">${sta.trainCode}</td>
            <td width="50" bordercolor="#FFFFFF"  class="text_cray1">${sta.stationName}</td>
            <td width="50" bordercolor="#FFFFFF"  class="text_cray1">${sta.startTime}</td>
            <td width="50" bordercolor="#FFFFFF"  class="text_cray1">${sta.endTime}</td>
            <td width="50" bordercolor="#FFFFFF"  class="text_cray1">${sta.distance}</td>
            <td width="50" bordercolor="#FFFFFF"  class="text_cray1">${sta.stayTime}</td>
            <td width="50" bordercolor="#FFFFFF"  class="text_cray1">${sta.totalTime}</td>
            <td width="50" bordercolor="#FFFFFF"  class="text_cray1">${sta.stationOrder}</td>
            <td width="53" bordercolor="#FFFFFF"  class="text_cray1"><a href="${pageContext.request.contextPath }/LineManageServlet?lid=${sta.lid }&method=lineinfoedit" class="text_red">编辑</a></td>
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
            <td width="525" align="right"  class="text_cray1"><a href="#">
              <!--<input type="button" name="Submit23" value="新增" onClick="UserAdd()"> -->
            </a></td>
            <td width="55" align="right"  class="text_cray1"><a href="#">
              <input name="Submit22" type="button"  class="layui-btn layui-btn-primary layui-btn-sm" value="删除" onclick="deleteStation()"><!--  class="butsc" class="butdc"-->
            </a></td>
            
            <td width="91" align="right"  class="text_cray1"><label>
              <input name="Submit3" type="button" class="layui-btn layui-btn-primary layui-btn-sm" value="添加" onclick="addStation()">
            </label></td>
          </tr>
        </table>
      <br>
        <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr align="center" style="width:60%">
            <td width="335" align="center"  class="text_cray">&nbsp;</td>
            <td width="284" align="center"  class="text_cray">

        <c:if test="${aa == 1}">   
        <a href="${pageContext.request.contextPath }/LineManageServlet?method=findAll&curpage=1">首页</a>
        <c:forEach begin="${page.lpage}" end="${page.rpage}" var="pageNum">
            <a href="${pageContext.request.contextPath }/LineManageServlet?method=findAll&curpage=${pageNum }">${pageNum }</a>
        </c:forEach>
        <a href="${pageContext.request.contextPath }/LineManageServlet?method=findAll&curpage=${page.last }">尾页</a> 
        </c:if>
        
        <c:if test="${aa == 2}">   
        <a href="${pageContext.request.contextPath }/LineManageServlet?method=findLineManageByDynamic&stationName=${requestScope.stationName}&trainCode=${requestScope.trainCode}&curpage=1">首页</a>
        <c:forEach begin="${page.lpage}" end="${page.rpage}" var="pageNum">
            <a href="${pageContext.request.contextPath }/LineManageServlet?method=findLineManageByDynamic&stationName=${requestScope.stationName}&trainCode=${requestScope.trainCode}&curpage=${pageNum }">${pageNum }</a>
        </c:forEach>
        <a href="${pageContext.request.contextPath }/LineManageServlet?method=findLineManageByDynamic&stationName=${requestScope.stationName}&trainCode=${requestScope.trainCode}&curpage=${page.last }">尾页</a> 
        </c:if>
        
            </td>
            <td width="154" align="right"  class="text_cray1" style="width:20%"><label class="text_cray"> 每页显示 3 条信息</label></td>
            
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
<script type="text/javascript">

function deleteStation(){
	
	var param="";
	var checkboxObj = document.getElementsByName("checkbox");
	for(var i=0;i<checkboxObj.length;i++){
		if(checkboxObj[i].checked == true){
			param+=checkboxObj[i].value+":";
		}
	}
	if(param==""){
		alert("请选择删除项");
		return
	}
	document.location.href = "${pageContext.request.contextPath }/LineManageServlet?method=delete&param="+param;
}
function addStation(){
	document.location.href = "${pageContext.request.contextPath }/Admin/LineManageInfo_Add.jsp";
}

</script>
</body>
</html>
