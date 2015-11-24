package customerEnter.Servlet.customerlogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customerEnter.bean.customerUser.Customers;

public class GoOutCustomerLoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		Customers CustomerValue=(Customers)session.getAttribute("CustomerValue");
		if(CustomerValue!=null){
			session.removeAttribute("CustomerValue");
			session.setAttribute("CustomerValue", null);
			response.sendRedirect("Login.jsp");
		}else{
			response.sendRedirect("Login.jsp");
		}
	}

}
