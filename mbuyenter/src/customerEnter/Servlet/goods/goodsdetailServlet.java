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
		String goodsNumber=(String)request.getParameter("numberNo");//商品編號
		
		ShangPin shangpin=ShangPinManagedao.CustomerGoodsdetail(goodsNumber);//根據商品編號來查詢此商品的其他信息
		
		ArrayList<ShangPinComment> shangpincomment=ShangPinCommentdao.CustShangPinComment(goodsNumber);//查詢此商品的評論描述
		ArrayList<ShangPin> shangpinshops=ShangPinManagedao.CustomerGoodsOthers(shangpin.getShopid());
		
		Shop shop=CustomerShopDao.CustomerShop(shangpin.getShopid());//此商品有關的店鋪信息
		session.setAttribute("goodsdetails", shangpin);
		session.setAttribute("shopdetails", shop);
		session.setAttribute("shangpincomment", shangpincomment);
		session.setAttribute("shangpinshopsall", shangpinshops);//此店的全部商品信息
		
		response.sendRedirect("goodsdetail.jsp");
		
			//
	}

}
