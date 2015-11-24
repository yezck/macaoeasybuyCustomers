<%@page import="java.math.BigDecimal"%>
<%@page import="customerEnter.dao.goodsdao.ShangPinCommentdao"%>
<%@page import="customerEnter.bean.shangpin.ShangPinComment"%>
<%@page import="customerEnter.dao.goodsdao.ShangPinManagedao"%>
<%@page import="customerEnter.tool.DataTimeNumber"%>
<%@page import="customerEnter.bean.customerUser.Customers"%>
<%@page import="customerEnter.dao.shop.CustomerShopDao"%>
<%@page import="customerEnter.bean.shangpin.Area"%>
<%@page import="customerEnter.bean.shangpin.ShangPin"%>
<%@page import="customerEnter.bean.store.Shop"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Customers CustomerValue=(Customers)session.getAttribute("CustomerValue");//登入的客戶

Shop shop =(Shop)session.getAttribute("shopdetails");
ShangPin goodsdetails =(ShangPin)session.getAttribute("goodsdetails");

/*一下商品評價信息是為了計算
    累積銷售量，好評率，最近已購買數量，宜粉心動，宜粉數量
*/
ArrayList<ShangPinComment> shangpincomment =(ArrayList<ShangPinComment>)session.getAttribute("shangpincomment");
ArrayList<ShangPin> shangpinshopsall =(ArrayList<ShangPin>)session.getAttribute("shangpinshopsall");//此店的全部商品信息

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品詳細信息</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
	<link rel="stylesheet" href="css/jquery.webui-popover.min.css"> 
	<link rel="stylesheet" type="text/css" href="square/blue.css">
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/scroll.js"></script>
	<script src="js/clamp.js" type="text/javascript"></script>
    <script src="js/clamp.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.webui-popover.min.js"></script>
    <script type="text/javascript" src="js/jquery.masonry.min.js"></script>
    <script src="js/icheck.js" type="text/javascript"></script>
    <script>
	  $(document).ready(function(){
        var $container = $('#con1_1');	
			$container.imagesLoaded(function(){
				$container.masonry({
					itemSelector: '.product_list',
					columnWidth: 5 //每两列之间的间隙为5像素
				});
			});
		$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea: '20%' // optional
			});
		});

	  </script>
	  <style>
	    .nav-tabs>li>a{
		   border:none;
		}
		
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
	      .btn-default{
	        color:#8f8f8f;
	      }
	  </style>
  </head>
  
  <body style="background:url(images/index_back.png);background-attachment:fixed;">
    <header class="hea" style="">
	  <ul class="breadcrumb" style="float: right;">
	 <%if(CustomerValue!=null){ %>
	  <li><a  class="hea_a" onclick="return singOut();">退出</a></li>
	  <%}else{ %>
	  <li><a href="Login.jsp" class="hea_a">登入</a></li>
	  <li><a href="#" class="hea_a">註冊</a></li>
	  <%} %>
	  <li><a href="#" class="hea_a">購物籃</a></li>
	  <li><a href="#" class="hea_a">紅包積分</a></li>
	  <li><a href="#" class="hea_a">足跡</a></li>
	  <li><a href="#" class="hea_a">分享好友</a></li>
	  <li><a href="#" class="hea_a">APP下載</a></li>
	 </ul>
	</header>
	<div class="shop_logo"><img src="http://wap.macaoeasybuy.com/<%=shop.getLogo() %>" style="width:100%;"></div>
    <div class="shop_li">
       <ul class="breadcrumb" style="margin:0;">
	    <li style="margin-right:10px;"><span class="shop_a">商品數量：</span><span style="color:#fd8970;">128</span></li>
	    <li style="margin-right:10px;"><span class="shop_a">商品類別：</span>
	     <%
	   String  ShopGoogType="";
	   if(shop.getGoodstype()==null||shop.getGoodstype().trim().equals("")){
	   ShopGoogType="未知";
	   }else{
	   Area shoparea= CustomerShopDao.querySPArea(Integer.parseInt(shop.getGoodstype()));
	   if(shoparea!=null){
              ShopGoogType=shoparea.getName();
	   }else{
	    ShopGoogType="未知";
	   }
	   }
	     %>
	    <span style="color:#fd8970;"><%=ShopGoogType %></span></li>
	    <li style="margin-right:10px;"><span class="shop_a">商品評級：</span>
	      <img src="images/heart.png" class="shop_li_ic" alt="夠用心">
	      <!--<img src="images/good.png" class="shop_li_ic" alt="信譽好">-->
	      <!--<img src="images/money.png" class="shop_li_ic" alt="保證金">-->
	      <!--<img src="images/nice.png" class="shop_li_ic" alt="服務優">-->
	      <!--<img src="images/place.png" class="shop_li_ic" alt="實體店">-->
	    </li>
	    <li style="margin-right:10px;"><span class="shop_a">舉報投訴：</span><span style="color:#fd8970;"><%=shop.getTel() %></span></li>
	    <li><span class="shop_a">創店：</span><span style="color:#fd8970;"><%=shop.getAddtime() %></span></li>
	   </ul>
	 </div>
	  <div class="shop_menu" style="">
          <ul id="myTab" class="nav nav-tabs shop_li">
		   <li class="active"><a href="#home" class="shop_li_a" data-toggle="tab">本店首頁</a></li>
		   <li class=""><a href="#diary" class="shop_li_a" data-toggle="tab">店主日誌</a></li>
		   <li class=""><a href="#blueprint" class="shop_li_a" data-toggle="tab">晒圖區</a></li>
		   <li class=""><a href="#join" class="shop_li_a" data-toggle="tab">參與活動</a></li>
		   <li class=""><a href="#add" class="shop_li_as" data-toggle="tab">+加入關注 &nbsp;<img src="images/shop_qro.png" class="sho_li_qro"></a></li>
		  </ul>
          <div id="myTabContent" class="tab-content containter_s" >
            <div class="tab-pane fade in active" id="home" style="">
               <div class="row"style="margin:0;padding:0;">
                 <div class="col-xs-12 col-sm-12" style="padding:0;background-color:#fff;margin-top: 20px;">
                    <div class="col-xs-6 col-sm-6" style="padding:0;"><img src="http://wap.macaoeasybuy.com/<%=goodsdetails.getPic() %>" class="shopin_img" style="width: 699px;height: 402px"></div>
                    <div class="col-xs-6 col-sm-6" style="padding:0;"><img src="http://wap.macaoeasybuy.com/<%=goodsdetails.getPic2() %>" class="shopin_img"style="width: 685px;height: 350px"></div>
