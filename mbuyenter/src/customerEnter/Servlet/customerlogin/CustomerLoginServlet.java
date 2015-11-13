package customerEnter.Servlet.customerlogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customerEnter.bean.customerUser.Customers;
import customerEnter.dao.UserManageDao.CustomerUserManageDao;

public class CustomerLoginServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		String Account=new String(request.getParameter("AccountNo").getBytes("ISO-8859-1"),"UTF-8");
		String AccountPsw=new String(request.getParameter("AccountPsw").getBytes("ISO-8859-1"),"UTF-8");
		
		
		 Customers customer=CustomerUserManageDao.ValidateLogin(Account);
		 if(customer.getAccount()==null){
			 session.setAttribute("CustomerValue",null);
			 response.sendRedirect("Login.jsp");
		 }else{
			 if(customer.getPsw().equals(AccountPsw)){
				 Customers CustomerValue=(Customers)session.getAttribute("CustomerValue");
				 if(CustomerValue!=null){
					 session.setAttribute("CustomerValue",null);
				 }
				 session.setAttribute("CustomerValue",customer);
				 response.sendRedirect("shopindex.jsp");
			 }else{
				 session.setAttribute("CustomerValue",null);
				 response.sendRedirect("Login.jsp");
			 }
		 }
	}

}
