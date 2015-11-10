<%@page import="customerEnter.bean.Customers"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Customers CustomerValue=(Customers)session.getAttribute("CustomerValue");//登入的客戶

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
    <script>
	  $(document).ready(function(){
	   $('.list_lh li:even').addClass('lieven');
	   $('.carousel').carousel({
		 interval: 3000
		})
			});
			$(function(){
				$("div.list_lh").myScroll({
					speed:60, //数值越大，速度越慢
					rowHeight:152 //li的高度
				});
		});

	  </script>
	<style>
	.nav-tabs>li>a{
	   border:none;
	}
	.nav-tabs>li>a:hover {
		color: #ffd800 !important;
		background-color: #525252 !important;
	}
	
	.nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover
		{
		color: #ffd800 !important;
		cursor: default !important;
		background-color: #525252 !important;
		border: none !important;
	}
	.carousel-indicators {
	   bottom: 0 !important;
	}
	.carousel-indicators .active{
	   background-color: #ff0a4f;
	}
	.carousel-indicators li{
	   background-color: #9c9c9c;
	}
    </style>
  </head>
  <script  type="text/javascript">
                          function singOut() {//退出
                          var r=confirm("确定退出吗？");
                           if(r==false){
                              return false;
                              }else{
                                 return true;
                                   }
                                     }
                             </script>
  <body style="background:url(images/index_back.png);">
	<header class="hea" style="">
	  <ol class="breadcrumb" style="float: right;">
	  <%if(CustomerValue!=null){ %>
	  <li><a href="/mbuyenter/GoOutCustomerLoginServlet" class="hea_a" onclick="return singOut();">退出</a></li>
	  <%}else{ %>
	  <li><a href="Login.jsp" class="hea_a">登入</a></li>
	  <li><a href="#" class="hea_a">註冊</a></li>
	  <%} %>
	  <li><a href="#" class="hea_a">購物籃</a></li>
	  <li><a href="#" class="hea_a">紅包積分</a></li>
	  <li><a href="#" class="hea_a">足跡</a></li>
	  <li><a href="#" class="hea_a">分享好友</a></li>
	  <li><a href="#" class="hea_a">APP下載</a></li>
	 </ol>
	</header>
    <div class="shop_logo"><img src="http://wap.macaoeasybuy.com/\uploadfile\201406\20140623045134635391390945249858.jpg" style="width:100%;"></div>
    <div class="shop_li">
       <ol class="breadcrumb" style="margin:0;">
	    <li style="margin-right:10px;"><span class="shop_a">商品數量：</span><span style="color:#fd8970;">128</span></li>
	    <li style="margin-right:10px;"><span class="shop_a">商品類別：</span><span style="color:#fd8970;">服飾</span></li>
	    <li style="margin-right:10px;"><span class="shop_a">商品評級：</span>
	      <img src="images/heart.png" class="shop_li_ic" alt="夠用心">
	      <!--<img src="images/good.png" class="shop_li_ic" alt="信譽好">-->
	      <!--<img src="images/money.png" class="shop_li_ic" alt="保證金">-->
	      <!--<img src="images/nice.png" class="shop_li_ic" alt="服務優">-->
	      <!--<img src="images/place.png" class="shop_li_ic" alt="實體店">-->
	    </li>
	    <li style="margin-right:10px;"><span class="shop_a">舉報投訴：</span><span style="color:#fd8970;">0</span></li>
	    <li><span class="shop_a">創店：</span><span style="color:#fd8970;">2015-11-05</span></li>
	   </ol>
	 </div>
        <div class="shop_menu" style="">
          <ul id="myTab" class="nav nav-tabs shop_li">
		   <li class="active"><a href="#home" class="shop_li_a" data-toggle="tab">本店首頁</a></li>
		   <li class=""><a href="#diary" class="shop_li_a" data-toggle="tab">店主日誌</a></li>
		   <li class=""><a href="#blueprint" class="shop_li_a" data-toggle="tab">晒圖區</a></li>
		   <li class=""><a href="#join" class="shop_li_a" data-toggle="tab">參與活動</a></li>
		   <li class=""><a href="#add" class="shop_li_as" data-toggle="tab">+加入關注 &nbsp;<img src="images/shop_qro.png" class="sho_li_qro"></a></li>
		  </ul>
        </div>
        <div id="myTabContent" class="tab-content containter_s" >
<!-- 本店首頁 -->
		    <div class="tab-pane fade in active" id="home" style="">
