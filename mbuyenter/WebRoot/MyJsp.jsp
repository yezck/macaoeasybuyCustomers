<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
	<script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
	   $('.list_lh li:even').addClass('lieven');
	   $('.carousel').carousel({
		 interval: 4000
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
  
  <body>
  <div class="shop_menu" style="">
          <ul id="myTab" class="nav nav-tabs shop_li">
		   <li class="active"><a href="#home" class="shop_li_a" data-toggle="tab">本店首頁</a></li>
		  </ul>
		 </div>
<div id="myTabContent" class="tab-content containter_s" >
<!-- 本店首頁 -->
		    <div class="tab-pane fade in active" id="home" style="">
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
			 </div>
  </div>
  </body>
</html>
