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
	 * ���ܣ���ُ��܇������@ʾ������Ʒ���Ǳ��鿴�Ĕ�Ŀ�������Ʒ(�������ǲ鿴���Ľ�������)
	 * �r�g��2015/11/13
	 * ���ߣ�����Ժ
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
	 
	/**��Ҫ�Á�ʹ����shops��jsp��棨�R�r�yԇ����������퓺��ԄӼ��d��
	 * ���ܣ���ُ��܇������@ʾ������Ʒ���Ǳ��鿴�Ĕ�Ŀ�������Ʒ(������Ʒ�ϼܕr�g��������)
	 * �r�g��2015/11/13
	 * ���ߣ�����Ժ
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
	
	/**��Ҫ�Á�ʹ����shops��jsp��棨�R�r�yԇ����������퓺��ԄӼ��d��
	 * ���ܣ���ُ��܇������@ʾ������Ʒ���Ǳ��鿴�Ĕ�Ŀ�������Ʒ(������Ʒ�ϼܕr�g��������)
	 *              ������Ҫ�ă��݁�@ȡ������������session
	 * �r�g��2015/11/13
	 * ���ߣ�����Ժ
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
	 * ���ܣ�������䁵�id��@ȡ�˵�������е���Ʒ��Ϣ
	 * �r�g��2015/11/13
	 * ���ߣ�����Ժ
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
				goods.setJiang(rs.getInt("jiang"));//���r��Ʒ
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
				goods.setState(rs.getInt("State"));//��B
				goods.setIntro(rs.getString("intro"));
				goods.setExpertlable(rs.getInt("expertlable"));
				goods.setMaoA(rs.getString("MaoA"));
				goods.setMaoB(rs.getString("MaoB"));
				goods.setiWarningCount(rs.getInt("iWarningCount"));//�󾯔���
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
	
	
	/**           cart.jsp���
	 * ���ܣ��������T��䛵��~̖��Ϣ�@ȡ�����P�˕��T��������Ʒ��Ϣ
	 * �r�g��2015/11/18
	 * ���ߣ�����Ժ
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
			goods.setJiang(listshangpin.get(i).getJiang());//���r��Ʒ
			goods.setTuan(listshangpin.get(i).getTuan());//���r��Ʒ
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
			goods.setState(listshangpin.get(i).getState());//��B
			goods.setIntro(listshangpin.get(i).getIntro());
			goods.setExpertlable(listshangpin.get(i).getExpertlable());
			goods.setMaoA(listshangpin.get(i).getMaoA());
			goods.setMaoB(listshangpin.get(i).getMaoB());
			goods.setiWarningCount(listshangpin.get(i).getiWarningCount());//�󾯔���
			goods.setShangpinLable(listshangpin.get(i).getShangpinLable());//
			
		}
			}
		}
		return goods;
	}
	/**
     * ���ܣ�������Ʒ������Ʒ�ϼܵĕr�g��Ŀǰ�ĕr�g�Ĳ���@ʾ��������µ���Ʒ
     * �r�g��2015/11/14
     * ���ߣ�����Ժ
     * **/
	public static ArrayList<ShangPin> getNewDateShangPin(ArrayList<ShangPin> shangpin){
		String TimeD="";
		
		Date time1=new Date();  
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        String tm=sdf.format(time1);//tm������������ڵ��ַ�����ʾ  
        
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
					goods.setJiang(shangpin.get(i).getJiang());//���r��Ʒ
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
					goods.setState(shangpin.get(i).getState());//��B
					goods.setIntro(shangpin.get(i).getIntro());
					goods.setExpertlable(shangpin.get(i).getExpertlable());
					goods.setMaoA(shangpin.get(i).getMaoA());
					goods.setMaoB(shangpin.get(i).getMaoB());
					goods.setiWarningCount(shangpin.get(i).getiWarningCount());//�󾯔���
					list.add(goods);
					
				}
			}
			
		}
		return list;
	}
	
	/** ُ�I��     �g�[����
	 * ���ܣ�������䁵�id���ԃ�˵�䁵����е���Ʒ�Ŀ��g�[���Ϳ�ُ�I���K���@ʾ��shops.jsp���
	 * �r�g��2015/11/20
	 * ���ߣ�����Ժ
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
		total[0]=totalsee;//���g�[��
		total[1]=totalbuy;//��ُ�I��
		return total;
	}
	
	
	
	/**
	 * ���ܣ��c����Ʒ�DƬ�^���������M����Ʒ��Ԕ����棨goodsdetail.jsp��
	 *              ��Ʒ���۷e�N�ۣ����u�ʣ������ُ�I�Ĕ������˷��Ąӣ��˷��dȤ
	 * �r�g��2015/11/23
	 * ���ߣ�����Ժ
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
	 * ���ܣ���ԃ�˵�䁵�������Ʒ���P��Ϣgoodsdetail.jsp
	 *              ��Ʒ���۷e�N�ۣ����u�ʣ������ُ�I�Ĕ������˷��Ąӣ��˷��dȤ
	 * �r�g��2015/11/23
	 * ���ߣ�����Ժ
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
		//select top 9 * from shangpin where shopid=8��ԃ9�Д���
	}


}