<!-- 店鋪介紹與店長頭像 -->                    
                    <div class="shopin_p1">
                      <div class="col-xs-12 col-sm-12" style="padding: 15px 16px 0;">
<!-- 左側引號 -->                         
                        <div class="col-xs-1 col-sm-1" style="padding:0;">
                          <img src="images/shopin_left.png" style="width:20px;">
                        </div>
<!-- 店鋪介紹 -->                          
                        <div class="col-xs-10 col-sm-10" style="padding:10px 0 0;color:#ff5b77;">
                         <p style="margin:0;">
                         <%if(goodsdetails.getIntro()==null||goodsdetails.getIntro().trim().length()==0) {%>
                                           <center>未描述任何店鋪信息</center>
                         <%}else{ %>
                                                <%=goodsdetails.getIntro() %>
                         <%} %>
                         </p>
                         <script>
					          var paragraph = document.getElementsByTagName('body')[0].getElementsByTagName('p')[0];
					          $clamp(paragraph, {clamp: 3, useNativeClamp: false, animate: false});
					       </script>
                        </div>
<!-- 右側引號 -->                           
                        <div class="col-xs-1 col-sm-1" style="padding:0;">
                          <img src="images/shopin_right.png" style="width:20px;">
                        </div>
                      </div>
<!-- 店長頭像 -->                         
                      <div class="col-xs-12 col-sm-12" style="padding:0;text-align:center;margin-top: 20px;">
                      <%if(shop.getShopPic()==null||shop.getShopPic().trim().length()<40){ %>
                      <img src="images/gmp3.jpg" style="width:70px;height:70px;">
                      <%}else{ %>
                       <img src="http://wap.macaoeasybuy.com/<%=shop.getShopPic() %>" style="width:70px;height:70px;">
                      <%} %>
                        <div style="">店長
                        <%if(shop.getShopMan()==null||shop.getShopMan().trim().length()==0){ %>
                        ———
                        <%}else{ %>
                        <%=shop.getShopMan() %>
                        <%} %>
                        </div>
                      </div>
                    </div>
                 </div>
                 <div class="col-xs-12 col-sm-12" style="padding:0;border:1px solid #ccc;background-color:#fff;">
                   <table><tr>
                     <td style="border-right:1px solid #ccc;width:70%;min-height:734px;">
	                       <div class="col-xs-12 col-sm-12" style="padding:0;border-bottom:1px solid #ccc;">
	                         <div class="col-xs-5 col-sm-5" style="padding:0;">
<!-- 商品主圖塊 -->                         
	                            <div class="col-xs-12 col-sm-12" style="padding:0;margin-top: 30px;text-align:center;">
<!-- 圖片回形針 -->	                              
	                              <img src="images/shopin_clip.png" class="shopin_clip">
<!-- 商品主圖-->	                              
	                              <img src="http://wap.macaoeasybuy.com/<%=goodsdetails.getPic2() %>" class="shopin_projection">                     
	                            </div>
<!-- 推薦商品 -->	                            
	                            <div class="col-xs-12 col-sm-12 shopin_recommend" style="">
	                              <span class="shopin_releft">搭配推薦</span>
	                              <span class="shopin_reright">換一換</span>
	                            </div>
	                            <div class="col-xs-12 col-sm-12" style="">
	                              <ul>
	                                <li class="shopin_reli"><a href="#"><img src="images/shopin_4.png" class="shopin_reimg"></a></li>
	                                <li class="shopin_reli"><a href="#"><img src="images/shopin_5.png" class="shopin_reimg"></a></li>
	                                <li class="shopin_reli" style="margin:0;"><a href="#"><img src="images/shopin_6.png" class="shopin_reimg"></a></li>
	                              </ul>
	                            </div>
	                         </div>
	                         <div class="col-xs-7 col-sm-7" style="padding:0;">
	                           <div class="col-xs-12 col-sm-12" style="padding: 0 10px 0 0;margin-top: 30px;">
