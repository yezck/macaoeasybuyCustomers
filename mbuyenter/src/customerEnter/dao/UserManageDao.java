package customerEnter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


import customerEnter.bean.Customers;
import customerEnter.dao.conndao.macaoBuyDB;


public class UserManageDao {

	
	
	
	/*
	 * 功能：查询所有的用户信息
	 * 编者：徐新院
	 * 时间：2015/7/29
	 * */
	 public static  Customers queryEveryUser(String account) {
	        
		    Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        String sql = "use test_mbuydate select * from User where account='"+account+"'";
	        Customers user=new Customers();
	        try {
	            conn = macaoBuyDB.getConnection();
	            stmt =conn.createStatement();
	            rs = stmt.executeQuery(sql);
	            while (rs.next()) {
	               user.setId(rs.getInt("id"));
	               user.setName(rs.getString("Name"));
	               user.setBirthday(rs.getString("Birthday"));
	               user.setSex(rs.getString("sex"));
	               user.setAccount(rs.getString("account"));
	               user.setPsw(rs.getString("psw"));
	               user.setPic(rs.getString("Pic"));
	               user.setBackpic(rs.getString("backpic"));
	               user.setBadge(rs.getString("badge"));
	               user.setDeclaration(rs.getString("declaration"));
	               user.setPhone(rs.getString("Phone"));
	               user.setAddressArea(rs.getString("AddressArea"));
	               user.setAddress(rs.getString("Address"));
	               user.setReceiveDay(rs.getString("ReceiveDay"));
	               user.setReceiveTime(rs.getString("ReceiveTime"));
	               user.setLoginTime(rs.getInt("LoginTime"));
	               user.setLastLogin(rs.getString("LastLogin"));
	               user.setExpertlable(rs.getString("expertlable"));
	               user.setAddtime(rs.getString("addtime"));
	               user.setUptime(rs.getString("uptime"));
	               user.setRealName(rs.getString("RealName"));
	               user.setState(rs.getInt("State"));
	               user.setBaseMop(rs.getInt("BaseMop"));
	               user.setBaseIntegral(rs.getInt("BaseIntegral"));
	               user.setWeChat(rs.getString("WeChat"));
	               user.setMop(rs.getInt("Mop"));
	               user.setIntegral(rs.getInt("Integral"));
	               user.setDynclicktime(rs.getString("dynclicktime"));
	               user.setLogclicktime(rs.getString("logclicktime"));
	               user.setAlbumclicktime(rs.getString("albumclicktime"));
	               user.setSuitableLifeclicktime(rs.getString("SuitableLifeclicktime"));
	               user.setShangpinclicktime(rs.getString("shangpinclicktime"));
	               user.setFansclicktime(rs.getString("fansclicktime"));
	               user.setShopclicktime(rs.getString("shopclicktime"));
	               user.setTopicclicktime(rs.getString("topicclicktime"));
	               user.setIsrecommend(rs.getInt("isrecommend"));
	               user.setPullTheBlack(rs.getInt("PullTheBlack"));
	               user.setWxLogin(rs.getString("wxLogin"));
	            }

	        } catch (SQLException ex) {
	            Logger.getLogger(UserManageDao.class.getName()).log(Level.SEVERE, null, ex);
	        } finally {
	            try {
	                if (rs != null) {
	                    rs.close();
	                }
	                if (stmt != null) {
	                	stmt.close();
	                }
	                if (conn != null) {
	                    conn.close();
	                }
	            } catch (SQLException ex) {
	                Logger.getLogger(UserManageDao.class.getName()).log(Level.SEVERE, null, ex);
	            }

	        }
			return user;
	    }
	 
	 /**
	  * 功能：根據登錄用戶輸入的賬號和密碼來判斷是否有此用戶，有的話顯示出來
	  * 時間：2015/11/7
	  * 編者：徐新院
	  * */
	
