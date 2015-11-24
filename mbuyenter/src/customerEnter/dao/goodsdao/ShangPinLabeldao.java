package customerEnter.dao.goodsdao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import customerEnter.bean.shangpin.ShangPinLabel;
import customerEnter.dao.JDBCconndao.macaoBuyDB;

public class ShangPinLabeldao {

	
	/**
	 * 功能：查詢所有商品有關的活動標籤
	 * 時間：2015/11/19
	 * 編者：徐新院
	 * */
	public  static  ArrayList<ShangPinLabel> CustomerShangPinLabel() {
		   Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        String sql = "use test_mbuydate select id,LabelName,picture,price,HBgiving,JFgiving,theorder from shangpinlabel";
	        ShangPinLabel goodslabel;
	  ArrayList<ShangPinLabel> list=new ArrayList<ShangPinLabel>();
	        try {
	            conn = macaoBuyDB.getConnection();
	            stmt =conn.createStatement();
	            rs = stmt.executeQuery(sql);
	            while (rs.next()){
	            	goodslabel=new ShangPinLabel();
	            	goodslabel.setId(rs.getInt("id"));
	            	goodslabel.setLabelName(rs.getString("LabelName"));
	            	goodslabel.setPicture(rs.getString("picture"));
	            	goodslabel.setPrice(rs.getInt("price"));
	            	goodslabel.setHBgiving(rs.getInt("HBgiving"));
	            	goodslabel.setJFgiving(rs.getInt("JFgiving"));
	            	goodslabel.setTheorder(rs.getInt("theorder"));
	                list.add(goodslabel);
	            }
	            
	        } catch (SQLException ex) {
	            Logger.getLogger(ShangPinLabeldao.class.getName()).log(Level.SEVERE, null, ex);
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
	                Logger.getLogger(ShangPinLabeldao.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
			return list;

	    }

	public static void main(String[] args) {
		ShangPinLabeldao.CustomerShangPinLabel();
	}
}
