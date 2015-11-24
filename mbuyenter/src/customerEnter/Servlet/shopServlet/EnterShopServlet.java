package customerEnter.Servlet.shopServlet;

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

public class EnterShopServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String iUserid=(String)request.getParameter("iUserid");
		String iShopId=(String)request.getParameter("iShopId");
		
		int userid=Integer.parseInt(iUserid);
		int shopid=Integer.parseInt(iShopId);
		
		
		HttpSession session = request.getSession(true);
		Shop shop=CustomerShopDao.CustomerShop(shopid);
		
		ArrayList<ShangPin> shangpins=ShangPinManagedao.CustomerShopAllShangpin(shopid);
		session.setAttribute("shop", shop);
		session.setAttribute("shangpins", shangpins);
	
		
		response.sendRedirect("shopindex.jsp");
	}

}