	 public  static  Customers ValidateLogin(String account){
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			 Customers user=new Customers();
			String sql="use test_mbuydate select * from [User] where account='"+account+"'";
			 try{			 
				 conn = macaoBuyDB.getConnection();
		            stmt =conn.createStatement();
		            rs = stmt.executeQuery(sql);
		            while (rs.next()) {
		            	 user.setId(rs.getInt("id"));
			               user.setName(rs.getString("Name"));
			               user.setBirthday(rs.getString("Birthday"));
			               user.setSex(rs.getString("sex"));
			               user.setAccount(rs.getString("account"));
			               user.setPsw(rs.getString("psw"));
			               user.setPic(rs.getString("Pic"));
			               user.setBackpic(rs.getString("backpic"));
			               user.setBadge(rs.getString("badge"));
			               user.setDeclaration(rs.getString("declaration"));
			               user.setPhone(rs.getString("Phone"));
			               user.setAddressArea(rs.getString("AddressArea"));
			               user.setAddress(rs.getString("Address"));
			               user.setReceiveDay(rs.getString("ReceiveDay"));
			               user.setReceiveTime(rs.getString("ReceiveTime"));
			               user.setLoginTime(rs.getInt("LoginTime"));
			               user.setLastLogin(rs.getString("LastLogin"));
			               user.setExpertlable(rs.getString("expertlable"));
			               user.setAddtime(rs.getString("addtime"));
			               user.setUptime(rs.getString("uptime"));
			               user.setRealName(rs.getString("RealName"));
			               user.setState(rs.getInt("State"));
			               user.setBaseMop(rs.getInt("BaseMop"));
			               user.setBaseIntegral(rs.getInt("BaseIntegral"));
			               user.setWeChat(rs.getString("WeChat"));
			               user.setMop(rs.getInt("Mop"));
			               user.setIntegral(rs.getInt("Integral"));
			               user.setDynclicktime(rs.getString("dynclicktime"));
			               user.setLogclicktime(rs.getString("logclicktime"));
			               user.setAlbumclicktime(rs.getString("albumclicktime"));
			               user.setSuitableLifeclicktime(rs.getString("SuitableLifeclicktime"));
			               user.setShangpinclicktime(rs.getString("shangpinclicktime"));
			               user.setFansclicktime(rs.getString("fansclicktime"));
			               user.setShopclicktime(rs.getString("shopclicktime"));
			               user.setTopicclicktime(rs.getString("topicclicktime"));
			               user.setIsrecommend(rs.getInt("isrecommend"));
			               user.setPullTheBlack(rs.getInt("PullTheBlack"));
			               user.setWxLogin(rs.getString("wxLogin"));
		            }
			 } catch (SQLException ex) {
		            Logger.getLogger(UserManageDao.class.getName()).log(Level.SEVERE, null, ex);
		        } finally {
		            try {
		                if (rs != null) {
		                    rs.close();
		                }
		                if (stmt != null) {
		                	stmt.close();
		                }
		                if (conn != null) {
		                    conn.close();
		                }
		            } catch (SQLException ex) {
		                Logger.getLogger(UserManageDao.class.getName()).log(Level.SEVERE, null, ex);
		            }
		        }
			
			 return user;
		 }
	 /**
	  * 功能：用戶註冊信息
	  * 時間：2015/11/7
	  * 編者：徐新院
	  * */
public static int RegisterInfor(String sql){
	//String sql=" insert into  [User] values(1000,'','','','','','','','','','','','','','','',45,'','','','','',1,2,3,'',5,6,'','','','','','','','',9,8,'','','')";

	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	int num=0;
	try {
   	    conn = macaoBuyDB.getConnection();
   	    stmt = conn.prepareStatement(sql);
   	     num=stmt.executeUpdate();
   } catch (SQLException ex){
       Logger.getLogger(UserManageDao.class.getName()).log(Level.SEVERE, null, ex);
   }finally{
       try {
           if(stmt!=null)stmt.close();
           if(conn!=null)conn.close();
       } catch (SQLException ex) {
           Logger.getLogger(UserManageDao.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
	return num;
}
	 public static void main(String[] args) {
		 
		 Customers customer=UserManageDao.ValidateLogin("summer");
		 if(customer.getAccount()==null){
			 System.out.println("沒有此用戶名");
		 }else{
			 if(customer.getPsw().equals("1234567")){
				 System.out.println("登錄成功！");
			 }else{
				 System.out.println("密碼錯誤");
			 }
		 }
		 
		}
}
		 
