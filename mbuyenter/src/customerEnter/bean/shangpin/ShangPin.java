package customerEnter.bean.shangpin;
/***
 * 備註：在MacaoeasyBuy商家平台的bean包中已經有了，為了方便分開管理，這裡的購物表表示重複
 * 時間：2015/11/11
 * 編者：徐新院
 * 說明：商品表
 * */
public class ShangPin {
   private int id;//自增长
   private int therorder;
   private String Title;//标题(商品名称)
   private String KeyWord;
   private String Number;//商品编号（商品编号）
   private int CostPrice;//原价
   private int Price;//现售价
   private String pic;//商品图
   private String pic2;
   private String pic3;
   private int shopid;//店铺ID 外键表Shop（商品店家）
   private String AreaClassID;//所属分类 外键表AreaClass
   private int re;
   private int jiang;
   private int xin;
   private int xian;
   private int mian;
   private int tuan;
   private int yi;
   private int BrandID;
   private String guige;
   private String jiage;
   private String kucun;
   private String  tupian;
   private String chengben;
   private String addtime;
   private String uptime;
   private int LoveNum;
   private int BuyNum;
   private int SeeNum;
   private int Modela;
   private int Modelb;
   private int Modelc;
   private int reid;
   private int jiangid;
   private int xinid;
   private int mianid;
   private int tuanid;
   private int yiid;
   private String  intro;//商品简介
   private String explain;
   private String remark;
   private int expertlable;//商品标签ID  外键表lable 
   private int x_only;
   private int x_surplus;
   private int depreciate;
   private int h_surlus;
   private int integral;
   private String reg_date;
   private String buy_date;
   private int sBuyNum;//真实购买数（成交数量）
   private int sLoveNum;//
   private int sSeeNum;//真实查看数（浏览数量）
   private int mop;
   private int Place;
   private int TuanNum;
   private String  TuanStart;
   private String Tuanend;
   private int State;
   private int rChengPrice;
   private int mChengPrice;
   private int Canprice;
   private String Huilv;
   private  int YunFei;
   private String MaoA;
   private String MaoB;
   private int iWarningCount;
   private String shangpinLable;
   private String QRCode;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getTherorder() {
	return therorder;
}
public void setTherorder(int therorder) {
	this.therorder = therorder;
}
public String getTitle() {
	return Title;
}
public void setTitle(String title) {
	Title = title;
}
public String getKeyWord() {
	return KeyWord;
}
public void setKeyWord(String keyWord) {
	KeyWord = keyWord;
}
public String getNumber() {
	return Number;
}
public void setNumber(String number) {
	Number = number;
}
public int getCostPrice() {
	return CostPrice;
}
public void setCostPrice(int costPrice) {
	CostPrice = costPrice;
}
public int getPrice() {
	return Price;
}
public void setPrice(int price) {
	Price = price;
}
public String getPic() {
	return pic;
}
public void setPic(String pic) {
	this.pic = pic;
}
public String getPic2() {
	return pic2;
}
public void setPic2(String pic2) {
	this.pic2 = pic2;
}
public String getPic3() {
	return pic3;
}
public void setPic3(String pic3) {
	this.pic3 = pic3;
}
public int getShopid() {
	return shopid;
}
public void setShopid(int shopid) {
	this.shopid = shopid;
}
public String getAreaClassID() {
	return AreaClassID;
}
public void setAreaClassID(String areaClassID) {
	AreaClassID = areaClassID;
}
public int getRe() {
	return re;
}
public void setRe(int re) {
	this.re = re;
}
public int getJiang() {
	return jiang;
}
public void setJiang(int jiang) {
	this.jiang = jiang;
}
public int getXin() {
	return xin;
}
public void setXin(int xin) {
	this.xin = xin;
}
public int getXian() {
	return xian;
}
public void setXian(int xian) {
	this.xian = xian;
}
public int getMian() {
	return mian;
}
public void setMian(int mian) {
	this.mian = mian;
}
public int getTuan() {
	return tuan;
}
public void setTuan(int tuan) {
	this.tuan = tuan;
}
public int getYi() {
	return yi;
}
public void setYi(int yi) {
	this.yi = yi;
}
public int getBrandID() {
	return BrandID;
}
public void setBrandID(int brandID) {
	BrandID = brandID;
}
public String getGuige() {
	return guige;
}
public void setGuige(String guige) {
	this.guige = guige;
}
public String getJiage() {
	return jiage;
}
public void setJiage(String jiage) {
	this.jiage = jiage;
}
public String getKucun() {
	return kucun;
}
public void setKucun(String cucun) {
	this.kucun = cucun;
}
public String getTupian() {
	return tupian;
}
public void setTupian(String tupian) {
	this.tupian = tupian;
}
public String getChengben() {
	return chengben;
}
public void setChengben(String chengben) {
	this.chengben = chengben;
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
public int getLoveNum() {
	return LoveNum;
}
public void setLoveNum(int loveNum) {
	LoveNum = loveNum;
}
public int getBuyNum() {
	return BuyNum;
}
public void setBuyNum(int buyNum) {
	BuyNum = buyNum;
}
public int getSeeNum() {
	return SeeNum;
}
public void setSeeNum(int seeNum) {
	SeeNum = seeNum;
}
public int getModela() {
	return Modela;
}
public void setModela(int modela) {
	Modela = modela;
}
public int getModelb() {
	return Modelb;
}
public void setModelb(int modelb) {
	Modelb = modelb;
}
public int getModelc() {
	return Modelc;
}
public void setModelc(int modelc) {
	Modelc = modelc;
}
public int getReid() {
	return reid;
}
public void setReid(int reid) {
	this.reid = reid;
}
public int getJiangid() {
	return jiangid;
}
public void setJiangid(int jiangid) {
	this.jiangid = jiangid;
}
public int getXinid() {
	return xinid;
}
public void setXinid(int xinid) {
	this.xinid = xinid;
}
public int getMianid() {
	return mianid;
}
public void setMianid(int mianid) {
	this.mianid = mianid;
}
public int getTuanid() {
	return tuanid;
}
public void setTuanid(int tuanid) {
	this.tuanid = tuanid;
}
public int getYiid() {
	return yiid;
}
public void setYiid(int yiid) {
	this.yiid = yiid;
}
public String getIntro() {
	return intro;
}
public void setIntro(String intro) {
	this.intro = intro;
}
public String getExplain() {
	return explain;
}
public void setExplain(String explain) {
	this.explain = explain;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
public int getExpertlable() {
	return expertlable;
}
public void setExpertlable(int expertlable) {
	this.expertlable = expertlable;
}
public int getX_only() {
	return x_only;
}
public void setX_only(int x_only) {
	this.x_only = x_only;
}
public int getX_surplus() {
	return x_surplus;
}
public void setX_surplus(int x_surplus) {
	this.x_surplus = x_surplus;
}
public int getDepreciate() {
	return depreciate;
}
public void setDepreciate(int depreciate) {
	this.depreciate = depreciate;
}
public int getH_surlus() {
	return h_surlus;
}
public void setH_surlus(int h_surlus) {
	this.h_surlus = h_surlus;
}
public int getIntegral() {
	return integral;
}
public void setIntegral(int integral) {
	this.integral = integral;
}
public String getReg_date() {
	return reg_date;
}
public void setReg_date(String reg_date) {
	this.reg_date = reg_date;
}
public String getBuy_date() {
	return buy_date;
}
public void setBuy_date(String buy_date) {
	this.buy_date = buy_date;
}
public int getsBuyNum() {
	return sBuyNum;
}
public void setsBuyNum(int sBuyNum) {
	this.sBuyNum = sBuyNum;
}
public int getsLoveNum() {
	return sLoveNum;
}
public void setsLoveNum(int sLoveNum) {
	this.sLoveNum = sLoveNum;
}
public int getsSeeNum() {
	return sSeeNum;
}
public void setsSeeNum(int sSeeNum) {
	this.sSeeNum = sSeeNum;
}
public int getMop() {
	return mop;
}
public void setMop(int mop) {
	this.mop = mop;
}
public int getPlace() {
	return Place;
}
public void setPlace(int place) {
	Place = place;
}
public int getTuanNum() {
	return TuanNum;
}
public void setTuanNum(int tuanNum) {
	TuanNum = tuanNum;
}
public String getTuanStart() {
	return TuanStart;
}
public void setTuanStart(String tuanStart) {
	TuanStart = tuanStart;
}
public String getTuanend() {
	return Tuanend;
}
public void setTuanend(String tuanend) {
	Tuanend = tuanend;
}
public int getState() {
	return State;
}
public void setState(int state) {
	State = state;
}
public int getrChengPrice() {
	return rChengPrice;
}
public void setrChengPrice(int rChengPrice) {
	this.rChengPrice = rChengPrice;
}
public int getmChengPrice() {
	return mChengPrice;
}
public void setmChengPrice(int mChengPrice) {
	this.mChengPrice = mChengPrice;
}
public int getCanprice() {
	return Canprice;
}
public void setCanprice(int canprice) {
	Canprice = canprice;
}
public String getHuilv() {
	return Huilv;
}
public void setHuilv(String huilv) {
	Huilv = huilv;
}
public int getYunFei() {
	return YunFei;
}
public void setYunFei(int yunFei) {
	YunFei = yunFei;
}
public String getMaoA() {
	return MaoA;
}
public void setMaoA(String maoA) {
	MaoA = maoA;
}
public String getMaoB() {
	return MaoB;
}
public void setMaoB(String maoB) {
	MaoB = maoB;
}
public int getiWarningCount() {
	return iWarningCount;
}
public void setiWarningCount(int iWarningCount) {
	this.iWarningCount = iWarningCount;
}
public String getShangpinLable() {
	return shangpinLable;
}
public void setShangpinLable(String shangpinLable) {
	this.shangpinLable = shangpinLable;
}
public String getQRCode() {
	return QRCode;
}
public void setQRCode(String qRCode) {
	QRCode = qRCode;
}
  
   
}
