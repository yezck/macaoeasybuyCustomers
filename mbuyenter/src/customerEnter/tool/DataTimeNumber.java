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
		Calendar c = Calendar.getInstance();//���Զ�ÿ��ʱ���򵥶��޸�
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH); 
		int NowTime=year;
		
		if(encoding == null || encoding.equals("")){
		    throw new Exception("�ַ����벻��Ϊ��");
		   }
		   if(content == null){
		    throw new Exception("�ַ������ݲ���Ϊ��");
		   }
		   if(size<0){
		    throw new Exception("��ȡ���ֽ�������С��0");
		   }
		   if(content.getBytes().length < size){
		    size = content.getBytes().length;
		   }
		   ByteArrayOutputStream out = new ByteArrayOutputStream();
		   int index = 0; //�ַ������ַ�λ��
		   int count = 0; //Ŀǰ���ֽ���
		   while(count < size){
		    //��ǰ���ֽ���Ŀ
		    count += content.substring(index, index+1).getBytes(encoding).length;
		    if(count<=size){
		      out.write(content.substring(index, index+1).getBytes(encoding));
		    }
		    index++;
		   }
		   String result = new String(out.toByteArray(),encoding);
		  // int Result=Integer.parseInt(result);//��������
		   out.close();
		//   return NowTime-Result;
		      return result;
		}
	
	
	/*
	 * ������ݺ�Ա�������Զ�����Ա���˺�
	 * */
	 public static String randomAccount(int Num){
		 Calendar c = Calendar.getInstance();//���Զ�ÿ��ʱ���򵥶��޸�
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
		 * ������ݺ�Ա�������Զ����ɹ�Ӧ���˺�
		 * */
		 public static String randomSupplierAccount(int Num){
			 Calendar c = Calendar.getInstance();//���Զ�ÿ��ʱ���򵥶��޸�
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
	  * ���ܣ����ɱ��
	  * ���ߣ�����Ժ
	  * ʱ�䣺2015/8/18
	  * */
	 public static String LogNumber(int num){
		 
		 Calendar c = Calendar.getInstance();//���Զ�ÿ��ʱ���򵥶��޸�
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
	  * ���ܣ���ȡϵͳ�ĵ�ǰʱ��
	  * ���ߣ�����Ժ
	  * ʱ�䣺2015/8/29
	  * */
	 public static String Time(){
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//���Է�����޸����ڸ�ʽ
		 Date now = new Date(); 

		 String hehe = dateFormat.format( now ); 
		return hehe; 
		    }
	 
	 
	 /**
	  * ���ܣ���ȡ���ݿ�����Ʒ�Ĺ��GetString_BigInterGuige��GetString_SmallInterGuige���ʹ��
	  * ���ߣ�����Ժ
	  * ʱ�䣺2015/8/29
	  * */
	 public static String[] GetString_BigInterGuige(String str){
		 //String str="192.168.0.1"; 
		 //String str=" ��ɫ|37�a|,��ɫ|38�a|,��ɫ|39�a|,��ɫ|40�a|,��ɫ|41�a|"; 
	      String[] strarray=str.split("\\|,"); 
		return strarray; 
	 }
	 
	 
	 public static String[] GetString_SmallInterGuige(String str){
		 //String str="192.168.0.1"; 
		// String str=" ��ɫ|37�a|,��ɫ|38�a|,��ɫ|39�a|,��ɫ|40�a|,��ɫ|41�a|"; 
	      String[] strarray=str.split("\\|"); 
		return strarray; 
	 }
	 public static String[] GetString_Guige(String str){
		 String[] strarray=str.split("\\|",3); 
		 return strarray; 
	 }
	 
	 
	 public static String[] GetString(String str){
		 //String str="192.168.0.1"; 
		// String str=" ��ɫ|37�a|,��ɫ|38�a|,��ɫ|39�a|,��ɫ|40�a|,��ɫ|41�a|"; 
	      String[] strarray=str.split("\\u000a"); 
		return strarray; 
	 }
	 
	 public static String[] GetString_SmallInterGuigeSe(String str){
		 //String str="192.168.0.1"; 
		// String str=" ��ɫ|37�a|,��ɫ|38�a|,��ɫ|39�a|,��ɫ|40�a|,��ɫ|41�a|"; 
	      String[] strarray=str.split("\\||,"); 
		return strarray; 
	 }
	 /**
	  * ���ܣ���ȡ���ݿ�����Ʒ���ۼ�
	  * ���ߣ�����Ժ
	  * ʱ�䣺2015/8/29
	  * */
	 
	 public static  String[] GetString_Price(String str){
		 String[] strarray=str.split("\\,"); 
	  return strarray; 
	 }
	 
	 
	
	 
	 public static String[] StringIndex(String str){
		 String[] strarray=null,strarray4=null;
		 int sa=str.indexOf("||");
		 if(sa>0){//��ʾ��||
			 String[] strarray2 =GetString_SmallInterGuigeSe(str);
			 strarray=strarray2;
		 }else{
			return null;
		 }
		   return strarray;
}
	 
	 /**���ܣ���ȡ��Ʒ�������
	  *    ʱ�䣺2015/9/1 
	  *    ���ߣ�����Ժ
	  * 
	  * **/
	 public static String[] StringInventory(String str){
		 String[] strarray=str.split("\\,"); 
		 return strarray;
	 }
	 
	 
	 /**���ܣ���Model���еĔ�����ȡ�󱣴��ڔ��M��
	  * �r�g��2015/10/7
	  * ���ߣ�����Ժ
	  * */
	 public static String[] GetStringModelValue(String str){
		 //String str="�tɫ  ��ɫ  �Sɫ  �Gɫ  ��ɫ  ��ɫ  �{ɫ  ��ɫ  ��ɫ  ��ɫ  ��ɫ  ��ɫ  ��ɫ  ��ɫ  �ҾG  ���{  �ҷ�  ����ɫ  �ۼtɫ  �DƬɫ";
	      String[] strarray=str.split("\\,"); 
		return strarray; 
	 }
	 public static String[] GetStringMValue(String str){
		 String[] strarray=str.split("\\  "); 
		 return strarray; 
	 }
	 
	 
	 
	 /****
	  * ���ܣ���Ʒ��݋������ƷҎ��Ҫ�@ȡ�������е�Ҏ����Ϣ��
		 * �K�ҷָ��в�ͬ���ַ����M����������x��
		 * ����:����Ժ
		 * �r�g;2015/10/16
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
	  * ���ܣ��ڷ��N�Ј����distribution.jsp�и�����Ʒ�ۃr�Ͳ�ͬҎ������С�rλ�ķ��N�r֮���O�������Ʒ���������g������ƽ��������
	  * ���ߣ�����Ժ
	  * �r�g��2015/10/23
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
	  * ���ܣ��������M�еĔ����Д��С�K������(�@ȡ��Сֵ)
	  * ���ߣ�����Ժ
	  * �r�g��2015/10/23
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
	  * ���ܣ��������M�еĔ����Д��С�K�����򣨫@ȡ���ֵ��
	  * ���ߣ�����Ժ
	  * �r�g��2015/10/31
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
	  * ���ܣ�ȥ��һ�����M�����}����
	  * �r�g��2015/11/2
	  * ���ߣ�����Ժ
	  * */
	 public static List<String> RemoveReArray(String[] array){
	         List<String> list = new java.util.ArrayList<String>();
	         for (int i = 0; i < array.length; i++) {
	             if (!list.contains(array[i])) {//���list���鲻����num[i]�е�ֵ�Ļ����ͷ���true��
	                 list.add(array[i]); //��list�����м���num[i]��ֵ���Ѿ����˹���
	             }
	         }
		return list;
	 }
	 /**
	  * ���ܣ�Ӌ��ÿ������е�������Ʒ���۳�������
	  * �r�g��2015/11/2
	  * ���ߣ�����Ժ
	  * */
	 public static int TotalNumberSold(ArrayList<Integer> e){
		 int Total=0;
		for(int i=0;i<e.size();i++){
			Total=Total+e.get(i);
		}
		return Total;
	 }
	 
	 
	 public static void main(String[] args) {
		
	}
	 
	 
}