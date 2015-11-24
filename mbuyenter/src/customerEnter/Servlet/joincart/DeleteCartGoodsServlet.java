package customerEnter.Servlet.joincart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customerEnter.bean.customerUser.Customers;
import customerEnter.bean.customerUser.UserMop;
import customerEnter.bean.customerUser.UserPoint;
import customerEnter.bean.shopping.ShoppingCart;
import customerEnter.dao.UserManageDao.CustomerUserMop_PointDao;
import customerEnter.dao.order.CustomerShoppingCartDao;
import customerEnter.dao.order.CustomerShoppingDao;

public class DeleteCartGoodsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cartid=(String)request.getParameter("cartid");
		int CartId=Integer.parseInt(cartid);
		CustomerShoppingCartDao.DeleteShoppingCart(CartId);
		request.removeAttribute("cartshangpin");
		request.setAttribute("cartshangpin", null);
		
		//�h��ӆ��֮������ ���d���µ���Ϣ��session��
//		HttpSession session = request.getSession(true);
//		UserMop usermop=CustomerUserMop_PointDao.GetOnlyUserMop(CartId);//���T�t����Ϣ
//		UserPoint userpoint=CustomerUserMop_PointDao.GetOnlyUserPoint(CartId);//���T�e����Ϣ
//		ArrayList<ShoppingCart> shoppingcart=CustomerShoppingDao.CustomerShoppingCart(CartId);//������䛕��T��id��@ȡُ��܇�Ќ�������Ʒ��Ϣ
//	
//	session.setAttribute("usermop",usermop);
//	session.setAttribute("userpoint",userpoint);
//	session.setAttribute("shoppingcart",shoppingcart);
	response.sendRedirect("cart.jsp");
		
		
	}

}
