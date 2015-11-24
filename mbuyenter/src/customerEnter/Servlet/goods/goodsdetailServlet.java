package customerEnter.Servlet.goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customerEnter.bean.shangpin.ShangPin;
import customerEnter.bean.shangpin.ShangPinComment;
import customerEnter.bean.store.Shop;
import customerEnter.dao.goodsdao.ShangPinCommentdao;
import customerEnter.dao.goodsdao.ShangPinManagedao;
import customerEnter.dao.shop.CustomerShopDao;

public class goodsdetailServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		String goodsNumber=(String)request.getParameter("numberNo");//��Ʒ��̖
		
		ShangPin shangpin=ShangPinManagedao.CustomerGoodsdetail(goodsNumber);//������Ʒ��̖���ԃ����Ʒ��������Ϣ
		
		ArrayList<ShangPinComment> shangpincomment=ShangPinCommentdao.CustShangPinComment(goodsNumber);//��ԃ����Ʒ���uՓ����
		ArrayList<ShangPin> shangpinshops=ShangPinManagedao.CustomerGoodsOthers(shangpin.getShopid());
		
		Shop shop=CustomerShopDao.CustomerShop(shangpin.getShopid());//����Ʒ���P�ĵ����Ϣ
		session.setAttribute("goodsdetails", shangpin);
		session.setAttribute("shopdetails", shop);
		session.setAttribute("shangpincomment", shangpincomment);
		session.setAttribute("shangpinshopsall", shangpinshops);//�˵��ȫ����Ʒ��Ϣ
		
		response.sendRedirect("goodsdetail.jsp");
		
			//
	}

}
