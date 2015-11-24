<%@page import="customerEnter.bean.shangpin.ShangPinLabel"%>
<%@page import="customerEnter.dao.goodsdao.ShangPinManagedao"%>
<%@page import="customerEnter.bean.store.Shop"%>
<%@page import="customerEnter.tool.DataTimeNumber"%>
<%@page import="customerEnter.bean.shangpin.ShangPin"%>
<%@page import="customerEnter.dao.order.CustomerShoppingDao"%>
<%@page import="customerEnter.dao.UserManageDao.CustomerUserMop_PointDao"%>
<%@page import="customerEnter.bean.shopping.ShoppingCart"%>
<%@page import="customerEnter.bean.customerUser.UserPoint"%>
<%@page import="customerEnter.bean.customerUser.UserMop"%>
<%@page import="customerEnter.bean.customerUser.Customers"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";



Customers CustomerValue=(Customers)session.getAttribute("CustomerValue");//登入的客戶


/*
UserMop usermop=(UserMop)session.getAttribute("usermop");//會員紅包信息
UserPoint userpoint=(UserPoint)session.getAttribute("userpoint");//會員積分信息
ArrayList<ShoppingCart> shoppingcart=(ArrayList<ShoppingCart>)session.getAttribute("shoppingcart");////根據登錄會員的id來獲取購物車中對應的商品信息
*/

         UserMop usermop=CustomerUserMop_PointDao.GetOnlyUserMop(CustomerValue.getId());//會員紅包信息
		UserPoint userpoint=CustomerUserMop_PointDao.GetOnlyUserPoint(CustomerValue.getId());//會員積分信息
		 ArrayList<ShoppingCart> shoppingcart=CustomerShoppingDao.CustomerShoppingCart(CustomerValue.getId());//根據登錄會員的id來獲取購物車中對應的商品信息
	
	ArrayList<ShangPin>ListUsershangpin=(ArrayList<ShangPin>)session.getAttribute("ListUsershangpin");//會員有關的全部商品
	ArrayList<Shop> ListShop=(ArrayList<Shop>)session.getAttribute("ListShop");//會員有關的全部商品的店鋪
	ArrayList<ShangPinLabel> shangpinlebelList=(ArrayList<ShangPinLabel>)session.getAttribute("shangpinlebelList");//商品活動標籤
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>購物籃</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="flat/red.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/jquery.webui-popover.min.css"> 
	<script src="js/jquery.min.js"></script>
	<script src="js/clamp.js" type="text/javascript"></script><!-- 文字溢出處理js -->
    <script src="js/clamp.min.js" type="text/javascript"></script><!-- 文字溢出處理js -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.webui-popover.min.js"></script>	
    <script src="js/icheck.js"></script>
    <script>
      $(document).ready(function(){
		  $('input').iCheck({
		    checkboxClass: 'icheckbox_flat-red',
		    radioClass: 'iradio_square-red',
		    increaseArea: '20%' // optional
		  });
		});
		function getRTime(){ 
		var EndTime= new Date('2016/1/1 00:00:00:000'); //截止时间 
		var NowTime = new Date(); 
		var t =EndTime.getTime() - NowTime.getTime(); 
		 
		var d=Math.floor(t/1000/60/60/24); 
		var h=Math.floor(t/1000/60/60%24); 
		var m=Math.floor(t/1000/60%60); 
		var s=Math.floor(t/1000%60); 
		var mm=Math.floor(t/100%100); 
		 
		document.getElementById("t_d").innerHTML = d + "天"; 
		document.getElementById("t_h").innerHTML = h + "时"; 
		document.getElementById("t_m").innerHTML = m + "分"; 
		document.getElementById("t_s").innerHTML = s + "秒"; 
		document.getElementById("t_mm").innerHTML = mm + "秒"; 
		} 
		setInterval(getRTime,100); 
		/*文字滾動*/
		function AutoScroll(obj){
		$(obj).find("ul:first").animate({
		marginTop:"-25px"
		},500,function(){
		$(this).css({marginTop:"0px"}).find("li:first").appendTo(this);
		});
		}
		$(document).ready(function(){
		setInterval('AutoScroll("#scrollDiv_keleyi_com")',3000);
		});
		$(document).ready(function(){
		setInterval('AutoScroll("#scrollDiv_keleyi_com1")',3000);
		});
		$(document).ready(function(){
		setInterval('AutoScroll("#scrollDiv_keleyi_com2")',3000);
		});
		$(document).ready(function(){
		setInterval('AutoScroll("#scrollDiv_keleyi_com3")',3000);
		});
    </script>
    <style>
      .form-control{
        height:50px;
        border-radius:0;
        border:none;
        color:#ff5b77;
        font-size:1.6rem !important;
      }
      .input-group{
        border:1px solid #ff5b77;
      }
      .nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover
		{
		color: #fff !important;
		cursor: default !important;
		background-color: #ff5b77 !important;
		border:none;
	}
	.nav-tabs>li{
	  margin-bottom:0;
	}
	.nav-tabs>li>a{
	  border: 1px solid #fff;
	  border-bottom:none;
	}
	.popover-title{
	  font-size: 16px;
	  padding:20px 14px 8px 14px !important;
	  background-color:#fff !important;
	  color:#ff5b77 !important;
	  border:none;
    }
    .popover{
      max-width:360px !important;
      font-size:15px !important;
    }
    </style>
  </head>
  
