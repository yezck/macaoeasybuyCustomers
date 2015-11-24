<%@page import="customerEnter.tool.DataTimeNumber"%>
<%@page import="customerEnter.bean.shangpin.Area"%>
<%@page import="customerEnter.dao.shop.CustomerShopDao"%>
<%@page import="customerEnter.bean.shangpin.ShangPin"%>
<%@page import="customerEnter.bean.store.Shop"%>
<%@page import="customerEnter.bean.customerUser.Customers"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Customers CustomerValue=(Customers)session.getAttribute("CustomerValue");//登入的客戶


Shop shop =(Shop)session.getAttribute("shop");
ArrayList<ShangPin> shangpins =(ArrayList<ShangPin>)session.getAttribute("shangpins");

String shangpinId=(String)request.getParameter("shangpin");
int ShangpinID=Integer.parseInt(shangpinId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>店鋪首頁</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/scroll.js"></script>
	<script src="js/clamp.js" type="text/javascript"></script>
    <script src="js/clamp.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  
  <body >
  <center><h1>測試數據，添加商品到購物籃</h1></center>
  
  <div class="modal-dialog" style="width: 25%">
														<div class="modal-content">
															<div class="modal-header">
																<img src="images/buy.png" class="pm_img1" style="float:left;padding-left: 23px;"> 
																<span class="pm_shot" style="float:left;margin: 27px 0 0 15px;">加入購物車</span>
															</div>
  
  <form action="JoinUserCartServlet" name="JoinUserCartServlet" method="post">
   <%if(shangpins!=null){ %>
				 <%for(int i=0;i<shangpins.size();i++){
				 if(ShangpinID==shangpins.get(i).getId()){
				  %>   
	<table>
						<tr><th>規格一：</th><th>
						
						                  <input type="hidden" name="shopId" value="<%=shop.getId()%>">
			                             <input type="hidden" name="userId" value="<%=CustomerValue.getId()%>">
			                             <input type="hidden" name="goodsId" value="<%=shangpins.get(i).getId()%>">
					              	<%
					              	 String tupianString;
									    if(shangpins.get(i).getTupian()==null||shangpins.get(i).getTupian().trim().length()<=0){
									    tupianString="";
									 %>
									 <input type="radio" name="GuigeImage" value="<%=0 %>" checked="checked">
				                      <img src="images/footprint.png" id="tupian"  border="2" style="width:68px;height:68px;margin-right: 5px;"><i></i>
									 <%}else{
									    tupianString=shangpins.get(i).getTupian();
						              String[] tupian=DataTimeNumber.StringInventory(tupianString);
						              if(tupian.length==0){%>
						              <img src="images/footprint.png" id="tupian"  border="2" style="width:68px;height:68px;margin-right: 5px;"><i></i>
						              <%} %>
						              <%
									    for(int ii=0;ii<tupian.length;ii++){
			                                if(tupian.length==1&&tupian[0].trim().length()==0){
				                        %>
				                        <input type="radio" name="GuigeImage" value="<%=ii %>" checked="checked">
				                        <img src="images/footprint.png" id="tupian"  border="2" style="width:68px;height:68px;margin-right: 5px;"><i></i>
				                        <%
			                                }else if(tupian.length==0){
				                          %>
				                        <input type="radio" name="GuigeImage" value="<%=ii %>" checked="checked">
				                        <img src="images/footprint.png" id="tupian"  border="2" style="width:68px;height:68px;margin-right: 5px;"><i></i>
				                        <%
			                                }else{
			                            %>
			                             <input type="radio" name="GuigeImage" value="<%=ii %>" checked="checked">
			                             <img src="http://wap.macaoeasybuy.com/<%=tupian[ii] %>" id="tupian"  border="2" style="width:68px;height:68px;margin-right: 5px;"><i></i>
			                            <%
			                                }
		                                    }
		                                    }
									    %>
						</th></tr>
						
						<tr><th></th><th><br></th></tr>
						
						<tr><th>規格二：</th><th>
						<%
							List<String>guigetow= DataTimeNumber.getGuigeTwo(shangpins.get(i).getGuige());
							if(guigetow.size() ==0){
							out.println("尺碼統一");%>
							<input type="radio" name="Size" value="" checked="checked">
							<%}else{
					     %>
					     <%for(int l=0;l<guigetow.size();l++){ %>
							<input type="radio" name="Size" value="<%=guigetow.get(l) %>" checked="checked"><%=guigetow.get(l) %>
						<%
						} 
						} 
						%>
						</th>
						</tr>
						
						<tr><th></th><th><br></th></tr>
						
						<tr><th>數量</th><th>
						<div class="input-group skb_btgroup" style="">
							<div class="input-group-btn">
			                 <button class="btn skb_btnadd" type="button" onclick="DeleteNum();"><span class="skb_addbtic">-</span></button>
			               </div><!-- /btn-group -->
			               <input type="text" class="form-control skb_addtxt" placeholder="0" id="NumEveryTotal" name="NumEveryTotal" value="1">
			               <span class="input-group-btn">
			                 <button type="button" class="btn skb_btnadd dropdown-toggle" onclick="AddNum();"><span class="skb_addbtic">+</span></button>
			               </span>
			            </div>
						</th></tr>
						<tr>
						<th></th><th>
						<br><br><br>
						</th>
						</tr>
						
						<tr>
						<th></th>
						<th>
						<button type="button" class="guige" style="background-color:#ff5b77;" onclick="AddSubmit();">確定</button>
						<button class="guige" type="button" style="background-color:#CACACA;">取消</button> </th>
						</tr>
						<tr>
						<th></th><th>
						<br>
						</th>
						</tr>
						</table>
						<script type="text/javascript">
						function AddSubmit(){
						document.JoinUserCartServlet.submit();
						}
						function DeleteNum(){
						var num=document.getElementById("NumEveryTotal").value;
						if(num<=1){
						  document.getElementById("NumEveryTotal").value=num;
						}else{
						num--;
						document.getElementById("NumEveryTotal").value=num;
						}
						}
						function AddNum(){
						var num=document.getElementById("NumEveryTotal").value;
						num++;
						document.getElementById("NumEveryTotal").value=num;
						}
						</script>
<%} %>
<%} %>
<%} %>
</form>
</div>
</div>

  </body>
</html>
