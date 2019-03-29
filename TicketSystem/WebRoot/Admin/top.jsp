<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>普通用户</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
<script type="text/JavaScript" src="../js/common.js"></script>
<body class="topbody">
<form action="" method="get">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1411" colspan="2" background="../images/ny_top_img_bg.gif"><img src="../images/ny_top_img.gif" width="650" height="108"></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="75" height="25" bgcolor="#deedf8"></td>
    <td width="1122" align="left" valign="top" bgcolor="#deedf8"><span class="text_cray1">当前位置: 所有用户管理</span></td>
    <td width="140" valign="top" bgcolor="#deedf8" class="text_cray1">欢迎您 ,<%=(String)session.getAttribute("username")%>
   </td>
    <td width="64" align="left" valign="top" bgcolor="#deedf8"><a href="${pageContext.request.contextPath}/UserServlet?method=quit" target="_blank" class="cray">退出</a></td>
  </tr>
</table>

</form>

</body>
</html> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css"  media="all">
</head>
<body>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">12306购票系统后台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <!-- <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul> -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <!-- <img src="#" class="layui-nav-img"> -->
          欢迎您 ,<%=(String)session.getAttribute("username")%> 
        </a>
        <!-- <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl> -->
      </li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/UserServlet?method=quit">注销</a></li>
    </ul>
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
