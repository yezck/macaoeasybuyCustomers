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
 * ���ܣ�����ϵ�y���P���Ʒ��������湦��
 * �r�g��2015/11/11
 * ���ߣ�����Ժ
 * �f���������������е�%������ģ����ԃ����
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
			stmt.setString(1,"%"+title+"%");//�Զ���ӵ����� ����װ��Ĳ����� 
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
 * ���ܣ�ͬ��
 * �f�������������Ʒ���Q�]�в�ԃ���κ���Ϣ�ĕr��Ͱ�����Ʒ�P�I�ֵĘ˜����M�в�ԃ
 * �r�g��2015/11/11
 * ���ߣ�����Ժ
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
		stmt.setString(1,"%"+title+"%");//�Զ���ӵ����� ����װ��Ĳ����� 
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
 * ���ܣ������@ȡ��Ҫ�������ַ������ڔ��������M�в������P����Ϣ��
 * ̎�����ݔ����ַ����������B�ӵ��ַ������������  ��Ӣ���͹��ƶ�����ñ��������@ȡ�Ĕ����顰Ӣ������ñ���@ȡ���͹�ñ���r��
 *              ���Ք������й̶��Č����@Ȼ�]�����F��Ҫ���Ŀ�ˣ��@�r������Ҫ��ݔ����ַ����M�зֽ�̎��֮�����M�в���
 * �r�g��2015/11/11
 * ���ߣ�����Ժ
 * */
public static void StatisticalProcessing(String Title){
	
	ArrayList<ShangPin> list=FuzzySearchClass.SearchShangPinTitle(Title);
	if(list.size()==0){
		list=FuzzySearchClass.SearchShangPinKeyWord(Title);
	}
	
	for(int i=0;i<list.size();i++){
		System.out.println(list.get(i).getTitle());
		System.out.println("���");
	}
}
public static void main(String[] args) {
	
	FuzzySearchClass.StatisticalProcessing("�μ����");
	
	
}











}
