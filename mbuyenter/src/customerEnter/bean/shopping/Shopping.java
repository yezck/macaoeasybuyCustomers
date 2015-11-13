package customerEnter.bean.shopping;
/***
 * 備註：在MacaoeasyBuy商家平台的bean包中已經有了，為了方便分開管理，這裡的購物表表示重複
 * 時間：2015/11/11
 * 編者：徐新院
 * 說明：購物表
 * */
public class Shopping {

	private int id;
	private int iOrderId;
	private int iGoodsId;
	private int iCount;
	private String sStandard;
	private float fPrice;
	private int iMop;
	private int iDepreciate;
	private int iState;
	private float fRealyPrice;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getiOrderId() {
		return iOrderId;
	}
	public void setiOrderId(int iOrderId) {
		this.iOrderId = iOrderId;
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
	public float getfPrice() {
		return fPrice;
	}
	public void setfPrice(float fPrice) {
		this.fPrice = fPrice;
	}
	public int getiMop() {
		return iMop;
	}
	public void setiMop(int iMop) {
		this.iMop = iMop;
	}
	public int getiDepreciate() {
		return iDepreciate;
	}
	public void setiDepreciate(int iDepreciate) {
		this.iDepreciate = iDepreciate;
	}
	public int getiState() {
		return iState;
	}
	public void setiState(int iState) {
		this.iState = iState;
	}
	public float getfRealyPrice() {
		return fRealyPrice;
	}
	public void setfRealyPrice(float fRealyPrice) {
		this.fRealyPrice = fRealyPrice;
	}
	
	
}
