package customerEnter.dao.shop;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import customerEnter.bean.shangpin.Area;
import customerEnter.bean.store.Shop;
import customerEnter.dao.JDBCconndao.macaoBuyDB;

public class CustomerShopDao {

	
	
	
	
	public  static  Shop CustomerShop(int id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "use test_mbuydate select id,shopname,shopMan,Tel,Logo,storeadvertising,goodstype,addtime,ShopPic,ShopInfor  from shop where id='"+id+"'";
		Shop shop=new Shop();
		try {
			conn = macaoBuyDB.getConnection();
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				shop.setId(rs.getInt("id"));
            	shop.setShopname(rs.getString("shopname"));
            	shop.setShopMan(rs.getString("shopMan"));
            	shop.setTel(rs.getString("Tel"));
            	shop.setLogo(rs.getString("Logo"));
            	shop.setStoreadvertising(rs.getString("storeadvertising"));
            	shop.setGoodstype(rs.getString("goodstype"));
            	shop.setAddtime(rs.getString("addtime"));
            	shop.setShopPic(rs.getString("ShopPic"));
            	shop.setShopInfor(rs.getString("ShopInfor"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerShopDao.class.getName()).log(Level.SEVERE, null, ex);
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
				Logger.getLogger(CustomerShopDao.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return shop;
	}
	public  static  ArrayList<Shop> CustomerAllShop() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "use test_mbuydate select id,shopname,Logo,storeadvertising,goodstype  from shop";
		Shop shop=null;
		ArrayList<Shop>list=new ArrayList<Shop>();
		try {
			conn = macaoBuyDB.getConnection();
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				shop=new Shop();
				shop.setId(rs.getInt("id"));
				shop.setShopname(rs.getString("shopname"));
				shop.setLogo(rs.getString("Logo"));
				shop.setStoreadvertising(rs.getString("storeadvertising"));
				shop.setGoodstype(rs.getString("goodstype"));
				list.add(shop);
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerShopDao.class.getName()).log(Level.SEVERE, null, ex);
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
				Logger.getLogger(CustomerShopDao.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}
	
	
	
	/**
	 * 功能：查询Area表中所有商品的大分类
	 * 编者：徐新院
	 * 时间：2015/11/13
	 * */
	public  static  Area querySPArea(int id) {
		String sql="use test_mbuydate select Name from Area where id='"+id+"'";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Area area=null;
		try {
			conn = macaoBuyDB.getConnection();
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				area=new Area();
				area.setName(rs.getString("Name"));
			}
			
		} catch (SQLException ex) {
			Logger.getLogger(CustomerShopDao.class.getName()).log(Level.SEVERE, null, ex);
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
				Logger.getLogger(CustomerShopDao.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return area;
		
	}
	
	public static void main(String[] args) {
		
		ArrayList<Shop> rea=CustomerShopDao.CustomerAllShop();
		for(int i=0;i<rea.size();i++){
			if(rea.get(i).getGoodstype()!=null){
			if(rea.get(i).getGoodstype().equals("6")){
			 	System.out.println(rea.get(i).getGoodstype());
			 	}
			}
		}
		
	}
}
