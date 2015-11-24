<%@page import="customerEnter.tool.Add_subtractClassJSP"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 

<title>利用javascript自定义radio及checkbox样式</title> 
<style type="">
.checkbox{
width: 26px;
height: 30px;
padding: 0 10px 0 0;
background-color:#dc143c;
display: display;
clear: left;
float: left;
}
</style>
</head> 
<body> 
 <script type="text/javascript">
 function selectAllOrDisSelectAll(first,second){
var nowStatus = document.getElementById("allnameId"); //全選
 var techIds1 = document.getElementsByName("firstname"); 
 var techIds2 = document.getElementsByName("secondname"); 
 for(var i=0;i<techIds1.length;i++){
        techIds1[i].checked = nowStatus.checked;
        if(techIds1[i].checked==true){
        selectFirstOrDisSelectAll(2);
        }
    }
    
}
 function selectFirstOrDisSelectAll(num){
 for(i=0;i<num;i++){
 var nowStatus = document.getElementById("firstnameId"+i); //一級複選框
 var techIds2 = document.getElementsByName("secondname"); //一級複選框
  for(var i=0;i<techIds2.length;i++){
        techIds2[i].checked = nowStatus.checked;
    }
 }
}

 </script>


<table>
<tr><th><input type='checkbox' name='allname' id='allnameId' onclick='selectAllOrDisSelectAll(<%=2 %>,<%=2 %>);' class='checkbox'/>全選</th></tr>
<%for(int i=0;i<2;i++){ %>
<tr><th></th><th><input type='checkbox' name='firstname' id='firstnameId<%=i %>' onclick='selectFirstOrDisSelectAll(<%=2 %>);' class='checkbox'/>一級<%=i %></th></tr>
<%for(int j=0;j<2;j++){ %>
<tr> <th></th><th></th><th><input type='checkbox' name='secondname' id='secondnameId<%=i %>'  class='checkbox'/>二級<%=i %></th></tr>
<%} %>
<%} %>
</table>
</body> 
</html> 
