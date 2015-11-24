package customerEnter.Servlet.joincart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customerEnter.bean.shangpin.ShangPin;
import customerEnter.dao.order.CustomerShoppingCartDao;
import customerEnter.tool.DataTimeNumber;

public class JoinUserCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId=new String(request.getParameter("userId").getBytes("ISO-8859-1"),"UTF-8");
		String shopId=new String(request.getParameter("shopId").getBytes("ISO-8859-1"),"UTF-8");
		String goodsId=new String(request.getParameter("goodsId").getBytes("ISO-8859-1"),"UTF-8");
		String NumEveryTotal=new String(request.getParameter("NumEveryTotal").getBytes("ISO-8859-1"),"UTF-8");
		String GuigeImage=request.getParameter("GuigeImage");
		String Size=new String(request.getParameter("Size").getBytes("ISO-8859-1"),"UTF-8");
		
		
		if(GuigeImage==null){
			GuigeImage="0";
		}
		if(Size==null){
			Size="";
		}
		int guigeImage=Integer.parseInt(GuigeImage);
		int iUserId=Integer.parseInt(userId);
		int iShopId=Integer.parseInt(shopId);
		int iGoodsId=Integer.parseInt(goodsId);
		int iCount=Integer.parseInt(NumEveryTotal);
		String sStandara = "||";
		
		
		ArrayList<ShangPin> shangpins=(ArrayList<ShangPin>)request.getSession().getAttribute("shangpins");
		if(shangpins!=null){
			for(int i=0;i<shangpins.size();i++){
				if(iGoodsId==shangpins.get(i).getId()){
					ArrayList<String> list=DataTimeNumber.getGuigeFirst(shangpins.get(i).getGuige());
					for(int j=0;j<list.size();j++){
						if(guigeImage==j){
							sStandara=list.get(j).trim()+"|"+Size+"|";
							break;
						}else{
							sStandara="|"+Size+"|";
						}
					}
			}}
		}
		
		CustomerShoppingCartDao.insertShoppingCart(iUserId, iShopId, iGoodsId, iCount, sStandara);
		response.sendRedirect("testcart.jsp?shangpin="+goodsId);
		
	}

}