<!--輪播與滾動  -->	
            <div class="containter" style="">	      
		       <div id="myCarousel" class="carousel slide">
				 <ol class="carousel-indicators">
				   <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				   <li data-target="#myCarousel" data-slide-to="1"></li>
				   <li data-target="#myCarousel" data-slide-to="2"></li>
				 </ol>   
			     <div class="carousel-inner">
				  <div class="item active">
					<img src="images/index_1.png" alt="First slide" style="width:100%;">
					<div style="padding: 15px 0 5px 20px;margin-bottom: 50px;">
					  <span style="font-size:1.9rem;">CHRISTIAN－妳的私藏鞋店</span><br>
					  <span style="color:#9c9c9c;font-size:1.9rem;">大家好歡迎大家光臨! 鞋子是女人最重要的配搭! 希望大家來捧場哦.</span>
					</div>
					</div>
					<div class="item">
					  <img src="images/index_1.png" alt="Second slide" style="width:100%;">
					  <div style="padding: 15px 0 5px 20px;margin-bottom: 50px;">
					    <span style="font-size:1.9rem;">CHRISTIAN－妳的私藏鞋店</span><br>
					    <span style="color:#9c9c9c;font-size:1.9rem;">大家好歡迎大家光臨! 鞋子是女人最重要的配搭! 希望大家來捧場哦.</span>
					  </div>
					</div>
					<div class="item">
					   <img src="images/index_1.png" alt="Third slide" style="width:100%;">
					   <div style="padding: 15px 0 5px 20px;margin-bottom: 50px;">
					     <span style="font-size:1.9rem;">CHRISTIAN－妳的私藏鞋店</span><br>
					     <span style="color:#9c9c9c;font-size:1.9rem;">大家好歡迎大家光臨! 鞋子是女人最重要的配搭! 希望大家來捧場哦.</span>
					   </div>
					</div>
				  </div>
				</div> 
				<div class="cont_right">
				   <div class="list_hea">
				     <span>最新日誌</span>
				     <span style="float:right;"><a href="" style="color:#fff;">更多></a></span>
				   </div>
				   <!-- 上下無縫滾動 -->
					<div class="list_lh">
					  <ul style="padding:0;background-color:#e3e3e3;">
						<li style="">
						 <table>
						   <tr><td style="padding-right: 10px;">
						     <img src="images/practice_d2.png" class="shop_head_img">
						   </td><td>
						     <span>店主 </span><span>Ms Chan：</span><br>
						     <span>2015-11-05</span><br>
						     <span>17:52:20</span>
						   </td></tr>
						 </table>
						 <table><tr><td>
						     <p>今天真的累死了，不過看到進的一批 新貨都是自己精挑細選的，心情就好 極了。</p>
						   </td></tr></table>
						   <script>
					        var paragraph = document.getElementsByTagName('body')[0].getElementsByTagName('p')[0];
					        $clamp(paragraph, {clamp: 3, useNativeClamp: false, animate: false});
					    </script>
						</li>
					  </ul>
					</div>
			     </div>
			    </div>
<!-- 粉絲 -->
		         <div class="shop_fan">
		           <div class="shop_fan_logo" style="">
			         <table><tr><td>
			           <img src="images/practice_d2.png" class="shop_head_img">
			         </td><td style="padding: 10px 0 0 0;">
			           <span style="float:left;"><img src="images/comma_left.png" style="margin-top: -15px;"></span>
			           <span class="sho_fan_txt">女人的鞋柜里必须有一双高跟鞋， SHOZ一定讓你找到你最愛的那双！</span>
			           <span style="float:left;"><img src="images/comma_right.png" style="margin-top: -10px;"></span>
			         </td></tr></table>
			       </div>
			       <div  style="width:780px;float:right;">
			          <div class="shop_fan_txt">
			              <span style="font-size:2rem;color:#f8af00;">2567</span><br>
			              <span style="font-size:1.6rem;color:#ccc;">宜粉到訪</span>
			          </div>
			          <div class="shop_fan_see">
			            <div class="shop_fan_si"><img src="images/practice_d2.png"style="width:100%;"></div>
			            <div class="shop_fan_si"><img src="images/gmp1.jpg"style="width:100%;"></div>
			            <div class="shop_fan_si"><img src="images/gmp2.jpg"style="width:100%;"></div>
			            <div class="shop_fan_si"><img src="images/gmp3.jpg"style="width:100%;"></div>
			            <div class="shop_fan_si"><img src="images/gmp4.jpg"style="width:100%;"></div>
			            <div class="shop_fan_si"><img src="images/gmp5.jpg"style="width:100%;"></div>
			          </div>
			       </div>
		         </div>
