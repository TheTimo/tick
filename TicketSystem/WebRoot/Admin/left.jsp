<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
body {
	background-image: url(../images/bg_point1.gif);
	margin-top: 0px;
}
-->
</style></head>

<body>
<table width="247" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="17" colspan="2" align="left" valign="bottom">&nbsp;</td>
  </tr>
  <tr>
    <td width="75">&nbsp;</td>
    <td width="165" height="35"><span class="text_blod">管理员</span></td>
  </tr>
  <tr>
    <td align="right"><img src="../images/ny_arrow1.gif" width="24" height="13"></td>
    <td height="35"><a href="${pageContext.request.contextPath}/AdminServlet?method=findAll" target="mainFrame" class="cray">用户管理</a></td>
  </tr>
  <tr>
    <td align="right"><img src="../images/ny_arrow1.gif" width="24" height="13"></td>
    <td height="35"><a href="UserInfo_Add.jsp" target="mainFrame" class="cray">新增用户</a></td>
  </tr>
</table>
</body>
</html> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
<link rel="stylesheet" href="../css/layui.css"  media="all">
</head>
<body>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">用户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/AdminServlet?method=findAll" target="mainFrame">用户管理</a></dd>
            <dd><a href="UserInfo_Add.jsp" target="mainFrame">新增用户</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">数据管理</a>
          <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/StationServlet?method=findAll" target="mainFrame">车站管理</a></dd>
            <dd><a href="${pageContext.request.contextPath}/TrainServlet?method=findAll" target="mainFrame">列车管理</a></dd>
            <dd><a href="${pageContext.request.contextPath}/LineManageServlet?method=findAll" target="mainFrame">线路管理</a></dd>
            <dd><a href="${pageContext.request.contextPath}/TrainGroupServlet?method=findAll" target="mainFrame">列车编组管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a class="" href="javascript:;">订单</a>
          <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/AdminServlet?method=findCartAll" target="mainFrame">订单管理</a></dd>
          </dl>
        </li>
        <!-- <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">发布商品</a></li> -->
      </ul>
    </div>
  </div>
<script src="../js/layui.all.js" charset="utf-8"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>
