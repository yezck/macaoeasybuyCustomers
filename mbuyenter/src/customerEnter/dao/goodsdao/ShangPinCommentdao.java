package customerEnter.dao.goodsdao;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import customerEnter.bean.shangpin.ShangPinComment;
import customerEnter.dao.JDBCconndao.macaoBuyDB;

public class ShangPinCommentdao {

	/***
	 * 功能：商品評價中計算商品的描述相符，商品質量，價格合理
	 * 時間：2015/11/23
	 * 編者：徐新院
	 * **/
	public  static  ArrayList<ShangPinComment> CustShangPinComment(String shangPinId) {
		String sql="use test_mbuydate select id,UserId,ShangPinId,Miao,Jia,Shang,State from ShangPinComment where ShangPinId='"+shangPinId+"'";
		   Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        ShangPinComment goodsConment;
	  ArrayList<ShangPinComment> list=new ArrayList();
	        try {
	            conn = macaoBuyDB.getConnection();
	            stmt =conn.createStatement();
	            rs = stmt.executeQuery(sql);
	            while (rs.next()){
	            	goodsConment=new ShangPinComment();
	            	goodsConment.setId(rs.getInt("id"));
	            	goodsConment.setUserId(rs.getInt("UserId"));
	            	goodsConment.setShangPinId(rs.getString("ShangPinId"));
	            	goodsConment.setMiao(rs.getInt("Miao"));
	            	goodsConment.setJia(rs.getInt("Jia"));
	            	goodsConment.setShang(rs.getInt("Shang"));
	            	goodsConment.setState(rs.getInt("State"));
	                list.add(goodsConment);
	            }

	        } catch (SQLException ex) {
	            Logger.getLogger(ShangPinCommentdao.class.getName()).log(Level.SEVERE, null, ex);
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
	                Logger.getLogger(ShangPinCommentdao.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
			return list;

	    }
	
	/***
	 * 功能：根據某一個商品的編號來獲取對應的商品評價信息來計算此商品的
	 *              描述相符     價格合理      商品質量
	 *時間：2015/11/23
	 * 編者：徐新院
	 * **/
	public static double[] calculateComment(ArrayList<ShangPinComment> comment,String number){
		double[] commentList=new double[3];
		int shangpinMao=0,shangpinJia=0,shangpinShang=0,total=0;
		if(comment!=null&&comment.size()!=0){
			for(int i=0;i<comment.size();i++){
				if(comment.get(i).getShangPinId().equals(number)){
					shangpinMao=comment.get(i).getMiao()+shangpinMao;
					shangpinJia=comment.get(i).getJia()+shangpinJia;
					shangpinShang=comment.get(i).getShang()+shangpinShang;
					total++;
				}
			}
			BigDecimal   b1   =   new   BigDecimal(shangpinMao/total);
			double   shangpinMao1   =   b1.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();//保留兩位小數
			BigDecimal   b2   =   new   BigDecimal(shangpinJia/total);
			double   shangpinJia1   =   b2.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();//保留兩位小數
			BigDecimal   b3   =   new   BigDecimal(shangpinShang/total);
			double   shangpinShang1   =   b3.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();//保留兩位小數
			commentList[0]=shangpinMao1;//描述相符
			commentList[1]=shangpinJia1;//價格合理
			commentList[2]=shangpinShang1;//商品質量
		}else{
			commentList[0]=0.0;//描述相符
			commentList[1]=0.0;//價格合理
			commentList[2]=0.0;//商品質量
		}
		
		return commentList;
	}
	
	
}
