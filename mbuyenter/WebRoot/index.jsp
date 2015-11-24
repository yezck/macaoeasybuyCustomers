<%@page import="customerEnter.bean.customerUser.Customers"%>
<%@page import="customerEnter.bean.store.Shop"%>
<%@page import="customerEnter.dao.shop.CustomerShopDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ArrayList<Shop> Shops=(ArrayList<Shop>)CustomerShopDao.CustomerAllShop();
Customers CustomerValue=(Customers)session.getAttribute("CustomerValue");//登入的客戶
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
  <center>
  <h1 align="center"><a href="/easyBuyMall/EnterCartServlet?iUserid=<%=CustomerValue.getId()%>">點擊進入購物車</a></h1>
  <table width="50%">
  <%if(Shops!=null){ 
  for(int i=0;i<Shops.size();i++){
  %>
  <tr>
  <% 
      for(int j=0;j<1;j++){
  %>
  <th><a href="/easyBuyMall/EnterShopServlet?iUserid=<%=CustomerValue.getId()%>&iShopId=<%=Shops.get(i).getId()%>"><img alt="" src="http://wap.macaoeasybuy.com/<%=Shops.get(i).getLogo()%>" width="150px" height="80px"></a></th>
  <th><h2><%=Shops.get(i).getShopname() %><h2></h2><hr></th>
  
  <%}%>
  </tr>
  <%}%>
  <%} %>
  </table>
  </center>
  </body>
</html>
