package customerEnter.dao.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


import customerEnter.bean.order.Order;
import customerEnter.bean.shangpin.ShangPin;
import customerEnter.dao.JDBCconndao.macaoBuyDB;
import customerEnter.tool.DataTimeNumber;



public class CustomerOrdersDao {
	private static PreparedStatement ps = null;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////一下是消費者平台所用到的方法體//////////////////////////////////////////////////////////////
	/**
	 * 功能：根據會員的編號來獲取訂單表中此會員對應的訂單信息
	 * 時間：2015/11/12
	 * 編者：徐新院
	 * */
	public  static  ArrayList<Order> UseridOrders(int id) {
		   Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        String sql = "use test_mbuydate select * from orders where iUserId='"+id+"'";
	        Order order;
	  ArrayList<Order> list=new ArrayList<Order>();
	        try {
	            conn = macaoBuyDB.getConnection();
	            stmt =conn.createStatement();
	            rs = stmt.executeQuery(sql);
	            while (rs.next()){
	            	  order=new Order();
	            	  order.setId(rs.getInt("id"));
	            	  order.setsNumber(rs.getString("sNumber"));
	            	  order.setiShopId(rs.getInt("iShopId"));
	            	  order.setiUserId(rs.getInt("iUserId"));
	            	  order.setfSumMoney(rs.getFloat("fSumMoney"));
	            	  order.setfRealyPay(rs.getFloat("fRealyPay"));
	            	  order.setfTempMoney(rs.getFloat("fTempMoney"));
	            	  order.setsPlaceOrderTime(rs.getString("sPlaceOrderTime"));
	            	  order.setsDeliveryTime(rs.getString("sDeliveryTime"));
	            	  order.setsReceiveDay(rs.getString("sReceiveDay"));
	            	  order.setsReceiveTime(rs.getString("sReceiveTime"));
	            	  order.setsAddressArea(rs.getString("sAddressArea"));
	            	  order.setsAddress(rs.getString("sAddress"));
	            	  order.setsProple(rs.getString("sProple"));
	            	  order.setsPhone(rs.getString("sPhone"));
	            	  order.setiState(rs.getInt("iState"));
	            	  order.setsMassage(rs.getString("sMassage"));
	            	  order.setsRemark(rs.getString("sRemark"));
	            	  order.setsTakeTime(rs.getString("sTakeTime"));
                       list.add(order);
	            }
	        } catch (SQLException ex) {
	            Logger.getLogger(CustomerOrdersDao.class.getName()).log(Level.SEVERE, null, ex);
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
	                Logger.getLogger(CustomerOrdersDao.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
			return list;
	    }
	
	
	
	public static void main(String[] args) {
		
	}



	
}
