package customerEnter.dao.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import customerEnter.dao.JDBCconndao.macaoBuyDB;

public class CustomerShoppingCartDao {
	private static PreparedStatement ps = null;
	
	public static void insertShoppingCart(int iUserId,int iShopId,int iGoodsId,int iCount,String sStandara){
			 Connection conn = null;
			 
		    String sql = "use test_mbuydate insert into ShoppingCart(iUserId,iShopId,iGoodsId,iCount,sStandard) " +
		    		"values('"+iUserId+"','"+iShopId+"','"+iGoodsId+"','"+iCount+"','"+sStandara+"') " ;
		    try {
		    	 conn = macaoBuyDB.getConnection();
		          ps = conn.prepareStatement(sql);
		          int rows = ps.executeUpdate();
		       
		    } catch (SQLException ex){
		        Logger.getLogger(CustomerShoppingCartDao.class.getName()).log(Level.SEVERE, null, ex);
		    }finally{
		        try {
		            if(ps!=null)ps.close();
		            if(conn!=null)conn.close();
		        } catch (SQLException ex) {
		            Logger.getLogger(CustomerShoppingCartDao.class.getName()).log(Level.SEVERE, null, ex);
		        }
		    }
		    
		}
	
	/**
	 * 
	 * */
	public static void DeleteShoppingCart(int cartid){
		Connection conn = null;
		
		String sql = "use test_mbuydate delete  ShoppingCart where id='"+cartid+"'";
				
		try {
			conn = macaoBuyDB.getConnection();
			ps = conn.prepareStatement(sql);
			int rows = ps.executeUpdate();
			
		} catch (SQLException ex){
			Logger.getLogger(CustomerShoppingCartDao.class.getName()).log(Level.SEVERE, null, ex);
		}finally{
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (SQLException ex) {
				Logger.getLogger(CustomerShoppingCartDao.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		
	}
	
	public static void main(String[] args) {
		CustomerShoppingCartDao.DeleteShoppingCart(22);
	}
}
