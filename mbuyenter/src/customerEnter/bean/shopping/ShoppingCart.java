package customerEnter.bean.shopping;

public class ShoppingCart {

	private int id;
	private int iUserId;
	private int iShopId;
	private int iGoodsId;
	private int iCount;
	private String sStandard;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getiUserId() {
		return iUserId;
	}
	public void setiUserId(int iUserId) {
		this.iUserId = iUserId;
	}
	public int getiShopId() {
		return iShopId;
	}
	public void setiShopId(int iShopId) {
		this.iShopId = iShopId;
	}
	public int getiGoodsId() {
		return iGoodsId;
	}
	public void setiGoodsId(int iGoodsId) {
		this.iGoodsId = iGoodsId;
	}
	public int getiCount() {
		return iCount;
	}
	public void setiCount(int iCount) {
		this.iCount = iCount;
	}
	public String getsStandard() {
		return sStandard;
	}
	public void setsStandard(String sStandard) {
		this.sStandard = sStandard;
	}
	
	
}
