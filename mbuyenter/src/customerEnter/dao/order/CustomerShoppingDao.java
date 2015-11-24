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
 * �f�������̼ҹ���ƽ̨��package macaoeasybuy.dao.order;����ͬ
 * 
 * 
 * */

public class CustomerShoppingDao {

	
	/**
	 * ���ܣ���ԃُ��������е���Ϣ
	 * �r�g��2015/11/4
	 * ���ߣ�����Ժ
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
				goods.setJiang(rs.getInt("jiang"));//���r��Ʒ
				goods.setTuan(rs.getInt("tuan"));//���r��Ʒ
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
				goods.setState(rs.getInt("State"));//��B
				goods.setIntro(rs.getString("intro"));
				goods.setExpertlable(rs.getInt("expertlable"));
				goods.setMaoA(rs.getString("MaoA"));
				goods.setMaoB(rs.getString("MaoB"));
				goods.setiWarningCount(rs.getInt("iWarningCount"));//�󾯔���
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
	 * ���ܣ��������T��id��@ȡӆ�ε���Ϣ
	 * �r�g��2015/11/12
	 * ���ߣ�����Ժ
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
	 * ������䁵�id��@ȡ��䁵�Logo�͵�䁵����Q
	 * �r�g��2015/11/12
	 * ���ߣ�����Ժ
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
	
	
	
	/** cart.jsp���
	 * �������T��䛵��~̖�@ȡ������ُ��܇֮������˕��T��ُ��܇��Ʒ�ĵ�䁘�̖��@ȡ�����ĵ����Ϣ
	 * �r�g��2015/11/18
	 * ���ߣ�����Ժ
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
	 * ���ܣ��������T��IUserId��@ȡُ��܇���д˕��T��������Ϣ
	 * �r�g��2015/11/12
	 * ���ߣ�����Ժ
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