<!-- 商品名稱 -->	                             
	                             <div class="col-xs-12 col-sm-12" style="padding:0;">
	                               <div style="font-size:19px;float:left;">
	                               <%if(goodsdetails.getTitle()==null||goodsdetails.getTitle().trim().length()==0){ %>
	                               暫未編輯商品名稱
	                               <%}else{ %>
	                               <%=goodsdetails.getTitle() %>
	                               <%} %>
	                               </div>
	                               <button class="shopin_healper">尺碼助手</button>
	                                <div class="content_gd">
									  <div class="row" style="margin: 0;padding: 0;">
									  	<ul id="myTab11" class="nav nav-tabs sexchose">
										   <li class="active"><a href="#boy" data-toggle="tab">男生</a></li>
										   <li><a href="#girl" data-toggle="tab">女生</a></li>
										</ul>
										<div id="myTab11Content" class="tab-content" style="width:450px;">
										   <div class="tab-pane fade in active" id="boy">
										    <div class="col-xs-12 col-sm-12" style="">
										      <div class="col-xs-12 col-sm-12 sextxt" style="padding: 10px 5px;">
										        <label><span style="">身高(厘米/CM)：</span><input type="text" class="sexinput" placeholder="一定要填寫的哦"></label>
										      </div>
										      <div class="col-xs-12 col-sm-12 sextxt" style="padding:0 5px 10px 5px;">
										        <label><span style="">體重(公斤/KG)：&nbsp;</span><input type="text"  class="sexinput" placeholder="一定要填寫的哦"></label>
										      </div>
										    </div>
										    <div class="col-xs-12 col-sm-12" style="padding:0;">
										      <ul id="myTab00" class="nav nav-tabs sizechose">
											   <li class="active"><a href="#boyjacket" data-toggle="tab">上衣-尺碼建議</a></li>
											   <li><a href="#boypants" data-toggle="tab">褲子-尺碼建議</a></li>
											  </ul>
											  <div id="myTab00Content" class="tab-content" style="width:450px;height:auto;">
											   <div class="tab-pane fade in active" id="boyjacket">
											      <div class="col-xs-12 col-sm-12" style="padding:0;background-color:#f6f6f6;">
											        <div class="col-xs-6 col-sm-6" style="padding:20px 0;">
											          <div class="col-xs-12 col-sm-12" style="padding:20px 0;">
											            <table class="sizetable">
											              <tr>
											                <td><img src="images/shopin_a.png" class="sizeletter"><span class="sizetablesp">肩寬</span></td>
											                <td><img src="images/shopin_b.png" class="sizeletter"><span class="sizetablesp">袖圍</span></td>
											              </tr>
											              <tr>
											                <td><img src="images/shopin_c.png" class="sizeletter"><span class="sizetablesp">袖長</span></td>
											                <td><img src="images/shopin_d.png" class="sizeletter"><span class="sizetablesp">衣長</span></td>
											              </tr>
											              <tr>
											                <td><img src="images/shopin_e.png" class="sizeletter"><span class="sizetablesp">胸圍</span></td>
											                <td><img src="images/shopin_f.png" class="sizeletter"><span class="sizetablesp">腰圍</span></td>
											              </tr>
											            </table>
											          </div>
											          <div class="col-xs-12 col-sm-12" style="padding:20px 0;">
											            <table class="sizeoffer">
											              <tr>
											                <td class="sizeftd"><span>建議購買</span></td>
											                <td class="sizeftd"><span>M碼</span></td>
											              </tr>
											              <tr>
											                <td class="sizesecontd"><span>肩寬cm</span></td>
											                <td class="sizesecontd"><span>44</span></td>
											              </tr>
											              <tr>
											                <td class="sizesecontd"><span>胸圍cm</span></td>
											                <td class="sizesecontd"><span>86-89</span></td>
											              </tr>
											              <tr>
											                <td class="sizesecontd"><span>腰圍cm</span></td>
											                <td class="sizesecontd"><span>76-79</span></td>
											              </tr>
											              <tr>
											                <td class="sizesecontd"><span>適合身高cm</span></td>
											                <td class="sizesecontd"><span>168-172</span></td>
											              </tr>
											            </table>
											          </div>
											          <div class="col-xs-12 col-sm-12 sizetxt2" style="">
											             <span>建議您選購<span>Ｍ</span>碼上衣</span><br>
											             <span> 實際需視乎自己體形哦～</span>
											          </div>
											        </div>
											        <div class="col-xs-6 col-sm-6" style="padding:0;text-align:center;">
											          <div class="col-xs-12 col-sm-12" style="padding:20px 0;">
											            <img src="images/clothstyle.png" style="width:190px;">
											          </div>
											          <div class="col-xs-12 col-sm-12" style="padding:20px 0;">
											            <img src="images/clothstyle1.png" style="width:190px;">
											          </div>
											        </div>
											      </div>
											   </div>
											   <div class="tab-pane fade" id="boypants">
											      
											   </div>
											  </div>
										    </div>	      
										   </div>
										   <div class="tab-pane fade" id="girl">
										     <div class="col-xs-12 col-sm-12" style="">
										      <div class="col-xs-12 col-sm-12 sextxt" style="padding: 10px 5px;">
										        <label><span style="">身高(厘米/CM)：</span><input type="text" class="sexinput" placeholder="一定要填寫的哦"></label>
										      </div>
										      <div class="col-xs-12 col-sm-12 sextxt" style="padding:0 5px 10px 5px;">
										        <label><span style="">體重(公斤/KG)：&nbsp;</span><input type="text"  class="sexinput" placeholder="一定要填寫的哦"></label>
										      </div>
										    </div>
										    <div class="col-xs-12 col-sm-12" style="padding:0;">
										      <ul id="myTab00" class="nav nav-tabs sizechose">
											   <li class="active"><a href="#girljacket" data-toggle="tab">上衣-尺碼建議</a></li>
											   <li><a href="#girlpants" data-toggle="tab">褲子-尺碼建議</a></li>
											  </ul>
											  <div id="myTab00Content" class="tab-content" style="width:450px;height:auto;">
											   <div class="tab-pane fade in active" id="girljacket">
											      <div class="col-xs-12 col-sm-12" style="padding:0;background-color:#f6f6f6;">
											        <div class="col-xs-6 col-sm-6" style="padding:20px 0;">
											          <div class="col-xs-12 col-sm-12" style="padding:20px 0;">
											            <table class="sizetable">
											              <tr>
											                <td><img src="images/shopin_a.png" class="sizeletter"><span class="sizetablesp">肩寬</span></td>
											                <td><img src="images/shopin_b.png" class="sizeletter"><span class="sizetablesp">袖圍</span></td>
											              </tr>
											              <tr>
											                <td><img src="images/shopin_c.png" class="sizeletter"><span class="sizetablesp">袖長</span></td>
											                <td><img src="images/shopin_d.png" class="sizeletter"><span class="sizetablesp">衣長</span></td>
											              </tr>
											              <tr>
											                <td><img src="images/shopin_e.png" class="sizeletter"><span class="sizetablesp">胸圍</span></td>
											                <td><img src="images/shopin_f.png" class="sizeletter"><span class="sizetablesp">腰圍</span></td>
											              </tr>
											            </table>
											          </div>
											          <div class="col-xs-12 col-sm-12" style="padding:20px 0;">
											            <table class="sizeoffer">
											              <tr>
											                <td class="sizeftd"><span>建議購買</span></td>
											                <td class="sizeftd"><span>M碼</span></td>
											              </tr>
											              <tr>
											                <td class="sizesecontd"><span>肩寬cm</span></td>
											                <td class="sizesecontd"><span>44</span></td>
											              </tr>
											              <tr>
											                <td class="sizesecontd"><span>胸圍cm</span></td>
											                <td class="sizesecontd"><span>86-89</span></td>
											              </tr>
											              <tr>
											                <td class="sizesecontd"><span>腰圍cm</span></td>
											                <td class="sizesecontd"><span>76-79</span></td>
											              </tr>
											              <tr>
											                <td class="sizesecontd"><span>適合身高cm</span></td>
											                <td class="sizesecontd"><span>168-172</span></td>
											              </tr>
											            </table>
											          </div>
											          <div class="col-xs-12 col-sm-12 sizetxt2" style="">
											             <span>建議您選購<span>Ｍ</span>碼上衣</span><br>
											             <span> 實際需視乎自己體形哦～</span>
											          </div>
											        </div>
											        <div class="col-xs-6 col-sm-6" style="padding:0;text-align:center;">
											          <div class="col-xs-12 col-sm-12" style="padding:20px 0;">
											            <img src="images/clothstyle.png" style="width:190px;">
											          </div>
											          <div class="col-xs-12 col-sm-12" style="padding:20px 0;">
											            <img src="images/clothstyle1.png" style="width:190px;">
											          </div>
											        </div>
											      </div>
											   </div>
											   <div class="tab-pane fade" id="girlpants">
											      
											   </div>
											  </div>
										    </div>	      
										   </div>									   
										   </div>
										</div>										
									  </div>	
                                     </div>
									<script type="text/javascript">
										$(function (){
											//使用bind的绑定事件,跟上上面的效果是一样的
											$(".shopin_healper").bind("click", function (){
												var flag = $(".content_gd").is(":hidden");
												if(flag){
													$(".content_gd").show();
												}else{
													$(".content_gd").hide();
												}
											});
										});
									</script>
	                             </div>
