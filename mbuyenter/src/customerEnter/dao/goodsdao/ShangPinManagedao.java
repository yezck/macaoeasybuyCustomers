package customerEnter.dao.goodsdao;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import customerEnter.bean.shangpin.ShangPin;
import customerEnter.dao.JDBCconndao.macaoBuyDB;

public class ShangPinManagedao {

	
	
	/**
	 * 功能：在購物車頁面中顯示所有商品真是被查看的數目對多的商品(按照真是查看數的降序排列)
	 * 時間：2015/11/13
	 * 編者：徐新院
	 * **/
	public  static  ArrayList<ShangPin> CustomerCartSeeShangpin() {
		   Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        String sql = "use test_mbuydate select id,Title,Number,CostPrice,Price,Pic,shopid,sSeeNum from ShangPin  order by sSeeNum desc";
	        ShangPin goods;
	  ArrayList<ShangPin> list=new ArrayList();
	        try {
	            conn = macaoBuyDB.getConnection();
	            stmt =conn.createStatement();
	            rs = stmt.executeQuery(sql);
	            while (rs.next()){
	            	  goods=new ShangPin();
	            	  goods.setId(rs.getInt("id"));
	            	  goods.setTitle(rs.getString("Title"));
	            	  goods.setNumber(rs.getString("Number"));
	            	  goods.setCostPrice(rs.getInt("CostPrice"));
	            	  goods.setPrice(rs.getInt("Price"));
	            	  goods.setPic(rs.getString("Pic"));
	            	  goods.setShopid(rs.getInt("shopid"));
	            	  goods.setsSeeNum(rs.getInt("sSeeNum"));
	                list.add(goods);
	            }
	            
	        } catch (SQLException ex) {
	            Logger.getLogger(ShangPinManagedao.class.getName()).log(Level.SEVERE, null, ex);
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
	                Logger.getLogger(ShangPinManagedao.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
			return list;

	    }
	 
	
	
	public static void main(String[] args) {
		ArrayList<ShangPin> list=ShangPinManagedao.CustomerCartSeeShangpin();
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getsSeeNum());
		}
	}
}
