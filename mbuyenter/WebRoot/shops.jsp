<%@page import="customerEnter.bean.shangpin.ShangPin"%>
<%@page import="customerEnter.dao.goodsdao.ShangPinManagedao"%>
<%@page import="customerEnter.dao.shop.CustomerShopDao"%>
<%@page import="customerEnter.bean.customerUser.Customers"%>
<%@page import="customerEnter.bean.store.Shop"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ArrayList<Shop> Shops=(ArrayList<Shop>)CustomerShopDao.CustomerAllShop();
ArrayList<ShangPin> shangpinall=(ArrayList<ShangPin>)ShangPinManagedao.CustomerAddTimeShangpin();//查詢全部商品的前500行
Customers CustomerValue=(Customers)session.getAttribute("CustomerValue");//登入的客戶
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>好店街</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/clamp.js" type="text/javascript"></script><!-- 文字溢出處理js -->
    <script src="js/clamp.min.js" type="text/javascript"></script><!-- 文字溢出處理js -->
    <script src="js/bootstrap.min.js"></script>
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
      .lll {
		    padding: 0 5px;
		}
		.lll>a {
		    font-size:20px !important;
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
		*{margin: 0;padding: 0}
		.TTSlider{width:1350px;margin: 30px auto;background-color:#fff;}
		.TTSlider li{list-style-type:none;float: left;}
		.TTSlider li img{border: none;}
		.TTSliderTitle{background: #FAFAFA;height: 63px;}
		.TTSliderTitle ul{width:1350px;}
		.TTSliderTitle li{width: 165px;height: 63px;position: relative;z-index: 3;left: 0;}
		.TTSliderTitle li div{left: 0;right: 0;top: 0;bottom: 0;_width:139px;_height:62px}
		.TTSliderTitle .cur div{border: 2px solid #C3C5C7;background: #fff;z-index: 3;border-bottom: none;bottom: -2px;_height:63px;_width:136px}
		.TTSliderTitle .noneBorRight div{border-right: none;}
		.TTSliderTitle li a{display: block;width:100%;text-align: center;float: left;height: 100%;line-height: 61px;text-decoration: none;overflow: hidden;*width:49%;font-size: 16px}
		.TTSliderTitle li a img{height: 50px;margin: 6px;width: 50px}
		
		.TTSliderPic{width:1350px;padding: 20px 24px;border: 2px solid #C3C5C7;position: relative;height: auto;z-index: 1}
		.TTSliderPicList{position: relative;width:1280px;overflow: hidden;height:180px;}
		.TTSliderPic ul{position: absolute;display: none;top:3px;left: 0}
		.TTSliderPic ul.show{display: block;}
		.TTSliderPic li img{width:150px }
		.TTSliderPic li{width: 150px;padding: 0 14px;height: 180px;}
		.TTSliderPic li a{display: block;height: 150px;overflow: hidden;}
		.TTSliderPic li p{height: 30px;line-height: 30px;text-align: center;color: #ED0A0A}
		.TTSliderPrevBtn,.TTSliderNextBtn{height: 100%;width: 45px;position: absolute;top:30%;z-index: 999;top: 0;text-align: center;}
		.TTSliderPrevBtn{left:0;}
		.TTSliderNextBtn{right: 0;}
		.TTSliderPrevBtn a,.TTSliderNextBtn a{height: 30px;width: 20px;display: inline-block;background: url(./images/btn.png);margin-top: 75px}
		.TTSliderNextBtn a{background: url(./images/btn.png) no-repeat -30px 0}
		#item li{float:left;width:190px;}
		#ite li{float:left;width:190px;}
		.box{background-color:#fff;width:1350px;margin-right:auto;margin-left:auto;min-height:500px;border: 2px solid #C3C5C7;border-top:none;overflow:hidden;}
		.box ul li{text-align: center;position:relative;overflow:hidden;}
	    .box ul li .dask{width:180px;height:180px;text-align: center;padding:20px 0 0 30px;background:#000;opacity:0.5;position:absolute;top:-200px;left:4;}
	    .box ul li .dask p{color:#fff;}
	    .skb_search {
		      width: 460px;
			  float: left;
			  margin-left: 100px;
			}
    </style>     
  </head>
  
  <body style="background:url(images/index_back.png);">
    <header class="hea" style="">
	  <ul class="breadcrumb" style="float: right;">
	  <%if(CustomerValue!=null){ %>
	  <li><a  class="hea_a" onclick="return singOut();">退出</a></li>
	  <%}else{ %>
	  <li><a href="Login.jsp" class="hea_a">登入</a></li>
	  <li><a href="#" class="hea_a">註冊</a></li>
	  <%} %>
	  <li>
	  <a href="/easyBuyMall/EnterCartServlet?iUserid=<%=CustomerValue.getId()%>" class="hea_a">購物籃</a>
	  </li>
	  <li><a href="#" class="hea_a">紅包積分</a></li>
	  <li><a href="#" class="hea_a">足跡</a></li>
	  <li><a href="#" class="hea_a">分享好友</a></li>
	  <li><a href="#" class="hea_a">APP下載</a></li>
	 </ul>
	 <script type="text/javascript">
	 function singOut() {//退出
                          var r=confirm("确定退出吗？");
                           if(r==false){
                              return false;
                              }else{
                              window.location.href="GoOutCustomerLoginServlet";   
                                 return true;
                                   }
                                     }
	</script>
	</header>
	<div class="sbk_container">
	   <div class="row" style="margin:0;">
	     <div class="col-xs-12 col-sm-12" style="padding:0;">
	       <div class="skb_guid" style="float:left;">
	         <img src="images/shops_logo.png" style="width:100%;">
	       </div>
	       <div class="skb_search">
	       
	       
	       
	         <div class="col-xs-12 col-sm-12" style="padding:0;">
		         <div class="input-group" style="margin:20px 0 0 10px;">
					<div class="input-group-btn">
	                  <button type="button" class="btn skb_search_se dropdown-toggle" data-toggle="dropdown">
	                                                     搜商品
	                     <span class="caret"></span>
	                  </button>
	                  <ul class="dropdown-menu">
	                     <li><a href="../WEB-INF/page/1.jsp">搜零食</a></li>
	                     <li><a href="#">搜衣服</a></li>
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
	   </div>
	</div>
	
	
	<!-- 圖片輪播 -->
	<div>
	 <ul class="breadcrumb" style="text-align: center;margin:0 !important;">
	  <li class="lll"><a href="#" class="hea_a">首頁</a></li>
	  <li class="lll"><a href="#" class="hea_a">限時搶購</a></li>
	  <li class="lll"><a href="#" class="hea_a">今日降價</a></li>
	  <li class="lll"><a href="#" class="hea_a">本週熱賣</a></li>
	  <li class="lll"><a href="#" class="hea_a">敗家志</a></li>
	  <li class="lll"><a href="#" class="hea_a">尋寶世集</a></li>
	  <li class="lll"><a href="#" class="hea_a">量販團</a></li>
	  <li class="lll"><a href="#" class="hea_a">著數換領</a></li>
	  <li class="lll"><a href="#" class="hea_a">激平二手</a></li>
	  <li class="lll"><a href="#" class="hea_a">宜生活</a></li>
	 </ul>
	</div>
	<div><hr style="border-top: 2px solid #F3206E;margin-bottom: 7px;"></div>
	<div id="myCarousel" class="carousel slide" style="width:100%;min-width:1320px;max-height:500px;margin-bottom:10px;">
				 <ol class="carousel-indicators">
				   <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				   <li data-target="#myCarousel" data-slide-to="1"></li>
				   <li data-target="#myCarousel" data-slide-to="2"></li>
				 </ol>   
			     <div class="carousel-inner">
				  <div class="item active">
					<img src="images/nice.png" alt="First slide" style="width:100%;max-height:500px;">
					<div style="padding: 15px 0 5px 20px;margin-bottom: 50px;">
					 
					  <span style="color:#9c9c9c;font-size:1.9rem;"></span>
					</div>
					</div>
					<div class="item">
					  <img src="images/nice.png" alt="Second slide" style="width:100%;max-height:500px;">
					  <div style="padding: 15px 0 5px 20px;margin-bottom: 50px;">
					    
					    <span style="color:#9c9c9c;font-size:1.9rem;"></span>
					  </div>
					</div>
					<div class="item">
					   <img src="images/nice.png" alt="Third slide" style="width:100%;max-height:500px;">
					   <div style="padding: 15px 0 5px 20px;margin-bottom: 50px;">					    
					     <span style="color:#9c9c9c;font-size:1.9rem;"></span>
					   </div>
					</div>
				  </div>
				</div> 
		
		
		
	<!-- 選項卡 -->
<div class="col-xs-12 col-sm-12" style="padding:0;">
	<div class='TTSlider' id='TTSlider'>
		<div  class='TTSliderTitle'>
			 <ul>
			 	<li class='cur'><div><a href=''>美衣店</a></div></li>
			 	<li><div><a href=''>美鞋店</a></div></li>
			 	<li><div><a href=''>包包店</a></div></li>
			 	<li><div><a href=''>飾物店</a></div></li>
			 	<li><div><a href=''>美妝店</a></div></li>
			 	<li><div><a href=''>生活店</a></div></li>
			 	<li><div><a href=''>BB店</a></div></li>
			 	<li><div><a href=''>全部店</a></div></li>
			 </ul>
		 </div>
		 <div class='TTSliderPic'>		 	
		 	<div class='TTSliderPicList'>
		 	<!-- 美衣店 AreaID=6-->
			 	<ul class='show'>
			 	<% for(int i=0;i<Shops.size();i++){
			 	if(Shops.get(i).getGoodstype()!=null){
			 	if(Shops.get(i).getGoodstype().equals("6")){
			 	%>
			 		<li class='on'><a href=''><img src='http://wap.macaoeasybuy.com/<%=Shops.get(i).getStoreadvertising()%>'/></a><p><%=Shops.get(i).getShopname() %></p></li>
			 	<%} %>
			 	<%} %>
			 	<%} %>
			 	</ul>
			 	
			 	<ul>
			 		<% for(int i=0;i<Shops.size();i++){
			 	if(Shops.get(i).getGoodstype()!=null){
			 	if(Shops.get(i).getGoodstype().equals("14")){
			 	%>
			 		<li class='on'><a href=''><img src='http://wap.macaoeasybuy.com/<%=Shops.get(i).getStoreadvertising()%>'/></a><p><%=Shops.get(i).getShopname() %></p></li>
			 	<%} %>
			 	<%} %>
			 	<%} %>
			 	</ul>
			 	
			 	<ul>
			 	    <% for(int i=0;i<Shops.size();i++){
			 	if(Shops.get(i).getGoodstype()!=null){
			 	if(Shops.get(i).getGoodstype().equals("5")){
			 	%>
			 		<li class='on'><a href=''><img src='http://wap.macaoeasybuy.com/<%=Shops.get(i).getStoreadvertising()%>'/></a><p><%=Shops.get(i).getShopname() %></p></li>
			 	<%} %>
			 	<%} %>
			 	<%} %>
			 	</ul>
			 	<ul>
			 	    <% for(int i=0;i<Shops.size();i++){
			 	if(Shops.get(i).getGoodstype()!=null){
			 	if(Shops.get(i).getGoodstype().equals("15")){
			 	%>
			 		<li class='on'><a href=''><img src='http://wap.macaoeasybuy.com/<%=Shops.get(i).getStoreadvertising()%>'/></a><p><%=Shops.get(i).getShopname() %></p></li>
			 	<%} %>
			 	<%} %>
			 	<%} %>		 		
			 	</ul>
			 	<ul>
			 		<% for(int i=0;i<Shops.size();i++){
			 	if(Shops.get(i).getGoodstype()!=null){
			 	if(Shops.get(i).getGoodstype().equals("18")){
			 	%>
			 		<li class='on'><a href=''><img src='http://wap.macaoeasybuy.com/<%=Shops.get(i).getStoreadvertising()%>'/></a><p><%=Shops.get(i).getShopname() %></p></li>
			 	<%} %>
			 	<%} %>
			 	<%} %>
			 	</ul>
			 	<ul>
			 		<% for(int i=0;i<Shops.size();i++){
			 	if(Shops.get(i).getGoodstype()!=null){
			 	if(Shops.get(i).getGoodstype().equals("3")){
			 	%>
			 		<li class='on'><a href=''><img src='http://wap.macaoeasybuy.com/<%=Shops.get(i).getStoreadvertising()%>'/></a><p><%=Shops.get(i).getShopname() %></p></li>
			 	<%} %>
			 	<%} %>
			 	<%} %>
			 	</ul>
			 	<ul>
			 	   <% for(int i=0;i<Shops.size();i++){
			 	if(Shops.get(i).getGoodstype()!=null){
			 	if(Shops.get(i).getGoodstype().equals("19")){
			 	%>
			 		<li class='on'><a href=''><img src='http://wap.macaoeasybuy.com/<%=Shops.get(i).getStoreadvertising()%>'/></a><p><%=Shops.get(i).getShopname() %></p></li>
			 	<%} %>
			 	<%} %>
			 	<%} %>
			 	</ul>
			 	<ul>			 	   
			 		<% for(int i=0;i<Shops.size();i++){
			 	if(Shops.get(i).getGoodstype()!=null){
			 	%>
			 		<li class='on'><a href=''><img src='http://wap.macaoeasybuy.com/<%=Shops.get(i).getStoreadvertising()%>'/></a><p><%=Shops.get(i).getShopname() %></p></li>
			 	<%} %>
			 	<%} %>
			 	</ul>
			 </div>
		   <div href='javascript:;' id='TTSliderPrevBtn' class='TTSliderPrevBtn'><a href='javascript:;'></a></div>
		   <div href='javascript:;' id='TTSliderNextBtn' class='TTSliderNextBtn'><a href='javascript:;'></a></div>
		 </div>
		 
	</div>
	
	
	
	
	
	
	<script>
	window.onload=function()
	{
		var oTTSlider=document.getElementById('TTSlider');
		var oTTSliderTitle=getByClass('TTSliderTitle',oTTSlider,'div')[0];
		var aSubNav=oTTSliderTitle.getElementsByTagName('li');
		var oTTSliderPrevBtn=document.getElementById('TTSliderPrevBtn');
		var oTTSliderNextBtn=document.getElementById('TTSliderNextBtn');
		var oTTSliderPicList=getByClass('TTSliderPicList',oTTSlider,'div')[0];
		var aItem=oTTSliderPicList.getElementsByTagName('ul');
		var len=aItem.length;
		var showIndex=aItemImgWidth=iNow=0;
		var aEle=[];
		for(var i=0;i<len;i++)
		{  
			var aItemImgs=aItem[i].getElementsByTagName('li');
			if(!aItemImgWidth)
			{
				aItemImgWidth=aItemImgs[0].offsetWidth;
			}
			aEle.push(aItemImgs);	//存入数组,考虑到有多个轮播,且每个轮播里面的图片个数可能一致.
			aSubNav[i].index=i;
			aSubNav[i].onmouseover=function()//切换
			{
				var index=showIndex=this.index;  
				for(var j=0;j<len;j++)
				{
					if(j!=index)
					{
							aItem[j].className='';
							aSubNav[j].className='';
					}
				}
				aSubNav[index-1] && (aSubNav[index-1].className='noneBorRight' );
				if(index>0)
				{
					(aSubNav[0].getElementsByTagName('div')[0].style.borderLeft='1px solid #C3C5C7');
				}
				else
				{
					aSubNav[0].getElementsByTagName('div')[0].style.borderLeft='2px solid #C3C5C7';
				}
				
				aSubNav[index].className='cur';
				aItem[index].className='show';
			};
		}


		for(var i=0;i<len;i++)
		{
			var num=aEle[i].length;
			if(aItem[i].className=='show')
			{
				showIndex=i;
			}
			aItem[i].style.width=num*(aItemImgWidth)+'px';
		}
		oTTSliderNextBtn.onclick=function()
		{
			var maxNum=aEle[showIndex].length-1;
			aItem[showIndex].insertBefore(aEle[showIndex][maxNum],aEle[showIndex][0]);
			aItem[showIndex].style.left=-aItemImgWidth+'px';
			doMove(aItem[showIndex],0);
		};

		oTTSliderPrevBtn.onclick=function()
		{
			doMove(aItem[showIndex],-(aItemImgWidth),function(){
				aItem[showIndex].style.left=0;
				aItem[showIndex].appendChild(aEle[showIndex][0]);
			});
		};

		function doMove(o,t,fn)
		{
			clearInterval(o.timer);
			o.timer=setInterval(function(){
				var is= (t-getStyle(o,'left'))/8;
				is= is>0?Math.ceil(is):Math.floor(is);
				if(t==o.offsetLeft)
				{
					clearInterval(o.timer);
					(typeof fn==='function') && fn();
				}
				else
				{
					o.style.left=o.offsetLeft+is+'px';
				}

			},30);
		}
		function getStyle(o,a)
		{
			return o.currentStyle ? parseFloat(o.currentStyle[a]) : parseFloat(getComputedStyle(o,false)[a]);
		}
		function getByClass(s,p,e)
		{
			var reg=new RegExp('(\\b)'+s+'(\\b)');
			var aElement=(p||document).getElementsByTagName(e||'*');
			var aResult=[];
			for(var i=0;i<aElement.length;i++)
			{
				reg.test(aElement[i].className) && aResult.push(aElement[i]);
			}
			return aResult;
		}
	};
	
	
	</script>
	<!-- 自動輪播 -->
</div>  
  
  
	<div class="col-xs-12 col-sm-12" style="padding:10px 0 7px 0px;background-color:#fff;">	
		<div class="" style="width:1350px;margin-right:auto;margin-left:auto;height:125px;">
			<table style="border: 2px solid #C3C5C7;">
				<tr>
				 <td style="width:150px;"><img src="images/shop03.png"></td>
				 <td style="width:730px;padding:0 10px;">
				    <span>努力籌備開店中的店主們，為答謝大家的用心期待，現在向大家推出超過300款的預售商品，</span><br>
				    <span>所有預售商品是正售價的2至5折，<span style="color:#ff527c;">著數至開店日止</span>，</span><br>
				    <span>所有預售商品數量有限，售完即止：一般下單後需時7—10天送到大家手上</span>		 
				 </td>	
				 <td style="width:200px;"><img src="images/in10.png"><span>11023個宜粉查看</span></td>
				 <td style="width:160px;"><img src="images/prew2.png"><span>1523件商品</span></td>
				 <td style="width:110px;"><span>下一頁</span><img src="images/008.png"></td>	
				</tr> 
			</table>
		</div>  
	  
	</div>


	<div class="col-xs-12 col-sm-12" style="padding: 0;">
	 <div class="box" id="item">
	  <ul style="height:auto;">
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	     <div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	     <div class="dask">
	       <p>2015-12-15開店</p>
	      </div>	  
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	    <div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	     <div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	     <div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	     <div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	  	<div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	  	<div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	  	<div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>	
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	  	<div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	  	<div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	  	<div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	  	<div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	  	<div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	    <div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	   	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	    <div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	   </li>
	  <li style="text-align: center;"><img src="images/shop001.png" style="width:180px;">
	  	<div><span>籌備店：babyfeet</span><br><del>正售價：Mop150</del><br><span>預售價：Mop75</span></div>
	  	<div class="dask">
	       <p>2015-12-15開店</p>
	     </div>
	  </li>
	  </ul>
	 </div>
	</div>
	
	
	<script type="text/javascript">
	//遮罩層
	$(function () {
		$(".box ul li").hover(
			function () {
				$(this).find(".dask").stop().delay(50).animate({"top":0,opacity:0.8},300);
			 },
			function () {
				$(this).find(".dask").stop().animate({"top":-200,opacity:0},300);
			}
			
		);
	});
	</script>
	<!--  -->
	<div class="col-xs-12 col-sm-12" style="padding:10px 0 0 0px;background-color:#fff;">
	  <div class="" style="width:1350px;margin-right:auto;margin-left:auto;border: 2px solid #C3C5C7;height:50px;"id="ite">
	   <ul style="">	    
	    <li style="margin-left: 50px;margin-top: 10px;"><span style="font-size:1.9rem;font-family:fantasy;">好店街</span></li>
	    <li style="margin-left: 600px;margin-top: 10px;"><img src="images/in10.png"><span>11023宜粉查看</span></li>
	    <li style="margin-left: 800px;margin-top: -32px;"><img src="images/prew2.png"><span>1523件商品</span></li>	    
	   </ul>				
	  </div> 
	</div>  
	
	
	
	
	 
	  <div class="col-xs-12 col-sm-12" style="padding: 0;">
	 <div class="" style="background-color:#fff;width:1350px;margin-right:auto;margin-left:auto;min-height:500px;border: 3px solid #C3C5C7;border-top:none;"id="item"> 
	 
	 <%for(int i=0;i<Shops.size();i++){ %>
	   <div class="col-xs-4 col-sm-4" style="padding: 0;border: 5px solid #ffc300;">
		     <div class="col-xs-12 col-sm-12" style="padding:10px 1px;">
			       <div class="col-xs-4 col-sm-4" style="padding: 0;text-align:center;">
			         <a href="/easyBuyMall/EnterShopServlet?iUserid=<%=CustomerValue.getId()%>&iShopId=<%=Shops.get(i).getId()%>">
			         <img src="http://wap.macaoeasybuy.com/<%=Shops.get(i).getLogo() %>" style="width: 192px;height: 90px">
			         </a>
			       </div>
			       <div class="col-xs-8 col-sm-8" style="padding: 0;">
			         <div class="col-xs-1 col-sm-1" style="padding: 0;">
			           <img src="images/comma_left.png" style="width:30px;margin-top: 7px;">
			         </div>
			         <div class="col-xs-10 col-sm-10" style="padding:15px 0 0 5px;text-align:center;">
			           <span><%=Shops.get(i).getShopInfor() %></span><br>
			         </div>
			         <div class="col-xs-1 col-sm-1" style="padding: 0;">
			           <img src="images/comma_right.png" style="width:30px;margin-top:11px;">
			         </div>
			       </div>
		     </div>
	   	     <div class="col-xs-12 col-sm-12" style="padding:0 35px;">	   	
	   	     <%
	   	     ArrayList<ShangPin> shangpinsesion=ShangPinManagedao.CustomerAddTimeShSession(shangpinall, Shops.get(i).getId()); 
	   	     int total[]=ShangPinManagedao.TotalSeeBuyNum(shangpinsesion);%>
	   	       <div class="col-xs-6 col-sm-6"><img src="images/in10.png"><span><%=total[0] %>次查看</span></div>
	   	       <div class="col-xs-6 col-sm-6"><img src="images/small1.png"><span><%=total[1] %>件累計售出</span></div>
	   	     </div>	
	   	   <div class="col-xs-12 col-sm-12" style="text-align:center;padding:-1 35px;">
	   	       <ul style="margin:0;">
	   	       <%ArrayList<ShangPin> shangPsession=ShangPinManagedao.CustomerAddTimeShSession(shangpinall, Shops.get(i).getId()); 
	   	       if(shangPsession.size()<9){
	   	       for(int j=0;j<shangPsession.size();j++){
	   	       %>
	   	       <%if(shangPsession.get(j).getPic2()==null||shangPsession.get(j).getPic2().trim().equals("")||shangPsession.get(j).getPic2().trim().length()<49){ %>
	   	       	<li style="float:left;width:135px;height: 170px;"><a href="/easyBuyMall/goodsdetailServlet?numberNo=<%=shangPsession.get(j).getNumber()%>"><img src="images/notgoods.png" style="width:140px;height: 140px;"></a></li>
	   	       <%}else{ %>
	   	       <li style="float:left;width:135px;height: 170px;"><a href="/easyBuyMall/goodsdetailServlet?numberNo=<%=shangPsession.get(j).getNumber()%>"><img src="http://wap.macaoeasybuy.com/<%=shangPsession.get(j).getPic2() %>" style="width:140px;height: 140px;"></a></li>
	   	       <%} %>
	   	       <%} %>
	   	       
	   	       <%for(int k=0;k<9-shangPsession.size();k++){ %>
	   	       <li style="float:left;width:135px;height: 170px;"><img src="images/notgoods.png" style="width:140px;height: 140px;"></li>
	   	       <%} %>
	   	       
	   	       
	   	       
	   	       <%}else{
	   	       for(int j=0;j<9;j++){%>
	   	       <%if(shangPsession.get(j).getPic2()==null||shangPsession.get(j).getPic2().trim().equals("")||shangPsession.get(j).getPic2().trim().length()<49){ %>
	   	       	<li style="float:left;width:135px;height: 170px;"><a href="/easyBuyMall/goodsdetailServlet?numberNo=<%=shangPsession.get(j).getNumber()%>"><img src="images/notgoods.png" style="width:140px;height: 140px;"></a></li>
	   	       <%}else{ %>
	   	       <li style="float:left;width:135px;height: 170px;"><a href="/easyBuyMall/goodsdetailServlet?numberNo=<%=shangPsession.get(j).getNumber()%>"><img src="http://wap.macaoeasybuy.com/<%=shangPsession.get(j).getPic2() %>" style="width:140px;height: 140px;"></a></li>
	   	       <%} %>
	   	       <%} %>
	   	       <%} %>
	   	       </ul>
	   	   </div>  	  
	     </div>
	   <%} %>
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