<!--編號 -->	                             
	                             <div class="col-xs-12 col-sm-12 shopin_txt" style="">
	                               <span style="">編號：</span>
	                               <span><%=goodsdetails.getNumber() %></span>
	                             </div>
<!-- 原價 -->	                             
	                             <div class="col-xs-12 col-sm-12 shopin_txt" style="">
	                               <span style="">原價：</span>
	                               <del>MOP <%=goodsdetails.getCostPrice()%></del>
	                             </div>
<!-- 現價 -->	                             
	                             <div class="col-xs-12 col-sm-12 shopin_txt1" style="">
	                               <div style="float:left;">現價：</div>
	                               <div style="float:left;margin: -4px 4px 0;">
	                                 <div class="shopin_nowprice">MOP <%=goodsdetails.getPrice()%></div>
	                                 <div class="shopin_savemoney">為您節省MOP <span><%=goodsdetails.getCostPrice()-goodsdetails.getPrice() %></span></div>
	                               </div>
	                             </div>
<!-- 圖片規格 -->	                             
	                             <div class="col-xs-12 col-sm-12" style="padding:0;">
							  	    <div class="shopin_standard"><span>規格：</span></div>
								  	<div class="iListr" style="float:left;width:340px;margin:10px 0 0 0;">
									  <ul>
										<li>
							<%
							List<String>guigeone= DataTimeNumber.getGuigeOne(goodsdetails.getTupian());
							if(guigeone.size() ==0){%>
							<em><img src="images/notgoods.png" class="shopin_standli"><i></i></em>
							<%}else{
					         %>
					        <%for(int l=0;l<guigeone.size();l++){ %>
							<em><img src="http://wap.macaoeasybuy.com/<%=guigeone.get(l)%>" class="shopin_standli"><i></i></em>
						    <%
						          } 
						          } 
						   %>
						   <!--  
										  <em><img src="images/skbpr1.png" class="shopin_standli"><i></i></em>
										  <em><img src="images/skbpr1.png" class="shopin_standli"><i></i></em>
										  <em><img src="images/skbpr1.png" class="shopin_standli"><i></i></em>
									      <em><img src="images/skbpr1.png" class="shopin_standli"><i></i></em>
										  <em><img src="images/skbpr1.png" class="shopin_standli"><i></i></em>
										  <em><img src="images/skbpr1.png" class="shopin_standli"><i></i></em>
							-->
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
<!-- 尺碼規格 -->							  	  
							  	  <div class="col-xs-12 col-sm-12" style="padding:0;">
						  	  		  <div class="shopin_standard" style="margin-top: 10px;"><span>規格：</span></div>
							  	  	  <div class="yListr" style="float:left;width:340px;margin-left: 8px;">
										<ul>
										   <li>
							<%
							List<String>guigetow= DataTimeNumber.getGuigeTwo(goodsdetails.getGuige());
							if(guigetow.size() ==0){%>
							<button>統一碼</button>
							<%}else{
					         %>
					        <%for(int l=0;l<guigetow.size();l++){ %>
							<button><%=guigetow.get(l) %></button>
						    <%
						          } 
						          } 
						   %>
						<button class="yListr_butdis" disabled="disabled">40碼</button>
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
<!-- 數量 -->						  	  	  
						  	  	  <div class="col-xs-12 col-sm-12" style="padding:0;">
						  	  	     <div class="col-xs-12 col-sm-12 shopin_txt" style="">
		                               <div style="float:left;">數量：</div>
		                               <div class="input-group skb_btgroup" style="float:left;margin:-5px 0 0 8px;">
											<div class="input-group-btn">
											
							                  <button type="button" class="btn skb_btnadd dropdown-toggle" onclick="DeleteNumber();">
							                    <span class="skb_addbtic">-</span>
							                  </button>
							                  
							               </div><!-- /btn-group -->
							               <input type="text" class="form-control skb_addtxt" placeholder="0" id="numberno" name="numberNo" value="1">
							               <span class="input-group-btn">
							               
							                  <button class="btn skb_btnadd" type="button" onclick="AddNumber();">
							                    <span class="skb_addbtic">+</span>
							                  </button>
							                  
							               </span>
							            </div>
							            <div style="float:left;margin-left:10px;">
						<%
			            String[] InvenArray=DataTimeNumber.StringInventory(goodsdetails.getKucun());
			            int InvenTotal=DataTimeNumber.Kucun(InvenArray);
			             %>
							            <span><%=InvenTotal %></span>件存貨</div>
		                             </div>
						  	  	  </div>
