package customerEnter.dao.UserManageDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import customerEnter.bean.customerUser.UserMop;
import customerEnter.bean.customerUser.UserPoint;
import customerEnter.dao.JDBCconndao.macaoBuyDB;

public class CustomerUserMop_PointDao {

	
	
	/**
	 * 功能：根據某個消費者的賬號信息來獲取此消費者對應的紅包記錄
	 * 時間：2015/11/11
	 * 編者：徐新院
	 * */
	public  static  UserMop GetOnlyUserMop(int userid){
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		UserMop mop=new UserMop();
		String sql="use test_mbuydate select * from UserMop where UserId='"+userid+"'";
		 try{			 
			 conn = macaoBuyDB.getConnection();
	            stmt =conn.createStatement();
	            rs = stmt.executeQuery(sql);
	            while (rs.next()) {
	            	 mop.setId(rs.getInt("id"));
	            	 mop.setUserId(rs.getInt("UserId"));
	            	 mop.setMopId(rs.getInt("MopId"));
	            	 mop.setMop(rs.getInt("Mop"));
	            	 mop.setMopType(rs.getInt("MopType"));
	            	 mop.setState(rs.getInt("State"));
	            	 mop.setAddtime(rs.getString("addtime"));
	            	 mop.setUptime(rs.getString("uptime"));
	            	 mop.setTitle(rs.getString("title"));
	            }
		 } catch (SQLException ex) {
	            Logger.getLogger(CustomerUserMop_PointDao.class.getName()).log(Level.SEVERE, null, ex);
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
	                Logger.getLogger(CustomerUserMop_PointDao.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
		
		 return mop;
	 }
	
	/***
	 * 功能：根據消費者（會員）登錄的賬號信息；來獲取積分記錄表中對應的積分信息
	 * 時間：2015/11/11
	 * 編者：徐新院
	 * */
	public  static  UserPoint GetOnlyUserPoint(int userid){
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		UserPoint point=new UserPoint();
		String sql="use test_mbuydate select * from UserPoint where UserId='"+userid+"'";
		try{			 
			conn = macaoBuyDB.getConnection();
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				point.setId(rs.getInt("id"));
				point.setUserId(rs.getInt("UserId"));
				point.setPointId(rs.getInt("PointId"));
				point.setPoint(rs.getInt("Point"));
				point.setPointType(rs.getInt("PointType"));
				point.setState(rs.getInt("State"));
				point.setAddtime(rs.getString("addtime"));
				point.setUptime(rs.getString("uptime"));
				point.setTitle(rs.getString("title"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerUserMop_PointDao.class.getName()).log(Level.SEVERE, null, ex);
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
				Logger.getLogger(CustomerUserMop_PointDao.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		
		return point;
	}
	
	
	public static void main(String[] args) {
		UserPoint mop=CustomerUserMop_PointDao.GetOnlyUserPoint(3);
		System.out.println(mop.getId());
	}
	
	
	
}