<body style="background:url(images/index_back.png);background-attachment:fixed;">
    <header class="hea" style="">
      <div class="sbk">
          <ul class="breadcrumb" style="float: left;">
		  <li><a href="http://192.168.1.9:8080/sdsss/index.jsp" class="hea_a">&nbsp;宜買首頁&nbsp;</a></li>
		  <li><a href="#" class="hea_a">&nbsp;宜生活&nbsp;</a></li>
		  <li><a href="http://192.168.1.9:8080/sdsss/Login.jsp" class="hea_a">&nbsp;店主登入&nbsp;</a></li>
		 </ul>
		  <ul class="breadcrumb" style="float: right;">
		  <li><a href="#" class="hea_a">&nbsp;<span style="">Hi,<span><%=CustomerValue.getName() %></span></span>
		      <span class="skb_hea_lv">
				<span>Lv.</span>
				<span>0</span>
				</span>&nbsp;</a>
		  </li>
		  <li><a href="#" class="hea_a">&nbsp;心動<span style="color:black;">18</span>&nbsp;</a></li>
		  <li><a href="#" class="hea_a">&nbsp;購物籃<span style="color:black;">4</span>/100&nbsp;</a></li>
		  <li><a href="#" class="hea_a">&nbsp;紅包<span style="color:black;"><span>$</span><%=usermop.getMop() %></span>積分<span style="color:black;"><span>$</span><%=userpoint.getPoint() %></span>&nbsp;</a></li>
		  <li><a href="#" class="hea_a">&nbsp;足跡&nbsp;</a></li>
		  <li><a href="#" class="hea_a">&nbsp;分享好友&nbsp;</a></li>
		  <li><a href="#" class="hea_a">&nbsp;APP下載&nbsp;</a></li>
		 </ul>
	  </div>
	</header>
	<div class="sbk_container">
	   <div class="row" style="margin:0;">
	     <div class="col-xs-12 col-sm-12" style="padding:0;">
	       <div class="skb_guid">
	         <ul class="skb_guide_ul">
	           <li class="skb_guid_li">
	             <a href="cart.jsp">
	               <img src="images/1.png" class="skb_guid_img">
	               <div class="skb_txt">購物籃(<span>7</span>)</div>
	             </a>
	           </li>
	           <li class="skb_guid_li">
	             <a href="#">
	               <img src="images/2a.png" class="skb_guid_img">
	               <div class="skb_txt">待發貨(<span>1</span>)</div>
	             </a>
	           </li>
	           <li class="skb_guid_li">
	             <a href="#">
	               <img src="images/3a.png" class="skb_guid_img">
	               <div class="skb_txt">待簽收(<span>1</span>)</div>
	             </a>
	           </li>
	           <li class="skb_guid_li">
	             <a href="#">
	               <img src="images/4a.png" class="skb_guid_img">
	               <div class="skb_txt">待評價(<span>1</span>)</div>
	             </a>
	           </li>
	           <li class="skb_guid_li">
	             <a href="#">
	               <img src="images/5a.png" class="skb_guid_img">
	               <div class="skb_txt">已完成(<span>1</span>)</div>
	             </a>
	           </li>
	         </ul>
	         <div style="float:left;"><img src="images/guide_s.png"></div>
	       </div>
	       <div class="skb_search">
	         <div class="col-xs-12 col-sm-12" style="padding:0;">
		         <div class="input-group" style="margin:70px 0 0 10px;">
					<div class="input-group-btn">
	                  <button type="button" class="btn skb_search_se dropdown-toggle" data-toggle="dropdown">
	                                                     搜商品
	                     <span class="caret"></span>
	                  </button>
	                  <ul class="dropdown-menu">
	                     <li><a href="#">搜零食</a></li>
	                  </ul>
	               </div><!-- /btn-group -->
	               <input type="text" class="form-control" placeholder="房間濕透透？我要抽濕機！">
	               <span class="input-group-btn">
	                  <button class="btn skb_search_btn" type="button">
	                     <img src="images/search.png" style="width:35px;">
	                  </button>
	               </span>
	            </div>
	          </div>
	          <div class="col-xs-12 col-sm-12" style="padding:3px 15px;">
	            <span class="skb_search_txt">靜音風扇</span>
	            <span class="skb_search_txt">修身打底褲</span>
	            <span class="skb_search_txt">時尚運動鞋</span>
	            <span class="skb_search_txt">英倫女裝皮鞋</span>
	            <span class="skb_search_txt">單肩包包</span>
	          </div>
	       </div>
	     </div>
	     
	     <div class="col-xs-12 col-sm-12" style="padding:0;">
	       <div class="skb_in">
		     <ul id="myTab" class="nav nav-tabs login_li">
			   <li class="active" style=""><a href="#allshop" class="skb_li_a" data-toggle="tab">全部商品&nbsp;<span>4</span>/<span>100</span></a></li>
			   <li class=""><a href="#selldown" class="skb_li_a" data-toggle="tab">降價商品&nbsp;<span>1</span></a></li>
			   <li class=""><a href="#sellout" class="skb_li_a" data-toggle="tab">即將售清&nbsp;<span>1</span></a></li>
		       <li class=""><a href="#shopdown" class="skb_li_a" data-toggle="tab">下架商品&nbsp;<span>1</span></a></li>
		     </ul>
		     <div id="myTabContent" class="tab-content skb_s" >
		     <!--全部商品  -->
			   <div class="tab-pane fade in active" id="allshop" style="">
			     <div class="row" style="padding:0;">
			       <div class="col-xs-12 col-sm-12" style="padding: 20px 0 20px 10px;">
			         <div class="skb_left skb_ck"><input type="checkbox" value="" onclick="">&nbsp;<span style="margin-left: 35px;">全選</span></div>
			         <div class="skb_left skb_inf">商品信息</div>
			         <div class="skb_left skb_inn">商品規格</div>
			         <div class="skb_left skb_inp">單價(MOP)</div>
			         <div class="skb_left skp_innum">數量</div>
			         <div class="skb_left skb_in_price">金額(MOP)</div>
			         <div class="skb_left skb_inoperation">操作</div>
			       </div>
			       
			        <%
			         String[] shopid=new String[shoppingcart.size()];//去掉重複的店鋪id值
			              List<String> list=null;
			              if(shoppingcart!=null){
			              for(int i=0;i<shoppingcart.size();i++){ 
			              shopid[i]=""+shoppingcart.get(i).getiShopId();
			              list=DataTimeNumber.RemoveReArray(shopid);
			          }
			          %>
			          <%
			          int numTotal=0;
			          for(int s=0;s<list.size();s++){
			                 //Shop shop=CustomerShoppingDao.CustomerShop(Integer.parseInt(list.get(s)));//根據店鋪的id來獲取此店鋪的id和名稱
			                 Shop shop=CustomerShoppingDao.CustomerUserShop(ListShop,Integer.parseInt(list.get(s)));//根據店鋪的id來獲取此店鋪的id和名稱
			          %>
			       <div class="col-xs-12 col-sm-12 skb_home" style="">
			         <input type="checkbox" value="">&nbsp;&nbsp;<img src="images/skb_home.png" style="width:50px;margin: 0 20px;">
			         <span class="skb_hometxt"><%=shop.getShopname() %><span style="color:#ff5b77;">(<span><%=numTotal %></span>)</span></span>
			       </div>
			       
			       
			        <%
			        for(int i=0;i<shoppingcart.size();i++){ //根據購物車中的商品id獲取對應的商品信息
			             //ShangPin  cartshangpin=CustomerShoppingDao.CustomerShangpin(shoppingcart.get(i).getiGoodsId(),shop.getId());
			             ShangPin  cartshangpin=ShangPinManagedao.CusShangpinSeetion(ListUsershangpin,shoppingcart.get(i).getiGoodsId(),shop.getId());
			             if(cartshangpin!=null&&cartshangpin.getNumber()!=null){
			        %>
			       <div class="col-xs-12 col-sm-12 skb_homeshop" style="">
			         <div class="skb_left skb_cks"><input type="checkbox" value=""></div>
			         <div class="skb_left skb_ckimg_1"><img src="http://wap.macaoeasybuy.com/<%=cartshangpin.getPic() %>" class="skb_ck_img"></div>
			         <!-- 商品信息 -->
			         <div class="skb_left skb_inf_1">
			           <span style="display:block"><%=cartshangpin.getTitle() %></span>
			           <script>
					        var paragraph = document.getElementsByTagName('body')[0].getElementsByTagName('span')[0];
					        $clamp(paragraph, {clamp: 1, useNativeClamp: false, animate: false});
					    </script>
					    <%
					    if(cartshangpin.getShangpinLable()!=null&&shangpinlebelList.size()>0){
					    String[] shangpinlabel=DataTimeNumber.GetStringModelValue(cartshangpin.getShangpinLable());
					    for(int t=0;t<shangpinlabel.length;t++){
					    if(!shangpinlabel[t].equals("")){
					    for(int u=0;u<shangpinlebelList.size();u++){
					    if(Integer.parseInt(shangpinlabel[t])==shangpinlebelList.get(u).getId()){ %>
					    <span><img src="http://wap.macaoeasybuy.com/<%=shangpinlebelList.get(u).getPicture() %>" class="skb_ic"></span>
					    <%}
					    }
					    }
					    }
					     }%>
					  
					   <!--  
					   <span><img src="images/skb_3.png" class="skb_ic"></span>
					   <span><img src="images/skb_2.png" class="skb_ic"></span>
					   <span><img src="images/skb_4.png" class="skb_ic"></span>
					   -->
					   <div id="scrollDiv_keleyi_com" class="scrollDiv">
						<ul>
						  <li>店主贈送 10分積分</li>
						  <li>店主贈送 10分積分</li>
						  <li>店主贈送 10分積分</li>
						</ul>
					   </div>
			         </div>
			         <div class="skb_left skb_inn_1">
						<button class="skb_innbtn" >
						 <a href="#" class="show-pop-large<%=i %>  skb_innbtn" data-placement="auto">
						 
						    <span><%=shoppingcart.get(i).getsStandard()%></span>
						    <img src="images/skb_pen.png" style="margin:-5px 0 0 15px;">
						 </a>
						</button>	   
					</div>
					
					
					
					
					<!-- 彈出框內容 -->
					<div id="largeContent<%=i %>" style="display:none;">
					  <div class="row" style="margin: 0;padding: 0;">
					  	<div class="col-xs-12 col-sm-12" style="padding: 0;">
					  	  <div class="col-xs-8 col-sm-8" style="padding: 10px 0 0 0;">
					  	  	<div class="col-xs-12 col-sm-12" style="padding:0;">
					  	  	   <div class="col-xs-2 col-sm-2" style="padding:0;">
					  	  			<div style="margin-top: 40px;font-size: 16px;color:#cacaca;"><span>規格：</span></div>
					  	  		</div>
					  	  	    <div class="col-xs-10 col-sm-10" style="padding:0;">
						  	  	  <div class="iListr">
									<ul>
									   <li>
									   <%
									   String[] tupian=DataTimeNumber.StringInventory(cartshangpin.getTupian());
									    for(int ii=0;ii<tupian.length;ii++){
									   
			                                if(tupian.length==1&&tupian[0].length()==0){
				                                         //System.out.println("沒有");
			                                }else if(tupian.length==0){
				                                        //  System.out.println("頁沒有");
			                                }else{
			                             %>
			                                 <em><img src="http://wap.macaoeasybuy.com/<%=tupian[ii] %>" style="width:68px;height:68px;margin-right: 5px;"><i></i></em>
			                                <%
			                                }
		                                    }
									    %>
										</li>
									</ul>
									<script>
										$(function(){
										$(".iListr ul li em").click(function(){
											$(this).addClass("iListrclickem").siblings().removeClass("iListrclickem");
										});
									});
									</script>
								  </div>
								 </div>
					  	  	</div>
					  	  	<div class="col-xs-12 col-sm-12" style="padding:0;">
					  	  		<div class="col-xs-2 col-sm-2" style="padding:0;">
					  	  			<div style="margin-top: 10px;font-size: 16px;color:#cacaca;"><span>規格：</span></div>
					  	  		</div>
					  	  	    <div class="col-xs-10 col-sm-10" style="padding:0;">
						  	  	  <div class="yListr">
									<ul>
									<%
									List<String>guigetow= DataTimeNumber.getGuigeTwo(cartshangpin.getGuige());
									 %>
									   <li>
									   <%if(guigetow.size() ==0){%>
									   □□□□□□□□□□□□□□□□□□□□
									   <% }else{
									   for(int l=0;l<guigetow.size();l++){
									   %>
									   <button><%=guigetow.get(l) %></button>
									   <input type="hidden" name="Size" value="<%=guigetow.get(l) %>" >
									   <%}}%>
										</li>
									</ul>
									<script>
										$(function(){
										$(".yListr ul li button").click(function(){
											$(this).addClass("yListrclickem").siblings().removeClass("yListrclickem");
										});
									});
									</script>
								  </div>
								 </div>
					  	  	</div>
					  	  	<div class="col-xs-12 col-sm-12" style="padding:0;">
					  	  	  <div class="col-xs-6 col-sm-6" style="padding:0 10px 0 0px;">
					  	  	    <button class="skb_p_btn" style="background-color:#ff5b77;">確定</button>
					  	  	  </div>
					  	  	  <div class="col-xs-6 col-sm-6" style="padding:0 10px 0 5px;">
					  	  	    <button class="skb_p_btn" style="background-color:#CACACA;">取消</button> 
					  	  	  </div>
					  	  	</div>
					  	  </div>
					  	  <div class="col-xs-4 col-sm-4" style="padding:0;">
					  	  	<img src="http://wap.macaoeasybuy.com/<%=cartshangpin.getPic() %>" style="width:100%;height:230px;">
					  	  </div>
					  	</div>
					  </div>	
					</div>
					
					
					<script>		    
						(function(){
							var settings = {
									trigger:'click',
									content:'<p>This is webui popover demo.</p><p>just enjoy it and have fun !</p>',
									width:300,						
									multi:true,						
									closeable:false,
									style:'',
									padding:true
							};
							function initPopover<%=i%>(){					
								var largeContent = $('#largeContent<%=i%>').html(),
									largeSettings = {content:largeContent,
														width:500,
														height:340,
														closeable:false
													};
								$('a.show-pop-large<%=i %>').webuiPopover('destroy').webuiPopover($.extend({},settings,largeSettings));
							}
							initPopover<%=i%>();				
						})();			
					</script>
			         <div class="skb_left skb_inp_1">
			           <del style="color:#cacaca;"><%=cartshangpin.getCostPrice() %></del><br>
			           <span><%=cartshangpin.getPrice() %></span>
			           <input type="hidden" name="" id="ShangPinPrice<%=i %>" value="<%=cartshangpin.getPrice() %>">
			           <input type="hidden" name="" id="differencePrice<%=i %>" value="<%=cartshangpin.getCostPrice()-cartshangpin.getPrice()%>">
			           <span class="skb_detxt">省<%=cartshangpin.getCostPrice()-cartshangpin.getPrice()%>元</span>
			         </div>
			         <div class="skb_left skp_innum_1">
					   <div class="input-group skb_btgroup" style="">
							<div class="input-group-btn">
			                 <button class="btn skb_btnadd" type="button" onclick="DeleteNum<%=i%>();"><span class="skb_addbtic">-</span></button>
			               </div><!-- /btn-group -->
			               <input type="text" class="form-control skb_addtxt" placeholder="0" id="NumEveryTotal<%=i %>" value="<%=shoppingcart.get(i).getiCount()%>">
			               <span class="input-group-btn">
			                 <button type="button" class="btn skb_btnadd dropdown-toggle" onclick="AddNum<%=i%>();"><span class="skb_addbtic">+</span></button>
			               </span>
			            </div>
			            
			            
			            
			            
			            
			            <%
			            String[] InvenArray=DataTimeNumber.StringInventory(cartshangpin.getKucun());
			            int InvenTotal=DataTimeNumber.Kucun(InvenArray);
			             %>
			            <div style="margin-top: 10px;"><span><%=InvenTotal %></span>件存貨</div>
			         </div>
			         <div class="skb_left skb_in_price1"><span>
			         <input type="text" name="" id="totalmop<%=i%>" style="border:none;" value="<%=cartshangpin.getPrice()*shoppingcart.get(i).getiCount()%>" size="2" readonly="readonly">
			         </span>元</div>
			         <div class="skb_left skb_inoperation1">
			           <img src="images/skb_heart.png" style="width:35px;margin-right:10px;">
			           <img src="images/skb_share.png" style="width:35px;margin-right:10px;">
			           <a  onclick="return IsNoDelete<%=i%>();" " ><img src="images/skb_delet.png" style="width:35px;margin-right:10px;" ></a>
			         </div>
			        <script type="text/javascript">
			        function IsNoDelete<%=i%>(){
			         var r=confirm("确定購物籃取消此商品吗？");
                           if(r==false){
                              return false;
                              }else{
                              window.location.href="DeleteCartGoodsServlet?cartid=<%=shoppingcart.get(i).getId() %>";   
                                 return true;
                                   }
			        }
			        </script>
			        <%if(cartshangpin.getTuan()==1){ %>
			         <div class="col-xs-12 col-sm-12" style="padding:0 40px 10px 0;">
			           <div style="float:right;"> 
			            <img src="images/skb_alarm.png" class="skb_alarm" style="">
			            <div id="CountMsg" class="skb_timedowm" >
						     剩&nbsp;<span id="t_d">00天</span>&nbsp;<span id="t_h">00時</span>&nbsp;<span id="t_m">00分</span>&nbsp;<span id="t_s">00秒</span>&nbsp;<span id="t_mm">000</span>&nbsp;團購結束
						</div> 
			           </div>
			         </div>
			         <%}else{}%>
			         
			         <%if(cartshangpin.getMop()>0){ %>
			         <div class="col-xs-12 col-sm-12" style="padding-right: 40px;">
			          <div style="float:right;"> 
			           <img src="images/skb_packet.png" style="width:60px;margin: -5px 10px 0 0;">
			           <span style="color:#f0c03e;font-size:1.6rem;">可抵紅包 MOP <%=cartshangpin.getMop() %></span>
			          </div>
			         </div>
			         <%}else{}%>
			       </div>
			       
			       <script type="text/javascript">
			            function AddNum<%=i%>(){
			             var shangPinPrice=document.getElementById("ShangPinPrice<%=i %>").value;
			             var totalmop=document.getElementById("totalmop<%=i %>").value;
			             var numeverytotal=document.getElementById("NumEveryTotal<%=i %>").value;
			                     numeverytotal++;
			                     numeverytotal=document.getElementById("NumEveryTotal<%=i %>").value=numeverytotal;
			                     
			                      var TotalMop=Number(numeverytotal)*Number(shangPinPrice);
			                    document.getElementById("totalmop<%=i %>").value=TotalMop;
			            }
			            function DeleteNum<%=i%>(){
			            var shangPinPrice=document.getElementById("ShangPinPrice<%=i %>").value;
			             var totalmop=document.getElementById("totalmop<%=i %>").value;
			             var numeverytotal=document.getElementById("NumEveryTotal<%=i %>").value;
			                     if(numeverytotal<=1){
			                      document.getElementById("NumEveryTotal<%=i %>").value=numeverytotal;
			                      var TotalMop=Number(numeverytotal)*Number(shangPinPrice);
			                    document.getElementById("totalmop<%=i %>").value=TotalMop;
			                     }else{
			                     numeverytotal--;
			                     document.getElementById("NumEveryTotal<%=i %>").value=numeverytotal;
			                     var TotalMop=Number(numeverytotal)*Number(shangPinPrice);
			                    document.getElementById("totalmop<%=i %>").value=TotalMop;
			                     }
			            }
			            
			            </script>
			        <%}else{%>
			       <%} %>
			       
			       
			       <%} %>
			       <%} %>
			       
			       <%}else{%>
			       <%} %>
			       
			       
			       
			        <div class="col-xs-12 col-sm-12" style="text-align:center;padding: 20px 0;">
			           <span style="color:#cacaca;">~沒有更多內容~</span>
			         </div>
			     </div>
			   </div>
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
			 <!--降價商品  -->
			   <div class="tab-pane fade" id="selldown" style="">
			     <div class="row" style="padding:0;">
			       <div class="col-xs-12 col-sm-12" style="padding: 20px 0 20px 10px;">
			         <div class="skb_left skb_ck"><input type="checkbox" value="">&nbsp;<span style="margin-left: 35px;">全選</span></div>
			         <div class="skb_left skb_inf">商品信息</div>
			         <div class="skb_left skb_inn">商品規格</div>
			         <div class="skb_left skb_inp">單價(MOP)</div>
			         <div class="skb_left skp_innum">數量</div>
			         <div class="skb_left skb_in_price">金額(MOP)</div>
			         <div class="skb_left skb_inoperation">操作</div>
			       </div>
			         <%
			         String[] shopidJiangjia=new String[shoppingcart.size()];//去掉重複的店鋪id值
			               List<String> listjiangjia=null;
			              if(shoppingcart!=null){
			               for(int i=0;i<shoppingcart.size();i++){ 
			               shopidJiangjia[i]=""+shoppingcart.get(i).getiShopId();
			                listjiangjia=DataTimeNumber.RemoveReArray(shopidJiangjia);
			          }
			          %>
			          <%
			          int numTotal=0;
			          for(int s=0;s<list.size();s++){
			                 //Shop shop=CustomerShoppingDao.CustomerShop(Integer.parseInt(list.get(s)));//根據店鋪的id來獲取此店鋪的id和名稱
			                     Shop shop=CustomerShoppingDao.CustomerUserShop(ListShop,Integer.parseInt(list.get(s)));//根據店鋪的id來獲取此店鋪的id和名稱
			           for(int i=0;i<shoppingcart.size();i++){ //根據購物車中的商品id獲取對應的商品信息
			             //ShangPin  cartshangpin=CustomerShoppingDao.CustomerShangpin(shoppingcart.get(i).getiGoodsId(),shop.getId());
			              ShangPin  cartshangpin=ShangPinManagedao.CusShangpinSeetion(ListUsershangpin,shoppingcart.get(i).getiGoodsId(),shop.getId());
			             if(cartshangpin!=null&&cartshangpin.getNumber()!=null&&cartshangpin.getJiang()==1&&cartshangpin.getShopid()==shop.getId()){
			          %>
			       <div class="col-xs-12 col-sm-12 skb_home" style="">
			         <input type="checkbox" value="">&nbsp;&nbsp;<img src="images/skb_home.png" style="width:50px;margin: 0 20px;">
			         <span class="skb_hometxt"><%=shop.getShopname()%><span style="color:#ff5b77;">(<span><%=numTotal %></span>)</span></span>
			       </div>
			       <%}
			             } %>
			       
			      <% 
			        
			        for(int i=0;i<shoppingcart.size();i++){ //根據購物車中的商品id獲取對應的商品信息
			            // ShangPin  cartshangpin=CustomerShoppingDao.CustomerShangpin(shoppingcart.get(i).getiGoodsId(),shop.getId());
			             ShangPin  cartshangpin=ShangPinManagedao.CusShangpinSeetion(ListUsershangpin,shoppingcart.get(i).getiGoodsId(),shop.getId());
			             if(cartshangpin!=null&&cartshangpin.getNumber()!=null&&cartshangpin.getJiang()==1){
			              
			        %>
			       <div class="col-xs-12 col-sm-12 skb_homeshop" style="">
			         <div class="skb_left skb_cks"><input type="checkbox" value=""></div>
			         <div class="skb_left skb_ckimg_1"><img src="http://wap.macaoeasybuy.com/<%=cartshangpin.getPic() %>" class="skb_ck_img"></div>
			         
			         <!-- 商品信息 -->
			         <div class="skb_left skb_inf_1">
			           <span style="display:block"><%=cartshangpin.getTitle() %></span>
			           <script>
					        var paragraph = document.getElementsByTagName('body')[0].getElementsByTagName('span')[0];
					        $clamp(paragraph, {clamp: 1, useNativeClamp: false, animate: false});
					    </script>
					    
					    <%
					    if(cartshangpin.getShangpinLable()!=null&&shangpinlebelList.size()>0){
					    String[] shangpinlabel=DataTimeNumber.GetStringModelValue(cartshangpin.getShangpinLable());
					    for(int t=0;t<shangpinlabel.length;t++){
					    if(!shangpinlabel[t].equals("")){
					    for(int u=0;u<shangpinlebelList.size();u++){
					    if(Integer.parseInt(shangpinlabel[t])==shangpinlebelList.get(u).getId()){ %>
					    <span><img src="http://wap.macaoeasybuy.com/<%=shangpinlebelList.get(u).getPicture() %>" class="skb_ic"></span>
					    <%}
					    }
					    }
					    }
					     }%>
					   <!--  <span><img src="images/skb_1.png" class="skb_ic"></span>
					   <span><img src="images/skb_3.png" class="skb_ic"></span>
					   <span><img src="images/skb_2.png" class="skb_ic"></span>
					   <span><img src="images/skb_4.png" class="skb_ic"></span>-->
					   <div id="scrollDiv_keleyi_com1" class="scrollDiv">
						<ul>
						  <li>店主贈送 10分積分</li>
						  <li>店主贈送 10分積分</li>
						  <li>店主贈送 10分積分</li>
						</ul>
					   </div>
			         </div>
			         <div class="skb_left skb_inn_1">
			             <span><%=shoppingcart.get(i).getsStandard()%></span>
			             <img src="images/skb_pen.png" style="margin:-5px 0 0 15px;">			           
			         </div>
						
			         <div class="skb_left skb_inp_1">
			          <button class="skb_innbtn" title="號外！店主促銷減價："  data-container="body" data-trigger= "hover focus" data-toggle="popover" data-placement="bottom" 
			              data-content="比加入購物籃前的MO<%=cartshangpin.getCostPrice() %>，再優惠了MOP<%=cartshangpin.getCostPrice()-cartshangpin.getPrice()%>!">
			           <del style="color:#cacaca;"><%=cartshangpin.getCostPrice() %></del><br>
			           <span><%=cartshangpin.getPrice() %></span><br>
			           <img src="images/skb_pr1.png" style="width: 55px;">
			           <span class="skb_detxt">省<%=cartshangpin.getCostPrice()-cartshangpin.getPrice()%>元</span>
			          </button>
			           <script>$(function () 
					      { $("[data-toggle='popover']").popover();
					      });
					   </script>
			         </div>
			         <div class="skb_left skp_innum_1">
					   <div class="input-group skb_btgroup" style="">
							<div class="input-group-btn">
			                  <button type="button" class="btn skb_btnadd dropdown-toggle" onclick="DeleteNumJiang<%=i%>();"><span class="skb_addbtic">-</span></button>
			               </div><!-- /btn-group -->
			               <input type="text" class="form-control skb_addtxt" placeholder="0" id="NumEveryTotalJiang<%=i %>" value="<%=shoppingcart.get(i).getiCount()%>">
			               <span class="input-group-btn">
			                  <button class="btn skb_btnadd" type="button" onclick="AddNumJiang<%=i%>();"><span class="skb_addbtic">+</span></button>
			               </span>
			            </div>
			            <%
			            String[] InvenArray=DataTimeNumber.StringInventory(cartshangpin.getKucun());
			            int InvenTotal=DataTimeNumber.Kucun(InvenArray);
			             %>
			            <div style="margin-top: 10px;"><span><%=InvenTotal %></span>件存貨</div>
			         </div>
			         <div class="skb_left skb_in_price1"><span>
			         <input type="hidden" name="" id="ShangPinPriceJiang<%=i %>" value="<%=cartshangpin.getPrice() %>">
			        <input type="text" name="" id="totalmopJiang<%=i%>" style="border:none;" value="<%=cartshangpin.getPrice()*shoppingcart.get(i).getiCount()%>" size="2" readonly="readonly">
			         </span>元</div>
			         <div class="skb_left skb_inoperation1">
			           <img src="images/skb_heart.png" style="width:35px;margin-right:10px;">
			           <img src="images/skb_share.png" style="width:35px;margin-right:10px;">
			          <a  onclick="return IsNoDeleteJiang<%=i%>();" ><img src="images/skb_delet.png" style="width:35px;margin-right:10px;" ></a>
			         </div>
			        <script type="text/javascript">
			        function IsNoDeleteJiang<%=i%>(){
			         var r=confirm("确定購物籃取消此商品吗？");
                           if(r==false){
                              return false;
                              }else{
                              window.location.href="DeleteCartGoodsServlet?cartid=<%=shoppingcart.get(i).getId() %>";   
                                 return true;
                                   }
			        }
			        </script>
			         <!-- 倒計時
			         <div class="col-xs-12 col-sm-12" style="padding:0 40px 10px 0;">
			           <div style="float:right;"> 
			            <img src="images/skb_alarm.png" class="skb_alarm" style="">
			            <div id="CountMsg" class="skb_timedowm" >
						     剩&nbsp;<span id="t_d">00天</span>&nbsp;<span id="t_h">00時</span>&nbsp;<span id="t_m">00分</span>&nbsp;<span id="t_s">00秒</span>&nbsp;<span id="t_mm">000毫秒</span>&nbsp;團購結束
						</div> 
			           </div>
			         </div>
			        <!-- 紅包
			         <div class="col-xs-12 col-sm-12" style="padding-right: 40px;">
			          <div style="float:right;"> 
			           <img src="images/skb_packet.png" style="width:60px;margin: -5px 10px 0 0;">
			           <span style="color:#f0c03e;font-size:1.6rem;">可抵紅包 MOP 15</span>
			          </div>
			         </div>
			         -->
			       </div>
			      <script type="text/javascript">
			            function AddNumJiang<%=i%>(){
			             var shangPinPrice=document.getElementById("ShangPinPriceJiang<%=i %>").value;
			             var totalmop=document.getElementById("totalmopJiang<%=i %>").value;
			             var numeverytotal=document.getElementById("NumEveryTotalJiang<%=i %>").value;
			                     numeverytotal++;
			                     numeverytotal=document.getElementById("NumEveryTotalJiang<%=i %>").value=numeverytotal;
			                     
			                      var TotalMop=Number(numeverytotal)*Number(shangPinPrice);
			                    document.getElementById("totalmopJiang<%=i %>").value=TotalMop;
			            }
			            
			            function DeleteNumJiang<%=i%>(){
			            var shangPinPrice=document.getElementById("ShangPinPriceJiang<%=i %>").value;
			             var totalmop=document.getElementById("totalmopJiang<%=i %>").value;
			             var numeverytotal=document.getElementById("NumEveryTotalJiang<%=i %>").value;
			                     if(numeverytotal<=1){
			                      document.getElementById("NumEveryTotalJiang<%=i %>").value=numeverytotal;
			                      var TotalMop=Number(numeverytotal)*Number(shangPinPrice);
			                    document.getElementById("totalmopJiang<%=i %>").value=TotalMop;
			                     }else{
			                     numeverytotal--;
			                     document.getElementById("NumEveryTotalJiang<%=i %>").value=numeverytotal;
			                     var TotalMop=Number(numeverytotal)*Number(shangPinPrice);
			                    document.getElementById("totalmopJiang<%=i %>").value=TotalMop;
			                     }
			            }
			            
			            </script>
			  <%}else{%>
			       <%} %>
			       
			       
			       <%} %>
			       <%} %>
			       
			       <%}else{%>
			       <%} %>
			       <div class="col-xs-12 col-sm-12" style="text-align:center;padding: 20px 0;">
			           <span style="color:#cacaca;">~沒有更多內容~</span>
			         </div>
			     </div>
			   </div>
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
			 <!--即將售清  -->
			   <div class="tab-pane fade" id="sellout" style="">
			     <div class="row" style="padding:0;">
			       <div class="col-xs-12 col-sm-12" style="padding: 20px 0 20px 10px;">
			         <div class="skb_left skb_ck"><input type="checkbox" value="">&nbsp;<span style="margin-left: 35px;">全選</span></div>
			         <div class="skb_left skb_inf">商品信息</div>
			         <div class="skb_left skb_inn">商品規格</div>
			         <div class="skb_left skb_inp">單價(MOP)</div>
			         <div class="skb_left skp_innum">數量</div>
			         <div class="skb_left skb_in_price">金額(MOP)</div>
			         <div class="skb_left skb_inoperation">操作</div>
			       </div>
			       <%
			         String[] shopidWaring=new String[shoppingcart.size()];//去掉重複的店鋪id值
			               List<String> listwaring=null;
			              if(shoppingcart!=null){
			               for(int i=0;i<shoppingcart.size();i++){ 
			               shopidWaring[i]=""+shoppingcart.get(i).getiShopId();
			                listwaring=DataTimeNumber.RemoveReArray(shopidWaring);
			          }
			          %>
			          <%
			          int numTotal=0;
			          for(int s=0;s<listwaring.size();s++){
			          
			                 //Shop shop=CustomerShoppingDao.CustomerShop(Integer.parseInt(list.get(s)));//根據店鋪的id來獲取此店鋪的id和名稱
			                     Shop shop=CustomerShoppingDao.CustomerUserShop(ListShop,Integer.parseInt(listwaring.get(s)));//根據店鋪的id來獲取此店鋪的id和名稱
			           for(int i=0;i<shoppingcart.size();i++){ //根據購物車中的商品id獲取對應的商品信息
			             //ShangPin  cartshangpin=CustomerShoppingDao.CustomerShangpin(shoppingcart.get(i).getiGoodsId(),shop.getId());
			               ShangPin  cartshangpin=ShangPinManagedao.CusShangpinSeetion(ListUsershangpin,shoppingcart.get(i).getiGoodsId(),shop.getId());
			             if(cartshangpin!=null&&cartshangpin.getNumber()!=null&&cartshangpin.getiWarningCount()<=1&&listwaring.equals(cartshangpin.getShopid())){
			          %>
			       <div class="col-xs-12 col-sm-12 skb_home" style="">
			         <input type="checkbox" value="">&nbsp;&nbsp;<img src="images/skb_home.png" style="width:50px;margin: 0 20px;">
			         <span class="skb_hometxt"><%=shop.getShopname() %><span style="color:#ff5b77;">(<span>2</span>)</span></span>
			       </div>
			       <%}}%>
			       
			       <% 
			        
			        for(int i=0;i<shoppingcart.size();i++){ //根據購物車中的商品id獲取對應的商品信息
			            // ShangPin  cartshangpin=CustomerShoppingDao.CustomerShangpin(shoppingcart.get(i).getiGoodsId(),shop.getId());
			             ShangPin  cartshangpin=ShangPinManagedao.CusShangpinSeetion(ListUsershangpin,shoppingcart.get(i).getiGoodsId(),shop.getId());
			             if(cartshangpin!=null&&cartshangpin.getNumber()!=null&&cartshangpin.getiWarningCount()<=1&&listwaring.equals(cartshangpin.getShopid())){
			              
			        %>
			       <div class="col-xs-12 col-sm-12 skb_homeshop" style="">
			         <div class="skb_left skb_cks"><input type="checkbox" value=""></div>
			         <div class="skb_left skb_ckimg_1"><img src="http://wap.macaoeasybuy.com/<%=cartshangpin.getPic() %>" class="skb_ck_img"></div>
			         <!-- 商品信息 -->
			         <div class="skb_left skb_inf_1">
			           <span style="display:block"><%=cartshangpin.getTitle() %></span>
			           <script>
					        var paragraph = document.getElementsByTagName('body')[0].getElementsByTagName('span')[0];
					        $clamp(paragraph, {clamp: 1, useNativeClamp: false, animate: false});
					    </script>
					    
					    <%
					    if(cartshangpin.getShangpinLable()!=null&&shangpinlebelList.size()>0){
					    String[] shangpinlabel=DataTimeNumber.GetStringModelValue(cartshangpin.getShangpinLable());
					    for(int t=0;t<shangpinlabel.length;t++){
					    if(!shangpinlabel[t].equals("")){
					    for(int u=0;u<shangpinlebelList.size();u++){
					    if(Integer.parseInt(shangpinlabel[t])==shangpinlebelList.get(u).getId()){ %>
					    <span><img src="http://wap.macaoeasybuy.com/<%=shangpinlebelList.get(u).getPicture() %>" class="skb_ic"></span>
					    <%}
					    }
					    }
					    }
					     }%>
					   <!--  <span><img src="images/skb_1.png" class="skb_ic"></span>
					   <span><img src="images/skb_3.png" class="skb_ic"></span>
					   <span><img src="images/skb_2.png" class="skb_ic"></span>
					   <span><img src="images/skb_4.png" class="skb_ic"></span>-->
					   <div id="scrollDiv_keleyi_com2" class="scrollDiv">
						<ul>
						  <li>店主贈送 10分積分</li>
						  <li>店主贈送 10分積分</li>
						  <li>店主贈送 10分積分</li>
						</ul>
					   </div>
			         </div>
			         <div class="skb_left skb_inn_1">
			             <span><%=shoppingcart.get(i).getsStandard()%></span>
			             <img src="images/skb_pen.png" style="margin:-5px 0 0 15px;">			           
			         </div>
			         <div class="skb_left skb_inp_1">
			           <del style="color:#cacaca;"><%=cartshangpin.getCostPrice() %></del><br>
			           <span><%=cartshangpin.getPrice() %></span><br>
			           <span class="skb_detxt">省<%=cartshangpin.getCostPrice()-cartshangpin.getPrice()%>元</span>
			         </div>
			         <div class="skb_left skp_innum_1">
					   <div class="input-group skb_btgroup" style="">
							<div class="input-group-btn">
			                  <button type="button" class="btn skb_btnadd dropdown-toggle" onclick="DeleteNumiWaring<%=i%>();"><span class="skb_addbtic">-</span></button>
			               </div><!-- /btn-group -->
			               <input type="text" class="form-control skb_addtxt" placeholder="0" id="NumEveryTotaliWaring<%=i%>" value="<%=shoppingcart.get(i).getiCount()%>">
			               <span class="input-group-btn">
			                  <button class="btn skb_btnadd" type="button" onclick="AddNumiWaring<%=i%>();"><span class="skb_addbtic">+</span></button>
			               </span>
			            </div>
			            <%
			            String[] InvenArray=DataTimeNumber.StringInventory(cartshangpin.getKucun());
			            int InvenTotal=DataTimeNumber.Kucun(InvenArray);
			             %>
			            <div style="margin-top: 10px;color:#ff5b77;"><span><%=InvenTotal %></span>件存貨<img src="images/skb_pr2.png" style="width:65px;margin:-4px 0 0 10px;"></div>
			         </div>
			         <div class="skb_left skb_in_price1">
			         <span>
			          <input type="hidden" name="" id="ShangPinPriceiWaring<%=i %>" value="<%=cartshangpin.getPrice() %>">
			          <input type="text" name="" id="totalmopiWaring<%=i%>" style="border:none;" value="<%=cartshangpin.getPrice()*shoppingcart.get(i).getiCount()%>" size="2" readonly="readonly">
			         </span>元</div>
			         <div class="skb_left skb_inoperation1">
			           <img src="images/skb_heart.png" style="width:35px;margin-right:10px;">
			           <img src="images/skb_share.png" style="width:35px;margin-right:10px;">
			           <a  onclick="return IsNoDeleteiWaring<%=i%>();" ><img src="images/skb_delet.png" style="width:35px;margin-right:10px;" ></a>
			         </div>
			        <script type="text/javascript">
			        function IsNoDeleteiWaring<%=i%>(){
			         var r=confirm("确定購物籃取消此商品吗？");
                           if(r==false){
                              return false;
                              }else{
                              window.location.href="DeleteCartGoodsServlet?cartid=<%=shoppingcart.get(i).getId() %>";   
                                 return true;
                                   }
			        }
			        </script>
			         <!-- 倒計時
			         <div class="col-xs-12 col-sm-12" style="padding:0 40px 10px 0;">
			           <div style="float:right;"> 
			            <img src="images/skb_alarm.png" class="skb_alarm" style="">
			            <div id="CountMsg" class="skb_timedowm" >
						     剩&nbsp;<span id="t_d">00天</span>&nbsp;<span id="t_h">00時</span>&nbsp;<span id="t_m">00分</span>&nbsp;<span id="t_s">00秒</span>&nbsp;<span id="t_mm">000毫秒</span>&nbsp;團購結束
						</div> 
			           </div>
			         </div>
			        <!-- 紅包
			         <div class="col-xs-12 col-sm-12" style="padding-right: 40px;">
			          <div style="float:right;"> 
			           <img src="images/skb_packet.png" style="width:60px;margin: -5px 10px 0 0;">
			           <span style="color:#f0c03e;font-size:1.6rem;">可抵紅包 MOP 15</span>
			          </div>
			         </div>
			         -->
			       </div>
			       <script type="text/javascript">
			            function AddNumiWaring<%=i%>(){
			             var shangPinPrice=document.getElementById("ShangPinPriceiWaring<%=i %>").value;
			             var totalmop=document.getElementById("totalmopiWaring<%=i %>").value;
			             var numeverytotal=document.getElementById("NumEveryTotaliWaring<%=i %>").value;
			                     numeverytotal++;
			                     numeverytotal=document.getElementById("NumEveryTotaliWaring<%=i %>").value=numeverytotal;
			                     
			                      var TotalMop=Number(numeverytotal)*Number(shangPinPrice);
			                    document.getElementById("totalmopiWaring<%=i %>").value=TotalMop;
			            }
			            function DeleteNumiWaring<%=i%>(){
			            var shangPinPrice=document.getElementById("ShangPinPriceiWaring<%=i %>").value;
			             var totalmop=document.getElementById("totalmopiWaring<%=i %>").value;
			             var numeverytotal=document.getElementById("NumEveryTotaliWaring<%=i %>").value;
			                     if(numeverytotal<=1){
			                      document.getElementById("NumEveryTotaliWaring<%=i %>").value=numeverytotal;
			                      var TotalMop=Number(numeverytotal)*Number(shangPinPrice);
			                    document.getElementById("totalmopiWaring<%=i %>").value=TotalMop;
			                     }else{
			                     numeverytotal--;
			                     document.getElementById("NumEveryTotaliWaring<%=i %>").value=numeverytotal;
			                     var TotalMop=Number(numeverytotal)*Number(shangPinPrice);
			                    document.getElementById("totalmopiWaring<%=i %>").value=TotalMop;
			                     }
			            }
			            
			            </script>
			       <%}else{%>
			       <%} %>
			       
			       
			       <%} %>
			       <%} %>
			       
			       <%}else{%>
			       <%} %>
			       <div class="col-xs-12 col-sm-12" style="text-align:center;padding: 20px 0;">
			           <span style="color:#cacaca;">~沒有更多內容~</span>
			         </div>
			     </div>
			   </div>
			   
			   
			   
			   
			 <!--下架商品  -->
			   <div class="tab-pane fade" id="shopdown" style="">
			     <div class="row" style="padding:0;">
			       <div class="col-xs-12 col-sm-12" style="padding: 20px 0 20px 10px;">
			         <div class="skb_left skb_ck"><input type="checkbox" value="">&nbsp;<span style="margin-left: 35px;">全選</span></div>
			         <div class="skb_left skb_inf">商品信息</div>
			         <div class="skb_left skb_inn">商品規格</div>
			         <div class="skb_left skb_inp">單價(MOP)</div>
			         <div class="skb_left skp_innum">數量</div>
			         <div class="skb_left skb_in_price">金額(MOP)</div>
			         <div class="skb_left skb_inoperation">操作</div>
			       </div>
			       <%
			         String[] shopiddown=new String[shoppingcart.size()];//去掉重複的店鋪id值
			               List<String> listdown=null;
			              if(shoppingcart!=null){
			               for(int i=0;i<shoppingcart.size();i++){ 
			               shopiddown[i]=""+shoppingcart.get(i).getiShopId();
			                listdown=DataTimeNumber.RemoveReArray(shopiddown);
			          }
			          %>
			          <%
			          int numTotal=0;
			          for(int s=0;s<listdown.size();s++){
			                     Shop shop=CustomerShoppingDao.CustomerUserShop(ListShop,Integer.parseInt(listdown.get(s)));//根據店鋪的id來獲取此店鋪的id和名稱
			           for(int i=0;i<shoppingcart.size();i++){ //根據購物車中的商品id獲取對應的商品信息
			              ShangPin  cartshangpin=ShangPinManagedao.CusShangpinSeetion(ListUsershangpin,shoppingcart.get(i).getiGoodsId(),shop.getId());
			            
			             if(cartshangpin!=null&&cartshangpin.getNumber()!=null&&cartshangpin.getState()==1&&cartshangpin.getShopid()==shop.getId()){
			          %>
			       <div class="col-xs-12 col-sm-12 skb_home" style="">
			         <input type="checkbox" value="">&nbsp;&nbsp;<img src="images/skb_home.png" style="width:50px;margin: 0 20px;">
			         <span class="skb_hometxt"><%=shop.getShopname() %><span style="color:#ff5b77;">(<span>2</span>)</span></span>
			       </div>
			       <%}
			       } %>
			       
			       <% 
			        
			        for(int i=0;i<shoppingcart.size();i++){ //根據購物車中的商品id獲取對應的商品信息
			            // ShangPin  cartshangpin=CustomerShoppingDao.CustomerShangpin(shoppingcart.get(i).getiGoodsId(),shop.getId());
			             ShangPin  cartshangpin=ShangPinManagedao.CusShangpinSeetion(ListUsershangpin,shoppingcart.get(i).getiGoodsId(),shop.getId());
			             if(cartshangpin!=null&&cartshangpin.getNumber()!=null&&cartshangpin.getState()==1){
			        %>
			       
			       <div class="col-xs-12 col-sm-12 skb_homeshop" style="background-color:#eeeeee;height:121px;">
			         <div class="skb_left skb_cks"><input type="checkbox" value=""></div>
			         <div class="skb_left skb_ckimg_1"><img src="http://wap.macaoeasybuy.com/<%=cartshangpin.getPic() %>" class="skb_ck_img"></div>
			         <!-- 商品信息 -->
			         <div class="skb_left skb_inf_1">
			           <span style=""><%=cartshangpin.getTitle() %></span>
			           <script>
					        var paragraph = document.getElementsByTagName('body')[0].getElementsByTagName('span')[0];
					        $clamp(paragraph, {clamp: 1, useNativeClamp: false, animate: false});
					    </script>
					   <span class="skb_bt_1">已下架</span><br>
					   
					    <%
					    if(cartshangpin.getShangpinLable()!=null&&shangpinlebelList.size()>0){
					    String[] shangpinlabel=DataTimeNumber.GetStringModelValue(cartshangpin.getShangpinLable());
					    for(int t=0;t<shangpinlabel.length;t++){
					    if(!shangpinlabel[t].equals("")){
					    for(int u=0;u<shangpinlebelList.size();u++){
					    if(Integer.parseInt(shangpinlabel[t])==shangpinlebelList.get(u).getId()){ %>
					    <span><img src="http://wap.macaoeasybuy.com/<%=shangpinlebelList.get(u).getPicture() %>" class="skb_ic"></span>
					    <%}
					    }
					    }
					    }
					     }%>
					   <!-- <span><img src="images/skb_1.png" class="skb_ic"></span>
					   <span><img src="images/skb_3.png" class="skb_ic"></span>
					   <span><img src="images/skb_2.png" class="skb_ic"></span>
					   <span><img src="images/skb_4.png" class="skb_ic"></span> -->
					   <div id="scrollDiv_keleyi_com3" class="scrollDiv">
						<ul>
						  <li>店主贈送 10分積分</li>
						  <li>店主贈送 10分積分</li>
						  <li>店主贈送 10分積分</li>
						</ul>
					   </div>
			         </div>
			         <div class="skb_left skb_inn_1">
			             <span style="color:#8f8f8f;"><%=shoppingcart.get(i).getsStandard()%></span>		           
			         </div>
			         <div class="skb_left skb_inp_1" style="margin-top:50px;">
			           <span><%=cartshangpin.getPrice()%></span><br>
			         </div>
			         <div class="skb_left skp_innum_1">
			            <div style="margin-top: 30px;color:#8f8f8f;"><%=shoppingcart.get(i).getiCount()%></div>
			         </div>
			         <div class="skb_left skb_in_price1" style="margin-top:50px;color:#8f8f8f;"><%=cartshangpin.getPrice()%></div>
			         <div class="skb_left skb_inoperation1" style="margin:0;height:100%;background-color:#fff;">
			          <div style="margin-top:40px">
			           <img src="images/skb_heart.png" style="width:35px;margin-right:10px;">
			           <img src="images/skb_share.png" style="width:35px;margin-right:10px;">
			            <a  onclick="return IsNoDeletedown<%=i%>();" ><img src="images/skb_delet.png" style="width:35px;margin-right:10px;" ></a>
			         </div>
			        <script type="text/javascript">
			        function IsNoDeletedown<%=i%>(){
			         var r=confirm("确定購物籃取消此商品吗？");
                           if(r==false){
                              return false;
                              }else{
                              window.location.href="DeleteCartGoodsServlet?cartid=<%=shoppingcart.get(i).getId() %>";   
                                 return true;
                                   }
			        }
			        </script>
			         </div>
			       </div>
			       <%}else{%>
			       <%} %>
			       <%} %>
			       <%} %>
			       
			       <%}else{%>
			       <%} %>
			       <div class="col-xs-12 col-sm-12" style="text-align:center;padding: 20px 0;">
			           <span style="color:#cacaca;">~沒有更多內容~</span>
			         </div>
			     </div>
			   </div>
			 </div>
		   </div>
	     <!--  --></div>
	     
	     
	     
	     <!-- 換紅包結算 -->
	     <!-- 換紅包結算 -->
	     <div class="col-xs-12 col-sm-12 skb_redpack" style="padding:0;">
	       <div class="col-xs-6 col-sm-6" style="padding:0;">
	         <table style="height:100%;"><tr>
	           <td class="skb_redtd" style="width:230px;">
	             <img src="images/skb_heart.png" style="width:40px;margin-right:10px;">
			     <img src="images/skb_share.png" style="width:40px;margin-right:10px;">
			     <img src="images/skb_delet.png" style="width:40px;margin-right:10px;">
	           </td>
	           <td class="skb_redtd" style="width:452px;">
	             <table><tr>
	               <td style="width:96px;text-align:center;"><img src="images/exchangered.png" style="width:60px;"></td>
	               <td>
	                 <div style="color:#cacaca;font-weight:bold;">
	                   <span style="font-size: 16px;">積分餘額&nbsp;</span>
	                   <span style="color:#ff5b77;font-size:20px;"><span><%=usermop.getMop() %></span>分</span>
	                   <button class="skb_redbtn">兌換成紅包</button>
	                </div>
	                <div style="color:#cacaca;font-weight:bold;">
	                   <span style="font-size: 1.6rem;">紅包餘額(MOP)&nbsp;</span>
	                   <span style="color:#ff5b77;font-size:2rem;"><span><%=userpoint.getPoint() %></span>元</span>
	                </div>
	               </td>
	             </tr></table>
	           </td>
	         </tr></table>
	       </div>
	       <div class="col-xs-6 col-sm-6" style="padding:0;">
	         <table style="height:100%;"><tr>
	           <td style="width:96px;text-align:center;"><img src="images/buy.png" style="width:60px;"></td>
	           <td style="width:486px;padding-right: 20px;">
	            <table style="letter-spacing: 2px;font-weight:bold;">
	              <tr><td style="text-align:right;">
	                <span style="color:#cacaca;font-size:18px;">已選商品&nbsp;<span style="color:#ff5b77;">4</span>&nbsp;件</span>
	                <span style="color:#cacaca;font-size:20px;">&nbsp;&nbsp;總計(MOP)：</span><span style="color:#ff5b77;font-size:22px;"><span>600</span>元</span>
	              </td></tr>
	              <tr><td style="text-align:right;padding: 3px 0;font-size:20px;">
	                <span style="display:block;color:#f0c03e;">為您節省(MOP)：&nbsp;&nbsp;<span>800</span>元</span>
	              </td></tr>
	            </table>
	           </td>
	           <td><button class="skb_clobtn">結算</button></td>
	         </tr></table>
	       </div>
	     </div>
	     
	     
	     
	     