<script type="text/javascript">
function AddNumber(){
var num=document.getElementById("numberno").value;
                             num++;
                             
                    document.getElementById("numberno").value=num;
}
function DeleteNumber(){
var num=document.getElementById("numberno").value;
if(num<=1){
 document.getElementById("numberno").value=num;
}else{
num--;
document.getElementById("numberno").value=num;
}
}
</script>
<!-- 運費 -->						  	  	  
						  	  	  <div class="col-xs-12 col-sm-12" style="padding:0;">
						  	  	    <div class="col-xs-12 col-sm-12 shopin_txt" style="">
						  	  	      <div style="float:left;">運費：</div>
						  	  	      <select class="shopin_drobtn">
						  	  	        <option>澳門半島</option>
						  	  	        <option>珠海</option>
						  	  	        <option>澳門半島</option>
						  	  	      </select>
						  	  	      <!--  
						  	  	      <div class="btn-group" style="float:left;margin:-5px 0 0 8px;">
									     <button type="button" class="shopin_drobtn btn-default dropdown-toggle" data-toggle="dropdown">
									        收貨地區 <span class="caret"></span>
									     </button>
									     <ul class="dropdown-menu" role="menu">
									        <li><span>澳門半島</span></li>
									        <li><span>珠海</span></li>
									        <li><span>江門</span></li>
									     </ul>
									  </div>
									  -->
									  <div style="float:left;margin-left:10px;">MOP <span>0.00</span></div>
						  	  	    </div>
						  	  	  </div>
	                           </div>
	                         </div>
	                          <div class="col-xs-12 col-sm-12" style="padding:20px 15px;">
		                         <span style="font-size:18px;color:#8f8f8f;">本商品參與了：</span>
		                         <span><img src="images/shopin_8.png" class="shopin_joinimg"></span>
		                         <span><img src="images/shopin_9.png" class="shopin_joinimg"></span>
		                         <span><img src="images/shopin_10.png" class="shopin_joinimg"></span>
		                         <span><img src="images/shopin_11.png" class="shopin_joinimg"></span>
		                       </div>
	                       </div>
	                      <%
	   	                       ArrayList<ShangPin> shangpinsesion=ShangPinManagedao.CustomerAddTimeShSession(shangpinshopsall, shop.getId()); 
	   	                        int total[]=ShangPinManagedao.TotalSeeBuyNum(shangpinsesion);
	   	                  %>
	                       <div class="col-xs-12 col-sm-12" style="padding:0;height:50px;border-top:1px solid #ccc;">
	                         <div class="shopin_static_dia"></div>
	                         <div class="col-xs-12 col-sm-12 shopin_static_s" style="padding: 11px 0;">
	                           <div class="col-xs-4 col-sm-4" style="padding:0;text-align:center;">
	                             <span><img src="images/shopin_sale.png" class="shopin_static_ic"></span>
	                              <span style="color:#8f8f8f;">累計銷量</span>
	                              <span style="color:#ff5b77;"><span><%=total[1] %></span>件</span>
	                           </div>
	                           <div class="col-xs-4 col-sm-4" style="padding:0;text-align:center;">
	                              <span><img src="images/shopin_like.png" class="shopin_static_ic"></span>
	                              <span style="color:#8f8f8f;">好評率</span>
	                              <span style="color:#ff5b77;">
	                             <%
	                             double Totalcom=0;
	                            double[]commentNum= ShangPinCommentdao.calculateComment(shangpincomment, goodsdetails.getNumber());
	                            Totalcom=commentNum[0]+commentNum[1]+commentNum[2];
	                            BigDecimal   b1   =   new   BigDecimal(Totalcom/15);
			                     double   Highpraise   =   b1.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();//保留兩位小數
	                              %>
	                              <span><%=Highpraise*100 %></span>%</span>
	                           </div>
	                           <div class="col-xs-4 col-sm-4" style="padding:0;text-align:center;">
	                              <span><img src="images/shopin_buys.png" class="shopin_static_ic"></span>
	                              <%
	                              String[] ArrayComment=new String[shangpincomment.size()];
                                  for(int i=0;i<shangpincomment.size();i++){
                                  ArrayComment[i]=""+shangpincomment.get(i).getUserId();
                                   }
                                  List<String> lsiy=DataTimeNumber.RemoveReArray(ArrayComment);
	                               %>
	                              <span style="color:#ff5b77;"><span><%=lsiy.size() %></span>人</span>
	                              <span style="color:#8f8f8f;">最近已購買</span>                       
	                           </div>
	                         </div>
	                       </div>
                     </td>
