package customerEnter.Servlet.customerlogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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
			 session.setAttribute("CustomerValidate","1");//Ù~‘ô²»´æÔÚ
			 response.sendRedirect("Login.jsp");
		 }else if(!customer.getPsw().equals(AccountPsw.trim())){
			 session.setAttribute("CustomerValidate","0");//ÃÜ´a²Ù×÷
			 response.sendRedirect("Login.jsp");
		 }else{
			 
				 session.setAttribute("CustomerValue",customer);
				 response.sendRedirect("shops.jsp");
				// RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/page/1.jsp");   
				 //rd.forward(request,response);
		 }
		 
		 
		 
	}

}
