<%@page import="customerEnter.bean.customerUser.Customers"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陸</title>
    
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
    </script>
    <style>
      #footer{
      width: 100%;
      clear: both;
      text-align: center;
      min-width:1100px;
      
    }
    .nav-tabs>li{
       border:2px solid #ff5b77;
       border-left:none;
       border-bottom:none;
       margin-bottom: 0;
    }
    .nav-tabs>li>a{
        border:none;
    }
    .nav-tabs>li>a:hover {
		color: #fff !important;
		background-color: #ff5b77 !important;
	}
	
	.nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover
		{
		color: #fff !important;
		cursor: default !important;
		background-color: #ff5b77 !important;
		border:none;
	}
    </style>
  </head>
  
  <body style="background:url(images/index_back.png);">
   <header class="hea" style=""></header>
   <div class="login_in">
	   <ul id="myTab" class="nav nav-tabs login_li">
		<li class="active" style="border:2px solid #ff5b77;border-bottom:none;"><a href="#fanin" class="login_li_a" data-toggle="tab">宜粉登入</a></li>
		<li class=""><a href="#fanbecom" class="login_li_a" data-toggle="tab">成為宜粉</a></li>
		<li class=""><a href="http://192.168.1.9:8080/sdsss/Login.jsp" class="login_li_a">店主登入</a></li>
	   </ul>
	   <div id="myTabContent" class="tab-content login_s" >
	   
	   
	   
	   
	   <!--宜粉登入  -->
	   <%
	   Customers CustomerValue=(Customers)session.getAttribute("CustomerValue");
	   %>
		 <div class="tab-pane fade in active" id="fanin" style="">
		 <form action="CustomerLoginServlet" name="MacaoCustomerLogin" method="post" onsubmit=" return ValidateAccountLength();">
		   <div class="row" style="margin:0;">
		     <div class="col-sm-12" style="margin-top:50px;">
		       <div class="col-sm-12" style="padding: 10px 50px;">
		         <input type="text" class="login_txt" id="AccountNo" name="AccountNo" value="" placeholder="請輸入宜買帳號(3-9位)" >
		       </div>
		       <div class="col-sm-12" style="padding: 10px 50px;">
		         <input type="password" class="login_txt" id="AccountPsw" name="AccountPsw"  value="" placeholder="請輸入宜買密碼(6-20位)" onchange="">
		       </div>
		       <div class="col-sm-12" style="padding: 5px 10px 10px 50px;">
		         <div class="col-sm-2" style="padding:0;">
		          <button class="login_btn" type="submit">登入</button>
		         </div>
		         <div class="col-sm-10" style="padding: 12px 0;">
                <%if(CustomerValue==null){%>
		           <span style="color:#ff5b77;font-size:1.8rem;">×&nbsp;&nbsp;帳號或密碼錯誤哦，請重新檢查</span>
               <%}else{}%>
		         </div>
		       </div>
		       <div class="col-sm-12" style="padding: 10px 0 10px 65px;">
		         <span class="login_txt1">快速登入：</span>
		         <span><a href="#"><img src="images/weixin.png" class="login_ic"></a></span>
		         <span><a href="#"><img src="images/weibo.png" class="login_ic"></a></span>
		         <span><a href="#"><img src="images/facebook.png" class="login_ic"></a></span>
		       </div>
		     </div>
		   </div> 
		   </form>
		 </div>
		 
		 
		 
		 
		 
		 
		 
	   <!-- 成為宜粉 -->
		 <div class="tab-pane fade" id="fanbecom" style="">
		    <div class="row" style="margin:0;">
		     <div class="col-sm-12" style="margin-top:20px;">
		       <div class="col-sm-12" style="padding: 5px 50px;">
		         <select class="login_txt" style="color:black;">
		           <option value="0">澳門</option>
		         </select>
		       </div>
		       <div class="col-sm-12" style="padding: 5px 50px;">
		         <input type="text" class="login_txt" value="" placeholder="請輸入手機號">&nbsp;&nbsp;<button class="login_btn1">獲取短信驗證碼</button>
		       </div>
		       <div class="col-sm-12" style="padding: 5px 50px;">
		         <input type="text" class="login_txt" value="" placeholder="請輸入短信驗證碼">
		       </div>
		       <div class="col-sm-12" style="padding: 5px 50px;">
		         <input type="text" class="login_txt" style="width:130px;float:left;" value="" placeholder="帳號(3-9位)">
		         <input type="text" class="login_txt" style="width:130px;float:left;margin-left:10px;" value="" placeholder="密碼(6-20位)">
		       </div>
		       <div class="col-sm-12" style="padding: 5px 10px 10px 50px;">
		         <div class="col-sm-2" style="padding: 4px 0;">
		          <button class="login_btn">完成註冊</button>
		         </div>
		         <div class="col-sm-10" style="padding:0;">
		         <!--  
		           <div class="login_txt3">×&nbsp;&nbsp;驗證碼錯誤哦，請重新檢查</div>
		           -->
		         <!--  
		           <div class="login_txt2">×&nbsp;&nbsp;恭喜您!您已獲贈MOP100紅包可以到「著數換領」區盡情搶購!</div>
		          -->
		         </div>
		       </div>
		     </div>
		    </div>
		 </div>
	   </div>
	   <div class="login_guide"><img src="images/guide.png"></div>
	</div>
    <!--頁腳  -->
	<div id="footer" style="">
      <div style="padding:0;width:100%;"><img src="images/logondown.png" style="width:100%;min-width:760px;"></div>
         <div class="containter_foot" style="padding:0;height:auto;">
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
	
	
	<script type="text/javascript">
	function ValidateAccountLength(){
	var AccountNo=document.getElementById("AccountNo").value;
	var AccountPws=document.getElementById("AccountPsw").value;
	if(AccountNo.length<=3||AccountNo.length>9){
	document.getElementById("AccountNo").value="";
	document.getElementById("AccountNo").focus();
	alert("請輸入合法賬號！");
	return false;
	}else if(AccountPws.length<6||AccountPws.length>20){
	document.getElementById("AccountPsw").value="";
	document.getElementById("AccountPsw").focus();
	alert("請重新輸入密碼！");
	return false;
	}else{
	return true;
	}
	}
	
	</script>
  </body>
</html>
