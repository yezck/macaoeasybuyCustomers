package customerEnter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import ch.qos.cal10n.Locale;

import customerEnter.bean.shangpin.ShangPin;
import customerEnter.dao.JDBCconndao.macaoBuyDB;
public class FuzzySearchClass {
	

	
	
/**
 * 功能：整個系統中關於商品的搜索頁面功能
 * 時間：2015/11/11
 * 編者：徐新院
 * 說明：根據數據庫中的%，——模糊查詢數據
 * */
public  static  ArrayList<ShangPin> SearchShangPinTitle(String  title) {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql="use test_mbuydate select id,Title,KeyWord,Number,CostPrice,Price,Pic,pic2,pic3,shopid,AreaClassID,guige,kucun,tupian,chengben,addtime,sBuyNum,sSeeNum,State,intro,expertlable,MaoA,MaoB from  ShangPin  where Title  like ?";
		ShangPin goods=null;
		ArrayList<ShangPin> list=new ArrayList<ShangPin>();
		try {
			conn = macaoBuyDB.getConnection();
			stmt =conn.prepareStatement(sql);
			stmt.setString(1,"%"+title+"%");//自动添加单引号 （包装后的参数） 
			stmt.execute();
			rs=stmt.executeQuery();
			while (rs.next()){
			  goods=new ShangPin();
			  goods.setId(rs.getInt("id"));
          	  goods.setTitle(rs.getString("Title"));
          	  goods.setKeyWord(rs.getString("KeyWord"));
          	  goods.setNumber(rs.getString("Number"));
          	  goods.setCostPrice(rs.getInt("CostPrice"));
          	  goods.setPrice(rs.getInt("Price"));
          	  goods.setPic(rs.getString("Pic"));
          	  goods.setPic2(rs.getString("pic2"));
          	  goods.setPic3(rs.getString("pic3"));
          	  goods.setShopid(rs.getInt("shopid"));
          	  goods.setAreaClassID(rs.getString("AreaClassID"));
          	  goods.setGuige(rs.getString("guige"));
          	  goods.setKucun(rs.getString("kucun"));
          	  goods.setTupian(rs.getString("tupian"));
          	  goods.setChengben(rs.getString("chengben"));
          	  goods.setAddtime(rs.getString("addtime"));
          	  goods.setsBuyNum(rs.getInt("sBuyNum"));
          	  goods.setsSeeNum(rs.getInt("sSeeNum"));
          	  goods.setState(rs.getInt("State"));
          	  goods.setIntro(rs.getString("intro"));
          	  goods.setExpertlable(rs.getInt("expertlable"));
          	  goods.setMaoA(rs.getString("MaoA"));
          	  goods.setMaoB(rs.getString("MaoB"));
				list.add(goods);
			}
		} catch (SQLException ex) {
			Logger.getLogger(FuzzySearchClass.class.getName()).log(Level.SEVERE, null, ex);
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
				Logger.getLogger(FuzzySearchClass.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
		
	}




/****
 * 功能：同上
 * 說明：如果根據商品名稱沒有查詢到任何信息的時候就按照商品關鍵字的標準再進行查詢
 * 時間：2015/11/11
 * 編者：徐新院
 * */
public  static  ArrayList<ShangPin> SearchShangPinKeyWord(String  title) {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String sql="use test_mbuydate select id,Title,KeyWord,Number,CostPrice,Price,Pic,pic2,pic3,shopid,AreaClassID,guige,kucun,tupian,chengben,addtime,sBuyNum,sSeeNum,State,intro,expertlable,MaoA,MaoB from  ShangPin  where KeyWord  like ?";
	ShangPin goods=null;
	ArrayList<ShangPin> list=new ArrayList<ShangPin>();
	try {
		conn = macaoBuyDB.getConnection();
		stmt =conn.prepareStatement(sql);
		stmt.setString(1,"%"+title+"%");//自动添加单引号 （包装后的参数） 
		stmt.execute();
		rs=stmt.executeQuery();
		while (rs.next()){
			goods=new ShangPin();
			goods.setId(rs.getInt("id"));
			goods.setTitle(rs.getString("Title"));
			goods.setKeyWord(rs.getString("KeyWord"));
			goods.setNumber(rs.getString("Number"));
			goods.setCostPrice(rs.getInt("CostPrice"));
			goods.setPrice(rs.getInt("Price"));
			goods.setPic(rs.getString("Pic"));
			goods.setPic2(rs.getString("pic2"));
			goods.setPic3(rs.getString("pic3"));
			goods.setShopid(rs.getInt("shopid"));
			goods.setAreaClassID(rs.getString("AreaClassID"));
			goods.setGuige(rs.getString("guige"));
			goods.setKucun(rs.getString("kucun"));
			goods.setTupian(rs.getString("tupian"));
			goods.setChengben(rs.getString("chengben"));
			goods.setAddtime(rs.getString("addtime"));
			goods.setsBuyNum(rs.getInt("sBuyNum"));
			goods.setsSeeNum(rs.getInt("sSeeNum"));
			goods.setState(rs.getInt("State"));
			goods.setIntro(rs.getString("intro"));
			goods.setExpertlable(rs.getInt("expertlable"));
			goods.setMaoA(rs.getString("MaoA"));
			goods.setMaoB(rs.getString("MaoB"));
			list.add(goods);
		}
	} catch (SQLException ex) {
		Logger.getLogger(FuzzySearchClass.class.getName()).log(Level.SEVERE, null, ex);
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
			Logger.getLogger(FuzzySearchClass.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	return list;
	
}

/**
 * 功能：根據獲取的要搜索的字符串來在數據庫中進行查找相關的信息。
 * 處理：如果輸入的字符串正好是連接的字符串，比如查找  “英倫復古破洞棒球帽”，如果獲取的數據為“英倫棒球帽”獲取“復古帽”時，
 *              按照數據庫中固定的寫法顯然沒法實現所要求的目標，這時，就需要對輸入的字符串進行分解處理之後再進行查找
 * 時間：2015/11/11
 * 編者：徐新院
 * */
public static void StatisticalProcessing(String Title){
	
	ArrayList<ShangPin> list=FuzzySearchClass.SearchShangPinTitle(Title);
	if(list.size()==0){
		list=FuzzySearchClass.SearchShangPinKeyWord(Title);
	}
	
	for(int i=0;i<list.size();i++){
		System.out.println(list.get(i).getTitle());
		System.out.println("完成");
	}
}
public static void main(String[] args) {
	
	FuzzySearchClass.StatisticalProcessing("單肩包袋");
	
	
}











}
