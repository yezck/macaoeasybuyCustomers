package customerEnter.bean.shangpin;

/***
 * 說明：商品評論表
 * 
 * **/
public class ShangPinComment {

	private int id;
	private int UserId;
	private String ShangPinId;
	private int OrderId;
	private String Comment;
	private int Miao;
	private int Jia;
	private int Shang;
	private String standard;
	private String addtime;
	private String uptime;
	private int State;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public String getShangPinId() {
		return ShangPinId;
	}
	public void setShangPinId(String shangPinId) {
		ShangPinId = shangPinId;
	}
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public String getComment() {
		return Comment;
	}
	public void setComment(String comment) {
		Comment = comment;
	}
	public int getMiao() {
		return Miao;
	}
	public void setMiao(int miao) {
		Miao = miao;
	}
	public int getJia() {
		return Jia;
	}
	public void setJia(int jia) {
		Jia = jia;
	}
	public int getShang() {
		return Shang;
	}
	public void setShang(int shang) {
		Shang = shang;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public String getUptime() {
		return uptime;
	}
	public void setUptime(String uptime) {
		this.uptime = uptime;
	}
	public int getState() {
		return State;
	}
	public void setState(int state) {
		State = state;
	}
	
	
	
}
