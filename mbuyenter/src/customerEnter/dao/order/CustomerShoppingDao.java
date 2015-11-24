package customerEnter.dao.order;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import customerEnter.bean.order.Order;
import customerEnter.bean.shangpin.ShangPin;
import customerEnter.bean.shopping.Shopping;
import customerEnter.bean.shopping.ShoppingCart;
import customerEnter.bean.store.Shop;
import customerEnter.dao.JDBCconndao.macaoBuyDB;

/***
 * 說明：跟商家管理平台中package macaoeasybuy.dao.order;包相同
 * 
 * 
 * */

public class CustomerShoppingDao {

	
	/**
	 * 功能：查詢購物表中所有的信息
	 * 時間：2015/11/4
	 * 編者：徐新院
	 * */
	
	public  static  ShangPin CustomerShangpin(int Id,int shopid) {
		String sql="use test_mbuydate select id,Title,Number,CostPrice,Price,Pic,shopid,AreaClassID,jiang,tuan,guige,jiage,kucun,tupian,chengben,addtime,uptime,sLoveNum,sBuyNum,sSeeNum,mop,State,intro,expertlable,MaoA,MaoB,iWarningCount,shangpinlabel from ShangPin where id='"+Id+"' and shopid='"+shopid+"'";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ShangPin goods=new ShangPin();
		try {
			conn = macaoBuyDB.getConnection();
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				goods.setId(rs.getInt("id"));
				goods.setTitle(rs.getString("Title"));
				goods.setNumber(rs.getString("Number"));
				goods.setCostPrice(rs.getInt("CostPrice"));
				goods.setPrice(rs.getInt("Price"));
				goods.setPic(rs.getString("Pic"));
				goods.setShopid(rs.getInt("shopid"));
				goods.setAreaClassID(rs.getString("AreaClassID"));
				goods.setJiang(rs.getInt("jiang"));//降價商品
				goods.setTuan(rs.getInt("tuan"));//降價商品
				goods.setGuige(rs.getString("guige"));
				goods.setJiage(rs.getString("jiage"));
				goods.setKucun(rs.getString("kucun"));
				goods.setTupian(rs.getString("tupian"));
				goods.setChengben(rs.getString("chengben"));
				goods.setAddtime(rs.getString("addtime"));
				goods.setUptime(rs.getString("uptime"));
				goods.setsLoveNum(rs.getInt("sLoveNum"));
				goods.setsBuyNum(rs.getInt("sBuyNum"));
				goods.setsSeeNum(rs.getInt("sSeeNum"));
				goods.setMop(rs.getInt("mop"));
				goods.setState(rs.getInt("State"));//狀態
				goods.setIntro(rs.getString("intro"));
				goods.setExpertlable(rs.getInt("expertlable"));
				goods.setMaoA(rs.getString("MaoA"));
				goods.setMaoB(rs.getString("MaoB"));
				goods.setiWarningCount(rs.getInt("iWarningCount"));//報警數量
				goods.setShangpinLable(rs.getString("shangpinlabel"));
			}
			
		} catch (SQLException ex) {
			Logger.getLogger(CustomerShoppingDao.class.getName()).log(Level.SEVERE, null, ex);
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
				Logger.getLogger(CustomerShoppingDao.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return goods;
		
	}
	
	/**
	 * 功能：根據會員的id來獲取訂單的信息
	 * 時間：2015/11/12
	 * 編者：徐新院
	 * **/
	public  static  ArrayList<Shopping> CustomerShopping(int id) {
		   Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        String sql = "use test_mbuydate select * from shopping where id='"+id+"'";
	        Shopping shopping;
	  ArrayList<Shopping> list=new ArrayList<Shopping>();
	        try {
	            conn = macaoBuyDB.getConnection();
	            stmt =conn.createStatement();
	            rs = stmt.executeQuery(sql);
	            while (rs.next()){
	            	shopping=new Shopping();
	            	shopping.setId(rs.getInt("id"));
	            	shopping.setiOrderId(rs.getInt("iOrderId"));
	            	shopping.setiGoodsId(rs.getInt("iGoodsId"));
	            	shopping.setiCount(rs.getInt("iCount"));
	            	shopping.setsStandard(rs.getString("sStandard"));
	            	shopping.setfPrice(rs.getFloat("fPrice"));
	            	shopping.setiMop(rs.getInt("iMop"));
	            	shopping.setiDepreciate(rs.getInt("iDepreciate"));
	            	shopping.setiState(rs.getInt("iState"));
	            	shopping.setfRealyPrice(rs.getFloat("fRealyPrice"));
                 list.add(shopping);
	            }
	        } catch (SQLException ex) {
	            Logger.getLogger(CustomerShoppingDao.class.getName()).log(Level.SEVERE, null, ex);
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
	                Logger.getLogger(CustomerShoppingDao.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
			return list;
	    }
	
	
	/**
	 * 根據店鋪的id來獲取店鋪的Logo和店鋪的名稱
	 * 時間：2015/11/12
	 * 編者：徐新院
	 * **/
	public  static  Shop CustomerShop(int id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "use test_mbuydate select id,shopname,Logo from shop where id='"+id+"'";
		Shop shop=new Shop();
		try {
			conn = macaoBuyDB.getConnection();
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				shop.setId(rs.getInt("id"));
				shop.setShopname(rs.getString("shopname"));
				shop.setLogo(rs.getString("Logo"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerShoppingDao.class.getName()).log(Level.SEVERE, null, ex);
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
				Logger.getLogger(CustomerShoppingDao.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return shop;
	}
	
	
	
	/** cart.jsp頁面
	 * 根據會員登錄的賬號獲取對應的購物車之後根據此會員的購物車商品的店鋪標號來獲取對應的店鋪信息
	 * 時間：2015/11/18
	 * 編者：徐新院
	 * **/
	public  static  Shop CustomerUserShop(ArrayList<Shop>shopssion,int id) {
		Shop shop=null;
		if(shopssion!=null&&shopssion.size()>0){
			for(int i=0;i<shopssion.size();i++){
				if(shopssion.get(i).getId()==id){
					shop=new Shop();
					shop.setId(shopssion.get(i).getId());
					shop.setShopname(shopssion.get(i).getShopname());
					shop.setLogo(shopssion.get(i).getLogo());
				}
			}
		}
		return shop;
	}
	
	/**
	 * 功能：根據會員的IUserId來獲取購物車表中此會員的其他信息
	 * 時間：2015/11/12
	 * 編者：徐新院
	 * */
	public  static  ArrayList<ShoppingCart> CustomerShoppingCart(int id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "use test_mbuydate select * from shoppingcart where iUserId='"+id+"'";
		ShoppingCart shoppingcart;
		ArrayList<ShoppingCart> list=new ArrayList<ShoppingCart>();
		try {
			conn = macaoBuyDB.getConnection();
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				shoppingcart=new ShoppingCart();
				shoppingcart.setId(rs.getInt("id"));
				shoppingcart.setiUserId(rs.getInt("iUserId"));
				shoppingcart.setiShopId(rs.getInt("iShopId"));
				shoppingcart.setiGoodsId(rs.getInt("iGoodsId"));
				shoppingcart.setiCount(rs.getInt("iCount"));
				shoppingcart.setsStandard(rs.getString("sStandard"));
				list.add(shoppingcart);
			}
		} catch (SQLException ex) {
			Logger.getLogger(CustomerShoppingDao.class.getName()).log(Level.SEVERE, null, ex);
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
				Logger.getLogger(CustomerShoppingDao.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}
	
	
	public static void main(String[] args) {
		
	}
	
	
}