<!-- addcart -->
                     <td style="background-color:#ffedf0;width:30%;padding: 25px 0;">
                       <div class="col-xs-12 col-sm-12" style="padding:0;">
                           <img src="images/shopin_strip.png" style="width:100%;">
                       </div>
                       <div class="col-xs-12 col-sm-12" style="padding:0;">
                         <div class="shopin_right">
                           <div class="col-xs-12 col-sm-12" style="padding:30px 15px 0;min-height:599px;">
                             <div class="col-xs-12 col-sm-12" style="padding:0;border-bottom:2px solid #ccc;">
                               <div class="shopin_amountpaid" style="">您的實付金額(MOP)：</div>
                               <div class="shopin_amountpaid1">150.00</div>
                             </div>
                             <div class="col-xs-12 col-sm-12" style="padding:0;">
                               <div class="shopin_savemoney" style="float:right;">為您節省MOP <span>200</span></div>
                             </div>
                             <div class="col-xs-12 col-sm-12" style="padding:0;min-height:240px;">
	                             <div class="col-xs-12 col-sm-12 shopin_acquire" style="">
	                               <div class="shopin_acquire1">購買此商品將獲得：</div>
	                               <div class="shopin_acquire2">店主贈送 10分積分</div>
	                             </div>
	                             <div class="col-xs-12 col-sm-12 shopin_acquire3" style="">
	                               <div class="shopin_acquire2">店主贈送 MOP 5 紅包</div>
	                             </div>
	                             <div class="col-xs-12 col-sm-12 shopin_acquire3" style="">
	                               <div class="shopin_acquire2">免收代購費</div>
	                             </div>
	                             <div class="col-xs-12 col-sm-12 shopin_acquire3" style="">
	                               <div class="shopin_acquire2">免費送貨到樓下</div>
	                             </div>
	                             <div class="col-xs-12 col-sm-12 shopin_acquire3" style="">
	                               <div class="shopin_acquire2">宜買贈送 MOP 2 紅包</div>
	                             </div>
                             </div>
                             <div class="col-xs-12 col-sm-12" style="padding:0 0 10px 0px;border-bottom:2px solid #ccc;margin-top: 10px;">
                                <div class="col-xs-12 col-sm-12" style="padding:0;text-align:center;">
                                  <button class="shopin_rightbtn">
                                    <img src="images/shopin_buy.png" style="width: 55px;">
                                    <span style="vertical-align: middle;">馬上搶購</span>
                                  </button>
                                </div>
                                <div class="col-xs-12 col-sm-12" style="padding:0;text-align:center;">
                                  <button class="shopin_rightbtn1">
                                    <img src="images/shopin_cart.png" style="width: 55px;">
                                    <span style="vertical-align: middle;">加入購物籃</span>
                                  </button>
                                </div>
                                <div class="col-xs-12 col-sm-12" style="padding: 5px 0;">
                                   <div class="col-xs-6 col-sm-6" style="padding-right:0;">
                                     <button class="shopin_rightbtn3">
                                        <img src="images/shopin_heart.png" st
                                        yle="width: 45px;">
                                        <span style="vertical-align: middle;">心動收藏</span>
                                     </button>
                                   </div>
                                   <div class="col-xs-6 col-sm-6" style="padding-left:0;">
                                     <button class="shopin_rightbtn4">
                                       <img src="images/shop_x.png" style="width: 45px;">
                                       <span style="vertical-align: middle;">問題舉報</span>
                                     </button>
                                   </div>
                                </div>
                             </div>
                             <div class="col-xs-12 col-sm-12" style="padding: 10px 0 0;text-align:center;">
                                <img src="images/shop-logo.png" style="width:120px;opacity: 0.5;">
                             </div>
                           </div>
                           <div class="col-xs-12 col-sm-12" style="padding:0;">
                               <div class="shopin_rightdown"></div>
                             </div>
                         </div>
                       </div>
                       
                     </td>
                   </tr></table>
                 </div>