<!--大家都在看 -->
	     <div class="col-xs-12 col-sm-12 skb_eversee" style="">
	       <div style="float:left;">他們都在看</div>
	       <div style="float:right;"><a href="#" class="skb_shopexchage">換一批&nbsp;&gt;</a></div>
	     </div>
<!--大家都在看商品(只有6個) -->

	     <div class="col-xs-12 col-sm-12" style="padding:0;">
	     <%
	     ArrayList<ShangPin> shangpinSee=ShangPinManagedao.CustomerCartSeeShangpin();
	     int TotalPage=0;
	      %>
	     <%
	     if(shangpinSee.size()>6){//只顯示6件商品
	     TotalPage=6;
	     }else{
	     TotalPage=shangpinSee.size();
	     }
	     for(int see=0;see<TotalPage;see++){ %>
	       <div class="shop_all_e">
			 <img src="http://wap.macaoeasybuy.com/<%=shangpinSee.get(see).getPic() %>" style="width:100%;">
			 <table><tr>
				<td class="shop_all_td1" style="color:#ff0a4f;">
				   <img src="images/ev4_.png" style="width:25px;">
				   <span style="vertical-align: middle;"><%=shangpinSee.get(see).getsSeeNum() %></span>
				</td>
				<td class="shop_all_td1" style="color:#ccc;">
				  <span>MOP</span><span><%=shangpinSee.get(see).getPrice()%></span>
				</td>
			 </tr></table>
			 <table>
				<tr><td class="shop_all_td2" style="">
				 <h4><%=shangpinSee.get(see).getTitle()%></h4>
				  <script>
					 var header = document.getElementsByTagName('body')[0].getElementsByTagName('h4')[0];   
					 $clamp(header, {clamp: 1, useNativeClamp: false});
				  </script>
				 </td></tr>
				 <tr><td style="text-align:center;">
				  <a href="cart.jsp"><img src="images/kep.png"></a>
				  </td></tr>
			  </table>
			</div>
			<%} %>
	     </div>
	     
	     
	     
	     
	     
	   </div>
	</div>
    <!--頁腳  -->
	<div id="footer" style="clear:both;text-align:center;padding-top: 30px;">
      <div style="padding:0;width:100%;"><img src="images/logondown.png" style="width:100%;min-width:1370px;"></div>
         <div class="containter_foot" style="padding:0;margin-bottom:0;height:auto;">
            <div style="width:260px;float:left;"><img src="images/logo.png" ></div>
              <div class="foot_right" style="">
                <div style="padding:0;color:#ccc;font-size: 2rem;">
                  <span><a href="#" class="foot_right_a" style="">認識我們</a>|</span>
                  <span><a href="#" class="foot_right_a">宜生活文化</a>|</span>
                  <span><a href="#" class="foot_right_a">我們的用戶</a>|</span>
                  <span><a href="#" class="foot_right_a">我們的商家</a></span>
                </div>
                <div  style="padding:10px 0 0 0;color:#ccc;font-size: 1.6rem;">
                 <span>宜買生活百貨（澳門）有限公司版權所有</span>
                </div>
                <div  style="padding:0;color:#ccc;font-size: 1.6rem;">
                 <span>2014-2015 Copyright reserved by easyBuy Department Stores ( Macao)Ltd.</span>
                </div>
             </div>
         </div>
	</div>
	<!--右邊懸浮窗  -->
<div class="top-fix" style="">
  <ul>
    <li class="top_fix_li"><a href="#" style="color:black;">
      <img src="images/sign.png" class="top_fix_img">
      <span style="display:block;">登入/註冊</span>
    </a></li>
    <li class="top_fix_li"><a href="#" style="color:black;">
      <img src="images/kep_l.png" class="top_fix_img">
      <span style="display:block;">購物籃(<span>0</span>/<span>100</span>)</span>
    </a></li>
    <li class="top_fix_li"><a href="#" style="color:black;">
      <img src="images/integral.png" class="top_fix_img">
      <span style="display:block;">紅包/積分</span>
    </a></li>
    <li class="top_fix_li"><a href="#" style="color:black;">
      <img src="images/footprint.png" class="top_fix_img">
      <span style="display:block;">足跡</span>
    </a></li>
    <li class="top_fix_li"><a href="#" style="color:black;">
      <img src="images/sharefriend.png" class="top_fix_img">
      <span style="display:block;">分享好友</span>
    </a></li>
    <li class="top_fix_lid"><a href="#" style="color:#fff;">
      <img src="images/appdown.png" class="top_fix_img">
      <span style="display:block;">APP下載</span>
    </a></li>
  </ul>
</div>
  </body>
</html>

