<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/layui.css"  media="all">
</head>
<body class="topbody">
<div class="layui-layout layui-layout-admin">
<div class="layui-header">
    <div class="layui-logo">12306购票系统</div>
    
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="UserManageInfo.jsp" target="mainFrame">查看个人信息</a></li>
      <li class="layui-nav-item"><a href="UserPassword_Edit.jsp" target="mainFrame">普通用户密码修改</a></li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/BuyTicketServlet?method=findtrainAll" target="mainFrame">购买车票</a></li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/BuyTicketServlet?method=findCartAll&userid=<%=(int)session.getAttribute("userid")%>" target="mainFrame">订单</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
		  <img src="#" class="layui-nav-img">
              <%=(String)session.getAttribute("loginname")%>
        </a>
      </li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/UserServlet?method=quit">注销</a></li>
    </ul>
  </div>
  </div>

<script src="../js/layui.all.js" charset="utf-8"></script>
<script>

layui.use('element', function(){
  var element = layui.element;
  
});
</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>