<!--粉絲  -->
                 <div class="col-xs-12 col-sm-12" style="padding: 10px 0;border:1px solid #ccc;border-top:none;background-color:#fff;">
                 <!-- 心動 -->
                    <div class="col-xs-2 col-sm-2" style="padding:0;margin-top: 15px;">
                     <div class="col-xs-6 col-sm-6" style="padding:0;">
                      <div style="float:right;">
                        <img src="images/shopin_heart.png" style="width:45px;">
                      </div>
                     </div>
                     <div class="col-xs-6 col-sm-6" style="padding:0;">
                       <div style="float:left;text-align:center;margin-left: 10px;"> 
                       <%int TotalLove=0;
                       if(shangpinshopsall!=null&&shangpinshopsall.size()!=0){
                         for(int s=0;s<shangpinshopsall.size();s++){
                         if(shangpinshopsall.get(s).getNumber().equals(goodsdetails.getNumber())){
                         TotalLove=TotalLove+shangpinshopsall.get(s).getLoveNum()+shangpinshopsall.get(s).getsLoveNum();
                         }
                         }
                        %>
                       <%}else{
                       TotalLove=0;
                       }%>
                        <span style="font-size:19px;color:#f0c03e;"><%=TotalLove %></span><br>
                        <span style="font-size:16px;color:#8f8f8f;">宜粉心動</span>
                       </div>
                     </div>
                    </div>
                 <!-- 感興趣 -->
                    <div class="col-xs-2 col-sm-2" style="padding:0;margin-top: 15px;">
                     <div class="col-xs-6 col-sm-6" style="padding:0;">
                      <div style="float:right;">
                        <img src="images/shopin_see.png" style="width:45px;">
                      </div>
                     </div>
                     <div class="col-xs-6 col-sm-6" style="padding:0;">
                       <div style="float:left;text-align:center;margin-left: 10px;"> 
                        <span style="font-size:19px;color:#f0c03e;"><%=total[0] %></span><br>
                        <span style="font-size:16px;color:#8f8f8f;">宜粉興趣</span>
                       </div>
                     </div>
                    </div>
                 <!-- 查看人 -->
                    <div class="col-xs-8 col-sm-8" style="padding:0;">
                      <div class="shopin_fand">
	                      <ul style="margin:0;">
	                        <li class="shopin_fanli"><img src="images/shopin_4.png" class="shopin_fanimg"></li>
	                        <li class="shopin_fanli"><img src="images/shopin_5.png" class="shopin_fanimg"></li>
	                        <li class="shopin_fanli"><img src="images/shopin_6.png" class="shopin_fanimg"></li>
	                        <!-- 省略號 -->
	                        <li class="shopin_fanli1">
	                         <a href="#">
	                          <img src="images/shopin_apostrophe.png" class="shop_fanap">
	                         </a>
	                        </li>
	                      </ul>
                      </div>
                    </div>
                 </div>
               </div>
               <div class="shop_menu" style="padding:0;margin-top:20px;">
                   <ul id="mysTab" class="nav nav-tabs shopin_na" style="margin:0;width:100%;">
				   <li class="active"><a href="#gallery" class="shopin_na_a" data-toggle="tab">商品圖片</a></li>
				   <li class=""><a href="#spec" class="shopin_na_a" data-toggle="tab">商品說明</a></li>
				   <li class=""><a href="#commend" class="shopin_na_a" data-toggle="tab">用戶評價</a></li>
				   <li class=""><a href="#notes" class="shopin_na_a" data-toggle="tab">宜買筆記</a></li>
				   <li class=""><a href="#pliveshot" class="shopin_na_a" data-toggle="tab">晒圖區</a></li>
				  </ul>
				  <div id="mysTabContent" class="tab-content containter_s" style="border:1px solid #ccc;">
				  
				    <!-- 商品圖片 -->
				    <div class="tab-pane fade in active" id="gallery" style="">
				      <div class="col-xs-12 col-sm-12" style="padding:0;border: 1px solid #ccc;background-color:#fff;">
				        <div style="width:100%;height:auto;margin-top: 5px;">
		                 <div id="con1_1">              
		                   <div class="product_list shopin_gallery" style="margin: 0;">
		                     <img src="http://wap.macaoeasybuy.com/<%=goodsdetails.getPic() %>" style="width:100%;">
		                   </div>
		                   <div class="product_list shopin_gallery">
		                     <img src="http://wap.macaoeasybuy.com/<%=goodsdetails.getPic2() %>" style="width:100%;">
		                   </div>
		                   <div class="product_list shopin_gallery">
		                   <%if(goodsdetails.getPic3()==null||goodsdetails.getPic3().length()<49){ %>
		                   <%}else{ %>
		                   <img src="http://wap.macaoeasybuy.com/<%=goodsdetails.getPic3() %>" style="width:100%;">
		                   <%} %>
		                   </div>
		                 </div>
		                </div>
				      </div>
				    </div>
				    
				    <!-- 商品說明 -->
				    <div class="tab-pane fade" id="spec" style="">
				    </div>
				    <!-- 用戶評價 -->
				    <div class="tab-pane fade" id="commend" style="">
				    </div>
				    <!-- 宜買筆記 -->
				    <div class="tab-pane fade" id="notes" style="">
				    </div>
				    <!-- 晒圖區 -->
				    <div class="tab-pane fade" id="pliveshot" style="">
				    </div>
				  </div>
               </div>