<!-- 商品分類 -->	
               <div class="shop_menu" style="padding:0;margin-top:20px;">
                   <ul id="mysTab" class="nav nav-tabs shop_shop" style="margin-left: 20px;">
				   <li class="active"><a href="#all" class="shop_shop_a" data-toggle="tab">所有</a></li>
				   <li class=""><a href="#new" class="shop_shop_a" data-toggle="tab">上新</a></li>
				   <li class=""><a href="#money" class="shop_shop_a" data-toggle="tab">價錢</a></li>
				   <li class=""><a href="#fan" class="shop_shop_a" data-toggle="tab">粉絲</a></li>
				  </ul>
				  <div class="shop_shop_right">
				    <span>描述相符&nbsp;&nbsp;</span><span>4.6</span>/5.0&nbsp;&nbsp;<span>|</span>
				    <span>價格合理&nbsp;&nbsp;</span><span>4.6</span>/5.0&nbsp;&nbsp;<span>|</span>
				    <span>商品質量&nbsp;&nbsp;</span><span>4.6</span>/5.0
				  </div>
               </div>
               <div id="mysTabContent" class="tab-content containter_s" >
				 <!-- 所有商品 -->
				 <div class="tab-pane fade in active" id="all" style="">
				   <div class="" style="width:100%;height:auto;">
				     <div class="shop_all_e">
				        <img src="images/shop-prati1.png" style="width:100%;">
				        <table><tr>
				         <td class="shop_all_td1" style="color:#ff0a4f;">
				         <img src="images/ev4_.png" style="width:25px;">
				         <span style="vertical-align: middle;">2738</span>
				        </td>
				        <td class="shop_all_td1" style="color:#ccc;">
				          <span>MOP</span><span>2500</span>
				        </td>
				       </tr></table>
				       <table>
				        <tr><td class="shop_all_td2" style="">
				          <h4>英倫風古銅色小平底</h4>
				          <!--  
				          <script>
					        var header = document.getElementsByTagName('body')[0].getElementsByTagName('h4')[0];   
					        $clamp(header, {clamp: 1, useNativeClamp: false});
					    </script>-->
				        </td></tr>
				        <tr><td style="text-align:center;">
				         <a href="#"><img src="images/kep.png"></a>
				        </td></tr>
				       </table>
				     </div>
				     <div class="shop_all_e">
				        <img src="images/1.jpg" style="width:100%;">
				        <table><tr>
				         <td class="shop_all_td1" style="color:#ff0a4f;">
				         <img src="images/ev4_.png" style="width:25px;">
				         <span style="vertical-align: middle;">2738</span>
				        </td>
				        <td class="shop_all_td1" style="color:#ccc;">
				          <span>MOP</span><span>2500</span>
				        </td>
				       </tr></table>
				       <table>
				        <tr><td class="shop_all_td2" style="">
				          <h4>英倫風古銅色小平底</h4>
				          <!--  
				          <script>
					        var header = document.getElementsByTagName('body')[0].getElementsByTagName('h4')[0];   
					        $clamp(header, {clamp: 1, useNativeClamp: false});
					    </script>-->
				        </td></tr>
				        <tr><td style="text-align:center;">
				         <a href="#"><img src="images/kep.png"></a>
				        </td></tr>
				       </table>
				     </div>
				   </div>
				   </div>
				    <!-- 上新 -->
				    <div class="tab-pane fade" id="new" style=""></div>
			        <!-- 價錢 -->
				    <div class="tab-pane fade" id="money" style=""></div>
			        <!-- 粉絲 -->
				    <div class="tab-pane fade" id="fan" style=""></div>
				  </div>		         
		    </div>
		    <!-- 店主日誌 -->
		    <div class="tab-pane fade" id="diary"></div>
		    <!-- 晒圖區-->
		    <div class="tab-pane fade" id="blueprint"></div>
		    <!-- 參與活動 -->
		    <div class="tab-pane fade" id="join"></div>
		    <!-- +加入關注 -->
		    <div class="tab-pane fade" id="add"></div>          
        </div>











<!--頁腳  -->
	<div id="footer" style="clear:both;text-align:center;padding-top: 30px;">
	  <div style="padding:0;text-align:center;color:#ff0a4f;width:100%;">~沒有更多內容了~</div>
      <div style="padding:0;width:100%;"><img src="images/foot.png" style="width:100%;min-width:760px;"></div>
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
      <span style="display:block;">購物籃(<span>0</span>/<span>0</span>)</span>
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
    <li class="top_fix_lid"><a href="#" style="color:fff;">
      <img src="images/appdown.png" class="top_fix_img">
      <span style="display:block;">APP下載</span>
    </a></li>
  </ul>
</div>
  </body>
</html>
