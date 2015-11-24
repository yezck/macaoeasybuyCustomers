package customerEnter.tool;

import java.io.ByteArrayOutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;



public class DataTimeNumber {



	
	public static String getSubString(String content, int size, String encoding) throws Exception{
		Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH); 
		int NowTime=year;
		
		if(encoding == null || encoding.equals("")){
		    throw new Exception("字符编码不能为空");
		   }
		   if(content == null){
		    throw new Exception("字符串内容不能为空");
		   }
		   if(size<0){
		    throw new Exception("获取的字节数不能小于0");
		   }
		   if(content.getBytes().length < size){
		    size = content.getBytes().length;
		   }
		   ByteArrayOutputStream out = new ByteArrayOutputStream();
		   int index = 0; //字符串的字符位置
		   int count = 0; //目前的字节数
		   while(count < size){
		    //当前的字节数目
		    count += content.substring(index, index+1).getBytes(encoding).length;
		    if(count<=size){
		      out.write(content.substring(index, index+1).getBytes(encoding));
		    }
		    index++;
		   }
		   String result = new String(out.toByteArray(),encoding);
		  // int Result=Integer.parseInt(result);//出身日期
		   out.close();
		//   return NowTime-Result;
		      return result;
		}
	
	
	/*
	 * 根据年份和员工数量自动生成员工账号
	 * */
	 public static String randomAccount(int Num){
		 Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
			int year = c.get(Calendar.YEAR); 
			int month = c.get(Calendar.MONTH); 
			int date = c.get(Calendar.DATE); 
			int hour = c.get(Calendar.HOUR_OF_DAY); 
			int minute = c.get(Calendar.MINUTE); 
			int second = c.get(Calendar.SECOND); 
//			
//			int max=1000;
//	        int min=10;
//	        Random random = new Random();
//
//	        int s = random.nextInt(max)%(max-min+1) + min;
//			
		   String tempAccout;
			if(Num<=9){
				tempAccout=year+"00"+Num;
			}else if(Num>=10&&Num<=99){
				tempAccout=year+"0"+Num;
			}else{
				tempAccout=year+""+Num;
			}
			
			String tem=month+""+date;
			return (tem+tempAccout);
	  }

	 
	 /*
		 * 根据年份和员工数量自动生成供应商账号
		 * */
		 public static String randomSupplierAccount(int Num){
			 Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
				int year = c.get(Calendar.YEAR); 
				int month = c.get(Calendar.MONTH); 
				int date = c.get(Calendar.DATE); 
				int hour = c.get(Calendar.HOUR_OF_DAY); 
				int minute = c.get(Calendar.MINUTE); 
				int second = c.get(Calendar.SECOND); 
//				
	//			int max=1000;
//		        int min=10;
//		        Random random = new Random();
	//
//		        int s = random.nextInt(max)%(max-min+1) + min;
//				
			   String tempAccout;
				if(Num<=9){
					tempAccout=year+"00"+Num;
				}else if(Num>=10&&Num<=99){
					tempAccout=year+"0"+Num;
				}else{
					tempAccout=year+""+Num;
				}
				
				String tem="S"+month+""+date+""+hour+""+minute+""+second;
				return (tem+tempAccout);
		  }

	 
	 
	 /**
	  * 功能：生成编标
	  * 编者：徐新院
	  * 时间：2015/8/18
	  * */
	 public static String LogNumber(int num){
		 
		 Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
			int year = c.get(Calendar.YEAR); 
			int month = c.get(Calendar.MONTH); 
			int date = c.get(Calendar.DATE); 
			int hour = c.get(Calendar.HOUR_OF_DAY); 
			int minute = c.get(Calendar.MINUTE); 
			int second = c.get(Calendar.SECOND); 
			String Lognumber;
		 if(num<=9){
			 Lognumber=year+"00"+num;
			}else if(num>=10&&num<=99){
				Lognumber=year+"0"+num;
			}else{
				Lognumber=year+""+num;
			}
		return Lognumber;
		 
	 }
	 
	 
	 /**
	  * 功能：获取系统的当前时间
	  * 编者：徐新院
	  * 时间：2015/8/29
	  * */
	 public static String Time(){
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
		 Date now = new Date(); 

		 String hehe = dateFormat.format( now ); 
		return hehe; 
		    }
	 
	 
	 /**
	  * 功能：截取数据库中商品的规格GetString_BigInterGuige和GetString_SmallInterGuige配合使用
	  * 编者：徐新院
	  * 时间：2015/8/29
	  * */
	 public static String[] GetString_BigInterGuige(String str){
		 //String str="192.168.0.1"; 
		 //String str=" 白色|37碼|,白色|38碼|,白色|39碼|,白色|40碼|,白色|41碼|"; 
	      String[] strarray=str.split("\\|,"); 
		return strarray; 
	 }
	 
	 
	 public static String[] GetString_SmallInterGuige(String str){
		 //String str="192.168.0.1"; 
		// String str=" 白色|37碼|,白色|38碼|,白色|39碼|,白色|40碼|,白色|41碼|"; 
	      String[] strarray=str.split("\\|"); 
		return strarray; 
	 }
	 public static String[] GetString_Guige(String str){
		 String[] strarray=str.split("\\|",3); 
		 return strarray; 
	 }
	 
	 
	 public static String[] GetString(String str){
		 //String str="192.168.0.1"; 
		// String str=" 白色|37碼|,白色|38碼|,白色|39碼|,白色|40碼|,白色|41碼|"; 
	      String[] strarray=str.split("\\u000a"); 
		return strarray; 
	 }
	 
	 public static String[] GetString_SmallInterGuigeSe(String str){
		 //String str="192.168.0.1"; 
		// String str=" 白色|37碼|,白色|38碼|,白色|39碼|,白色|40碼|,白色|41碼|"; 
	      String[] strarray=str.split("\\||,"); 
		return strarray; 
	 }
	 /**
	  * 功能：截取数据库中商品的售价
	  * 编者：徐新院
	  * 时间：2015/8/29
	  * */
	 
	 public static  String[] GetString_Price(String str){
		 String[] strarray=str.split("\\,"); 
	  return strarray; 
	 }
	 
	 
	
	 
	 public static String[] StringIndex(String str){
		 String[] strarray=null,strarray4=null;
		 int sa=str.indexOf("||");
		 if(sa>0){//表示有||
			 String[] strarray2 =GetString_SmallInterGuigeSe(str);
			 strarray=strarray2;
		 }else{
			return null;
		 }
		   return strarray;
}
	 
	 /**功能：截取商品库存数量
	  *    时间：2015/9/1 
	  *    编者：徐新院
	  * 
	  * **/
	 public static String[] StringInventory(String str){
		 String[] strarray=str.split("\\,"); 
		 return strarray;
	 }
	 
	 
	 /**
	  * 功能：把Model表中的數據截取后保存在數組中
	  * 時間：2015/10/7
	  * 編者：徐新院
	  * */
	 public static String[] GetStringModelValue(String str){
		 //String str="紅色  橙色  黃色  綠色  青色  靛色  藍色  紫色  粉色  啡色  米色  灰色  白色  黑色  灰綠  灰藍  灰啡  卡其色  粉紅色  圖片色";
	      String[] strarray=str.split("\\,"); 
		return strarray; 
	 }
	 public static String[] GetStringMValue(String str){
		 String[] strarray=str.split("\\  "); 
		 return strarray; 
	 }
	 
	 
	 
	 /****
	  * 功能：商品編輯頁面的商品規格要獲取數據庫中的規格信息，
		 * 並且分割中不同的字符串進行下拉框的選擇
		 * 編者:徐新院
		 * 時間;2015/10/16
		 * **/
	 
	 public static  String[] EditShangPinGuige(String guige){
		 String[] strarray3=null;
		if(DataTimeNumber.StringIndex(guige)==null){
            String[] strarray =DataTimeNumber.GetString_BigInterGuige(guige);
            String[] strarray2=DataTimeNumber.GetString_SmallInterGuige(strarray[0]);
             System.out.println(strarray2[0]);
             }else{
             strarray3=DataTimeNumber.StringIndex(guige);
             }
		return strarray3;
	}
	 
	 /**
	  * 功能：計算總的金額
	  * 時間：2015/11/14
	  * 編者：徐新院
	  * */
	 public static int Kucun(String[] kucun){
		int NumTatol=0;
		 int[] Ku=new int[kucun.length];
		 for(int i=0;i<kucun.length;i++){
			 Ku[i]=Integer.parseInt(kucun[i]);
			 NumTatol=NumTatol+Ku[i];
		 }
		return NumTatol;
	 }
	 
	 /**
	  * 功能：在分銷市場頁面distribution.jsp中根據商品售價和不同規格中最小價位的分銷價之差設定為此商品的利潤空間（即：平均利潤）
	  * 編者：徐新院
	  * 時間：2015/10/23
	  * **/
	 public static int AverageProfit(int CostPrice,String DistributionPrice){
		 int MinimumProfit=0;
		 String[] profitsArray=DataTimeNumber.GetStringModelValue(DistributionPrice);
		 int Array[]=new int[profitsArray.length];
			for(int i=0;i<profitsArray.length;i++){
				Array[i]=Integer.parseInt(profitsArray[i]);
			}
			MinimumProfit=DataTimeNumber.NumberSmall(Array);
			
		return (CostPrice-MinimumProfit);
	 }
	 /**
	  * 功能：根據數組中的數字判斷大小並且排序(獲取最小值)
	  * 編者：徐新院
	  * 時間：2015/10/23
	  * */
	 public static int NumberSmall(int[] Array){
		 int t;
		 for(int i=0;i<Array.length;i++)
		        for(int j=0;j<Array.length-1;j++)
		          { 
		            if(Array[j]>Array[j+1]) {
		            	t=Array[j];Array[j]=Array[j+1];Array[j+1]=t;
		            	}
		          }
		           return Array[0];
		 
	 }
	 /**
	  * 功能：根據數組中的數字判斷大小並且排序（獲取最大值）
	  * 編者：徐新院
	  * 時間：2015/10/31
	  * */
	 public static int NumberBig(int[] Array){
		 int t;
		 for(int i=0;i<Array.length;i++)
			 for(int j=0;j<Array.length-1;j++)
			 { 
				 if(Array[j]<Array[j+1]) {
					 t=Array[j];Array[j]=Array[j+1];Array[j+1]=t;
				 }
			 }
		 return Array[0];
		 
	 }
	 
	 /**
	  * 功能：去掉一個數組中重複數據
	  * 時間：2015/11/2
	  * 編者：徐新院
	  * */
	 public static List<String> RemoveReArray(String[] array){
	         List<String> list = new java.util.ArrayList<String>();
	         for (int i = 0; i < array.length; i++) {
	             if (!list.contains(array[i])) {//如果list数组不包括num[i]中的值的话，就返回true。
	                 list.add(array[i]); //在list数组中加入num[i]的值。已经过滤过。
	             }
	         }
		return list;
	 }
	 /**
	  * 功能：計算每個店鋪中的所有商品的售出總數量
	  * 時間：2015/11/2
	  * 編者：徐新院
	  * */
	 public static int TotalNumberSold(ArrayList<Integer> e){
		 int Total=0;
		for(int i=0;i<e.size();i++){
			Total=Total+e.get(i);
		}
		return Total;
	 }
	 /**
	  * 功能：獲取商品規格中的第一個規格（圖片色）
	  * 時間：2015/11/16
	  * 編者：徐新院
	  * **/
	 public static ArrayList<String>getGuigeFirst(String guige){
		 String[] strarray=null;
		 ArrayList<String>list=new ArrayList<String>();
		 String[] att=DataTimeNumber.GetStringModelValue(guige);
		 for(int i=0;i<att.length;i++){
			 
			 strarray=DataTimeNumber.GetString_SmallInterGuige(att[i]);
			 list.add(strarray[0]);
		 }
		return list;
	 }
	 /**
	  * 功能：在shopinindex.jsp頁面中，選擇購物物品是在彈出框中顯示商品的顏色規格和商品的尺碼規格：即：規格一
	  * 規格一：紅色，黑色，白色
	  * 規格二：37碼，38碼，39碼
	  * 時間：2015/11/14
	  * 編者：徐新院
	  * ***/
	 public static List<String> getGuigeOne(String guige){
		 String[] strarray=null;
		 ArrayList<Object>list=new ArrayList<Object>();
		 String[] att=DataTimeNumber.GetStringModelValue(guige);
		 for(int i=0;i<att.length;i++){
			 strarray=DataTimeNumber.GetString_SmallInterGuige(att[i]);
			 for(int j=0;j<strarray.length;j++){
				 list.add(strarray[0]);
			 }
		 }
		 
		 String[] ListArray=new String[list.size()];//顏色規格
		 for(int i=0;i<list.size();i++){
			 ListArray[i]=(String) list.get(i);
		 }
		 
		 List<String> listARR=DataTimeNumber.RemoveReArray(ListArray);
		 return listARR;
	 }
	
	 /**
	  * 功能：在shopinindex.jsp頁面中，選擇購物物品是在彈出框中顯示商品的顏色規格和商品的尺碼規格：即：規格二
	  * 規格一：紅色，黑色，白色
	  * 規格二：37碼，38碼，39碼
	  * 時間：2015/11/14
	  * 編者：徐新院
	  * ***/
	 public static List<String> getGuigeTwo(String guige){
		 String[] strarray=null;
		 ArrayList<Object>list2=new ArrayList<Object>();
		 String[] att=DataTimeNumber.GetStringModelValue(guige);
		 for(int i=0;i<att.length;i++){
			 strarray=DataTimeNumber.GetString_SmallInterGuige(att[i]);
			 if(strarray.length!=1&&!strarray[0].equals("")){
				 for(int j=0;j<strarray.length;j++){
					 list2.add(strarray[1]);
				 }
			 }
		 }
		 
		 String[] ListArray2=new String[list2.size()];//尺碼規格
		 for(int i=0;i<list2.size();i++){
			 ListArray2[i]=(String) list2.get(i);
		 }
		 
		 List<String> listARR=DataTimeNumber.RemoveReArray(ListArray2);
		 return listARR;
	 }
    	 
	 /**
	  * 功能：把shangpincart表中的sStandard中的||替換成逗號的形式顯示在cart.jsp頁面中
	  * 時間：2015/11/19
	  * 編者：徐新院
	  * **/
	 public static String getReplace(String replace){
		 String newStr = replace.replaceAll("\\|","  ");
		return newStr;
	 }
	 
	 public static void main(String[] args) {
		 List<String> list=DataTimeNumber.getGuigeOne("1231,45646,78798");
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i));
		}
	}
	 
	 
}