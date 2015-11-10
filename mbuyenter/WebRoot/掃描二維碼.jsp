<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>掃描二維碼</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
	<script type="text/javascript" src="js/query.qrcode.js"></script>
	<script type="text/javascript" src="js/qrcode.js"></script>
    <script>
			 jQuery('#qrcode').qrcode({
			    render	: "table",//也可以替换为table
				width   : 35,
				height  :42,
				foreground: "#fff",
			    background: "#ff0a4f",
				text	: "http://www.jq22.com/jquery-info294"
			});
		</script>
  </head>
  
  <body>
    <span id="qrcode" style="float:right;"></span>
  </body>
</html>
