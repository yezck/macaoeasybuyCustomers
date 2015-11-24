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
	 * ���ܣ���Ʒ�u�r��Ӌ����Ʒ�������������Ʒ�|�����r�����
	 * �r�g��2015/11/23
	 * ���ߣ�����Ժ
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
	 * ���ܣ�����ĳһ����Ʒ�ľ�̖��@ȡ��������Ʒ�u�r��Ϣ��Ӌ�����Ʒ��
	 *              �������     �r�����      ��Ʒ�|��
	 *�r�g��2015/11/23
	 * ���ߣ�����Ժ
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
			double   shangpinMao1   =   b1.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();//�����λС��
			BigDecimal   b2   =   new   BigDecimal(shangpinJia/total);
			double   shangpinJia1   =   b2.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();//�����λС��
			BigDecimal   b3   =   new   BigDecimal(shangpinShang/total);
			double   shangpinShang1   =   b3.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();//�����λС��
			commentList[0]=shangpinMao1;//�������
			commentList[1]=shangpinJia1;//�r�����
			commentList[2]=shangpinShang1;//��Ʒ�|��
		}else{
			commentList[0]=0.0;//�������
			commentList[1]=0.0;//�r�����
			commentList[2]=0.0;//��Ʒ�|��
		}
		
		return commentList;
	}
	
	
}
