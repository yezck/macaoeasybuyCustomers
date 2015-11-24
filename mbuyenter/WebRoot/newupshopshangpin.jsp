<%@page import="customerEnter.tool.DataTimeNumber"%>
<%@page import="customerEnter.dao.goodsdao.ShangPinManagedao"%>
<%@page import="customerEnter.bean.shangpin.ShangPin"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 
此頁面時商店頁面中的上新（最近三個月中的商品）
 -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


ArrayList<ShangPin> shangpins =(ArrayList<ShangPin>)session.getAttribute("shangpins");
ArrayList<ShangPin>newtime=ShangPinManagedao.getNewDateShangPin(shangpins);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>店鋪首頁—上新商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
	<link rel="stylesheet" href="css/jquery.webui-popover.min.css"> 
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/scroll.js"></script>
	<script src="js/clamp.js" type="text/javascript"></script>
    <script src="js/clamp.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.webui-popover.min.js"></script>
    <script type="text/javascript" src="js/jquery.masonry.min.js"></script>
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
  
  <body>
    
    <!-- 上新 -->
				 <div class="tab-pane fade in active" id="all" style="">
				 
				  <div style="width:100%;height:auto;margin-top: 5px;">
	                 <div id="con1_1">
                          <!-- 單件商品遍歷從此開始 -->     
                   <%if(newtime!=null){ %>
				 <%for(int i=0;i<newtime.size();i++){
				  %>      
	                   <div class="product_list shop_all_e">
		                    <div style="min-height:180px;">
		                       <img src="http://wap.macaoeasybuy.com/<%=newtime.get(i).getPic() %>" style="width:100%;">
		                    </div>
				        <table><tr>
				         <td class="shop_all_td1" style="color:#ff0a4f;">
				         <img src="images/ev4_.png" style="width:25px;">
				         <span style="vertical-align: middle;"><%=newtime.get(i).getsSeeNum() %></span>
				        </td>
				        <td class="shop_all_td1" style="color:#ccc;">
				          <span>MOP</span><span><%=newtime.get(i).getPrice() %></span>
				        </td>
				       </tr></table>
				       <table>
				        <tr><td class="shop_all_td2" style="">
				          <h4><%=newtime.get(i).getTitle() %></h4>
				          <script>
						        var header = document.getElementsByTagName('body')[0].getElementsByTagName('h4')[0];   
						        $clamp(header, {clamp: 1, useNativeClamp: false});
					    </script>
				        </td></tr>
				        <tr><td style="text-align:center;">
						   <button class="skb_innbtn" >
							 <a href="#" class="show-pop-large<%=i %>" data-placement="auto">
							    <img src="images/kep.png">
							 </a>
							</button>	   
							<!-- 彈出框內容 -->
							<div id="largeContent<%=i %>" style="display:none;">
							  <div class="row" style="margin: 0;padding: 0 0 0 15px;">
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
									    String tupianString;
									    if(newtime.get(i).getTupian()==null||newtime.get(i).getTupian().trim().length()<=0){
									    tupianString="";
									    }else{
									    tupianString=newtime.get(i).getTupian();
						              String[] tupian=DataTimeNumber.StringInventory(tupianString);
						              if(tupian.length==0){%>
						              <img src="images/footprint.png" id="tupian"  border="2" style="width:68px;height:68px;margin-right: 5px;"><i></i>
						              <%} %>
						              <%
									    for(int ii=0;ii<tupian.length;ii++){
			                                if(tupian.length==1&&tupian[0].trim().length()==0){
				                                         System.out.println("沒有");
			                                }else if(tupian.length==0){
				                                          System.out.println("頁沒有");
			                                }else{
			                            %>
			                             <img src="http://wap.macaoeasybuy.com/<%=tupian[ii] %>" id="tupian"  border="2" style="width:68px;height:68px;margin-right: 5px;"><i></i>
			                            <%
			                                }
		                                    }
		                                    }
									    %>
												<em><img src="images/skbpr1.png" style="width:68px;height:68px;margin-right: 5px;"><i></i></em>
												
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
							  	  	<img src="http://wap.macaoeasybuy.com/<%=newtime.get(i).getPic() %>" style="width:100%;height:230px;">
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
									function initPopover<%=i %>(){					
										var largeContent = $('#largeContent<%=i%>').html(),
											largeSettings = {content:largeContent,
																width:500,
																height:340,
																closeable:false
															};
										$('a.show-pop-large<%=i %>').webuiPopover('destroy').webuiPopover($.extend({},settings,largeSettings));
									}
									initPopover<%=i %>();				
								})();			
							</script>>
				        </td></tr>
				       </table>
	                    </div>
	                    <script>
						  $(document).ready(function(){
					        var $container = $('#con1_1');	
								$container.imagesLoaded(function(){
									$container.masonry({
										itemSelector: '.product_list',
										columnWidth: 5 //每两列之间的间隙为5像素
									});
								});
						   
							});
						  </script>
                    <%} %>
				   <%} %>
	                 </div>
	              </div>
				   </div>
    
    
    
  </body>
</html>