<!--大家都在看 -->
			     <div class="col-xs-12 col-sm-12 skb_eversee" style="background-color:#ff0a4f;">
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
						   <img src="images/shopin_heart.png" style="width:25px;">
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
				            <button class="skb_innbtn">
							  <img src="images/kep.png">
							</button>
							  <div class="content_car" style="margin-top:-30px;">
							    <div class="row" style="margin: 0;padding: 0 0 10px 15px;">
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
													<em><img src="images/skbpr1.png" style="width:68px;height:68px;margin-right: 5px;"><i></i></em>
													<em><img src="images/skbpr1.png" style="width:68px;height:68px;margin-right: 5px;"><i></i></em>
													<em><img src="images/skbpr1.png" style="width:68px;height:68px;"><i></i></em>
													<em><img src="images/skbpr1.png" style="width:68px;height:68px;margin-right: 5px;"><i></i></em>
													<em><img src="images/skbpr1.png" style="width:68px;height:68px;margin-right: 5px;"><i></i></em>
													<em><img src="images/skbpr1.png" style="width:68px;height:68px;"><i></i></em>
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
								  	  	<div class="col-xs-12 col-sm-12" style="padding:0;text-align:left;">
								  	  		<div class="col-xs-2 col-sm-2" style="padding:0;">
								  	  			<div style="margin-top: 10px;font-size: 16px;color:#cacaca;"><span>規格：</span></div>
								  	  		</div>
								  	  	    <div class="col-xs-10 col-sm-10" style="padding:0;">
									  	  	  <div class="yListr">
												<ul>
												   <li>
													<button>35碼</button>
													<button>36碼</button>
													<button>37碼</button>
													<button>38碼</button>
													<button>39碼</button>
													<button class="yListr_butdis" disabled="disabled">40碼</button>
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
								  	  	<img src="images/shop-prati1.png" style="width:100%;height:230px;">
								  	  </div>
								  	</div>
								  </div>	
							  </div>			   
							<script type="text/javascript">
								$(function (){
									$(".skb_innbtn").bind("click", function (){
										var flag = $(".content_car").is(":hidden");
										if(flag){
											$(".content_car").show();
										}else{
											$(".content_car").hide();
										}
									});		
								});
							</script>		   
				        </td></tr>
					  </table>
					</div>
					<%} %>
			     </div>
            </div>
            <div class="tab-pane fade" id="diary" style="">
            </div>
            <div class="tab-pane fade" id="blueprint" style="">
            </div>
            <div class="tab-pane fade" id="join" style="">
            </div>
            <div class="tab-pane fade" id="add" style="">
            </div>
          </div>
      </div>
      
<!--頁腳  -->
	<div id="footer" style="clear:both;text-align:center;padding-top: 30px;">
	  <div style="padding:0;text-align:center;color:#ff0a4f;width:100%;">~沒有更多內容了~</div>
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
      <!-- 登陸后顯示店主頭像
      <div class="user_head"><img src="images/gmp3.jpg" class="user_headimg"></div>
      <span style="display:block;">我的空間</span>
      -->
    </a></li>
    <li class="top_fix_li"><a href="cart.jsp" style="color:black;">
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
