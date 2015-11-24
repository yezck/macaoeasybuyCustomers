package customerEnter.Servlet.joincart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customerEnter.bean.customerUser.Customers;
import customerEnter.bean.customerUser.UserMop;
import customerEnter.bean.customerUser.UserPoint;
import customerEnter.bean.shangpin.ShangPin;
import customerEnter.bean.shangpin.ShangPinLabel;
import customerEnter.bean.shopping.ShoppingCart;
import customerEnter.bean.store.Shop;
import customerEnter.dao.UserManageDao.CustomerUserMop_PointDao;
import customerEnter.dao.goodsdao.ShangPinLabeldao;
import customerEnter.dao.order.CustomerShoppingDao;
import customerEnter.dao.shop.CustomerShopDao;
import customerEnter.tool.DataTimeNumber;

public class EnterCartServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String UserId=(String)request.getParameter("iUserid");
		int userid=Integer.parseInt(UserId);
		
		HttpSession seim = request.getSession(true);
		UserMop usermop=CustomerUserMop_PointDao.GetOnlyUserMop(userid);//���T�t����Ϣ
		UserPoint userpoint=CustomerUserMop_PointDao.GetOnlyUserPoint(userid);//���T�e����Ϣ
		ArrayList<ShoppingCart> shoppingcart=CustomerShoppingDao.CustomerShoppingCart(userid);//������䛕��T��id��@ȡُ��܇�Ќ�������Ʒ��Ϣ
	    
		ArrayList<ShangPin>ListUsershangpin=new ArrayList<ShangPin>();
		 ArrayList<Shop> ListShop=new ArrayList<Shop>();
		for(int i=0;i<shoppingcart.size();i++){
	    	ShangPin shangpins=CustomerShoppingDao.CustomerShangpin(shoppingcart.get(i).getiGoodsId(), shoppingcart.get(i).getiShopId());
	    	ListUsershangpin.add(shangpins);
		}
		/////////////////////////////////////////////�@ȡُ��܇�е��������P���T��Ʒ�����ĵ�䁾�̖
		String[] shopid=new String[shoppingcart.size()];//ȥ�����}�ĵ��idֵ
        List<String> list = null;
       if(shoppingcart!=null){
        for(int i=0;i<shoppingcart.size();i++){ 
        shopid[i]=""+shoppingcart.get(i).getiShopId();
        list=DataTimeNumber.RemoveReArray(shopid);
        }
        
       
        Shop Shops=null;
        for(int i=0;i<list.size();i++){
        	Shop shops=CustomerShopDao.CustomerShop(Integer.parseInt(list.get(i)));
        	Shops=new Shop();
        	Shops.setId(shops.getId());
        	Shops.setShopname(shops.getShopname());
        	Shops.setShopMan(shops.getShopMan());
        	Shops.setTel(shops.getTel());
        	Shops.setLogo(shops.getLogo());
        	Shops.setStoreadvertising(shops.getStoreadvertising());
        	Shops.setGoodstype(shops.getGoodstype());
        	Shops.setAddtime(shops.getAddtime());
        	Shops.setShopInfor(shops.getShopInfor());
        	ListShop.add(Shops);
        }
        
       }
     
       //////////////////////////////////////////////////////////////////��Ʒ�Ļ�Ә˻`
       ArrayList<ShangPinLabel> shangpinlebelList=ShangPinLabeldao.CustomerShangPinLabel();
       
        
       
        
		seim.setAttribute("usermop", usermop);
		seim.setAttribute("userpoint", userpoint);
		seim.setAttribute("shoppingcart", shoppingcart);
		seim.setAttribute("ListUsershangpin", ListUsershangpin);
		seim.setAttribute("ListShop", ListShop);
		seim.setAttribute("shangpinlebelList", shangpinlebelList);
		
		
	
	
	response.sendRedirect("cart.jsp");
	}

}
