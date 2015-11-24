package customerEnter.dao.goodsdao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import customerEnter.bean.shangpin.ShangPin;
import customerEnter.bean.shangpin.ShangPinComment;
import customerEnter.dao.JDBCconndao.macaoBuyDB;
import customerEnter.dao.order.CustomerShoppingDao;
import customerEnter.tool.DataTimeNumber;
import customerEnter.tool.DateHandler;

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
	        String sql = "use test_mbuydate select top 20 id,Title,Number,CostPrice,Price,Pic,shopid,sSeeNum from ShangPin  order by sSeeNum desc";
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
	 
	/**主要用來使用在shops。jsp頁面（臨時測試，不包括分頁和自動加載）
	 * 功能：在購物車頁面中顯示所有商品真是被查看的數目對多的商品(按照商品上架時間降序排列)
	 * 時間：2015/11/13
	 * 編者：徐新院
	 * **/
	public  static  ArrayList<ShangPin> CustomerAddTimeShangpin() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "use test_mbuydate  select top 500  id,Title,Number,CostPrice,Price,Pic,Pic2,shopid,BuyNum,SeeNum,sBuyNum,sSeeNum from ShangPin  order by addtime desc";
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
				goods.setPic2(rs.getString("Pic2"));
				goods.setShopid(rs.getInt("shopid"));
				goods.setBuyNum(rs.getInt("BuyNum"));
				goods.setSeeNum(rs.getInt("SeeNum"));
				goods.setsBuyNum(rs.getInt("sBuyNum"));
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
	
	/**主要用來使用在shops。jsp頁面（臨時測試，不包括分頁和自動加載）
	 * 功能：在購物車頁面中顯示所有商品真是被查看的數目對多的商品(按照商品上架時間降序排列)
	 *              根據需要的內容來獲取數據，參數是session
	 * 時間：2015/11/13
	 * 編者：徐新院
	 * **/
	
	public  static  ArrayList<ShangPin> CustomerAddTimeShSession(ArrayList<ShangPin> session,int shopid) {
		ArrayList<ShangPin> list=new ArrayList<ShangPin>();
		ShangPin shang=null;
		if(session!=null&&session.size()>0){
			for(int i=0;i<session.size();i++){
				if(session.get(i).getShopid()==shopid){
			shang=new ShangPin();
			shang.setId(session.get(i).getId());
			shang.setTitle(session.get(i).getTitle());
			shang.setNumber(session.get(i).getNumber());
			shang.setCostPrice(session.get(i).getCostPrice());
			shang.setPrice(session.get(i).getPrice());
			shang.setPic(session.get(i).getPic());
			shang.setPic2(session.get(i).getPic2());
			shang.setShopid(session.get(i).getShopid());
			shang.setBuyNum(session.get(i).getBuyNum());
			shang.setSeeNum(session.get(i).getSeeNum());
			shang.setsBuyNum(session.get(i).getsBuyNum());
			shang.setsSeeNum(session.get(i).getsSeeNum());
			list.add(shang);
			}
			}
		}
		return list;
	}
	/**
	 * 功能：根據店鋪的id來獲取此店鋪中所有的商品信息
	 * 時間：2015/11/13
	 * 編者：徐新院
	 * */
	public  static  ArrayList<ShangPin> CustomerShopAllShangpin(int shopid) {
		String sql="use test_mbuydate select id,Title,Number,CostPrice,Price,Pic,shopid,AreaClassID,jiang,guige,jiage,kucun,tupian,chengben,addtime,uptime,sLoveNum,sBuyNum,sSeeNum,State,intro,expertlable,MaoA,MaoB,iWarningCount from ShangPin  where shopid='"+shopid+"'";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ShangPin goods=null;
		ArrayList<ShangPin> list=new ArrayList<ShangPin>();
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
				goods.setAreaClassID(rs.getString("AreaClassID"));
				goods.setJiang(rs.getInt("jiang"));//降價商品
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
				goods.setState(rs.getInt("State"));//狀態
				goods.setIntro(rs.getString("intro"));
				goods.setExpertlable(rs.getInt("expertlable"));
				goods.setMaoA(rs.getString("MaoA"));
				goods.setMaoB(rs.getString("MaoB"));
				goods.setiWarningCount(rs.getInt("iWarningCount"));//報警數量
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
	
	
	/**           cart.jsp頁面
	 * 功能：根據會員登錄的賬號信息獲取到有關此會員的所有商品信息
	 * 時間：2015/11/18
	 * 編者：徐新院
	 * **/
	public  static  ShangPin CusShangpinSeetion(ArrayList<ShangPin>listshangpin,int goodsId,int shopId) {
		ShangPin goods=new ShangPin();
		ArrayList<ShangPin>Listshangpin=new ArrayList<ShangPin>();
		if(listshangpin!=null&&listshangpin.size()>0){
			for(int i=0;i<listshangpin.size();i++){
				if(listshangpin.get(i).getId()==goodsId&&shopId==listshangpin.get(i).getShopid()){
			
			goods.setId(listshangpin.get(i).getId());
			goods.setTitle(listshangpin.get(i).getTitle());
			goods.setNumber(listshangpin.get(i).getNumber());
			goods.setCostPrice(listshangpin.get(i).getCostPrice());
			goods.setPrice(listshangpin.get(i).getPrice());
			goods.setPic(listshangpin.get(i).getPic());
			goods.setShopid(listshangpin.get(i).getShopid());
			goods.setAreaClassID(listshangpin.get(i).getAreaClassID());
			goods.setJiang(listshangpin.get(i).getJiang());//降價商品
			goods.setTuan(listshangpin.get(i).getTuan());//降價商品
			goods.setGuige(listshangpin.get(i).getGuige());
			goods.setJiage(listshangpin.get(i).getJiage());
			goods.setKucun(listshangpin.get(i).getKucun());
			goods.setTupian(listshangpin.get(i).getTupian());
			goods.setChengben(listshangpin.get(i).getChengben());
			goods.setAddtime(listshangpin.get(i).getAddtime());
			goods.setUptime(listshangpin.get(i).getUptime());
			goods.setsLoveNum(listshangpin.get(i).getLoveNum());
			goods.setsBuyNum(listshangpin.get(i).getBuyNum());
			goods.setsSeeNum(listshangpin.get(i).getsSeeNum());
			goods.setMop(listshangpin.get(i).getMop());
			goods.setState(listshangpin.get(i).getState());//狀態
			goods.setIntro(listshangpin.get(i).getIntro());
			goods.setExpertlable(listshangpin.get(i).getExpertlable());
			goods.setMaoA(listshangpin.get(i).getMaoA());
			goods.setMaoB(listshangpin.get(i).getMaoB());
			goods.setiWarningCount(listshangpin.get(i).getiWarningCount());//報警數量
			goods.setShangpinLable(listshangpin.get(i).getShangpinLable());//
			
		}
			}
		}
		return goods;
	}
	/**
     * 功能：根據商品表中商品上架的時間和目前的時間的差來顯示最近三個月的商品
     * 時間：2015/11/14
     * 編者：徐新院
     * **/
	public static ArrayList<ShangPin> getNewDateShangPin(ArrayList<ShangPin> shangpin){
		String TimeD="";
		
		Date time1=new Date();  
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        String tm=sdf.format(time1);//tm就是昨天的日期的字符串表示  
        
        ShangPin goods=null;
		ArrayList<ShangPin> list=new ArrayList<ShangPin>();
		if(shangpin!=null){
			for(int i=0;i<shangpin.size();i++){
				try {
					TimeD=DataTimeNumber.getSubString(shangpin.get(i).getAddtime(), 10, "UTF-8");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String datetime1=DateHandler.remainDateToString(TimeD,tm);
				if(datetime1.equals("")||datetime1==""){
					datetime1="1";
				}
				
				int datetime2=Integer.parseInt(datetime1);
				
				if(datetime2<=3){
					goods=new ShangPin();
					goods.setId(shangpin.get(i).getId());
					goods.setTitle(shangpin.get(i).getTitle());
					goods.setNumber(shangpin.get(i).getNumber());
					goods.setCostPrice(shangpin.get(i).getCostPrice());
					goods.setPrice(shangpin.get(i).getPrice());
					goods.setPic(shangpin.get(i).getPic());
					goods.setShopid(shangpin.get(i).getShopid());
					goods.setAreaClassID(shangpin.get(i).getAreaClassID());
					goods.setJiang(shangpin.get(i).getJiang());//降價商品
					goods.setGuige(shangpin.get(i).getGuige());
					goods.setJiage(shangpin.get(i).getJiage());
					goods.setKucun(shangpin.get(i).getKucun());
					goods.setTupian(shangpin.get(i).getTupian());
					goods.setChengben(shangpin.get(i).getChengben());
					goods.setAddtime(shangpin.get(i).getAddtime());
					goods.setUptime(shangpin.get(i).getUptime());
					goods.setsLoveNum(shangpin.get(i).getsLoveNum());
					goods.setsBuyNum(shangpin.get(i).getsBuyNum());
					goods.setsSeeNum(shangpin.get(i).getsSeeNum());
					goods.setState(shangpin.get(i).getState());//狀態
					goods.setIntro(shangpin.get(i).getIntro());
					goods.setExpertlable(shangpin.get(i).getExpertlable());
					goods.setMaoA(shangpin.get(i).getMaoA());
					goods.setMaoB(shangpin.get(i).getMaoB());
					goods.setiWarningCount(shangpin.get(i).getiWarningCount());//報警數量
					list.add(goods);
					
				}
			}
			
		}
		return list;
	}
	
	/** 購買數     瀏覽總數
	 * 功能：根據店鋪的id來查詢此店鋪的所有的商品的總瀏覽數和總購買數並且顯示在shops.jsp頁面
	 * 時間：2015/11/20
	 * 編者：徐新院
	 * **/
	public static int[] TotalSeeBuyNum(ArrayList<ShangPin> shangps){
		int totalsee=0,totalbuy=0;
		int total[]=new int[2];
		if(shangps!=null&&shangps.size()>0){
			for(int i=0;i<shangps.size();i++){
				totalsee=totalsee+(shangps.get(i).getSeeNum()+shangps.get(i).getsSeeNum());
				totalbuy=totalbuy+(shangps.get(i).getBuyNum()+shangps.get(i).getsBuyNum());
			}
		}else{
			 totalsee=0;
			 totalbuy=0;
		}
		total[0]=totalsee;//總瀏覽數
		total[1]=totalbuy;//總購買數
		return total;
	}
	
	
	
	/**
	 * 功能：點擊商品圖片過著其他可進入商品的詳細頁面（goodsdetail.jsp）
	 *              商品的累積銷售，好評率，最近已購買的數量，宜粉心動，宜粉興趣
	 * 時間：2015/11/23
	 * 編者：徐新院
	 * **/
	public  static  ShangPin CustomerGoodsdetail(String number) {
		   Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        String sql = "use test_mbuydate select id,Title,Number,CostPrice,Price,Pic,Pic2,Pic3,shopid,guige,kucun,tupian,LoveNum,BuyNum,SeeNum,sBuyNum,sLoveNum,sSeeNum from ShangPin  where Number='"+number+"'";
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
	            	  goods.setPic2(rs.getString("Pic2"));
	            	  goods.setPic3(rs.getString("Pic3"));
	            	  goods.setShopid(rs.getInt("shopid"));
	            	  goods.setGuige(rs.getString("guige"));
	            	  goods.setKucun(rs.getString("kucun"));
	            	  goods.setTupian(rs.getString("tupian"));
	            	  goods.setLoveNum(rs.getInt("LoveNum"));
	            	  goods.setBuyNum(rs.getInt("BuyNum"));
	            	  goods.setSeeNum(rs.getInt("SeeNum"));
	            	  goods.setsBuyNum(rs.getInt("sBuyNum"));
	            	  goods.setsLoveNum(rs.getInt("sLoveNum"));
	            	  goods.setsSeeNum(rs.getInt("sSeeNum"));
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
			return goods;

	    }
	 
	/**
	 * 功能：查詢此店鋪的所有商品有關信息goodsdetail.jsp
	 *              商品的累積銷售，好評率，最近已購買的數量，宜粉心動，宜粉興趣
	 * 時間：2015/11/23
	 * 編者：徐新院
	 * **/
	public  static  ArrayList<ShangPin> CustomerGoodsOthers(int shopnumber) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "use test_mbuydate select id,Number,shopid,LoveNum,BuyNum,SeeNum,sBuyNum,sLoveNum,sSeeNum from ShangPin  where shopid='"+shopnumber+"'";
		ShangPin goods;
		 ArrayList<ShangPin>list=new  ArrayList<ShangPin>();
		try {
			conn = macaoBuyDB.getConnection();
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()){
				goods=new ShangPin();
				goods.setId(rs.getInt("id"));
				goods.setNumber(rs.getString("Number"));
				goods.setShopid(rs.getInt("shopid"));
				goods.setLoveNum(rs.getInt("LoveNum"));
				goods.setBuyNum(rs.getInt("BuyNum"));
				goods.setSeeNum(rs.getInt("SeeNum"));
				goods.setsBuyNum(rs.getInt("sBuyNum"));
				goods.setsLoveNum(rs.getInt("sLoveNum"));
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
		//select top 9 * from shangpin where shopid=8查詢9行數據
	}


}
