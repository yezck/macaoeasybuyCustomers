package customerEnter.tool;

import java.io.ByteArrayOutputStream;
import java.util.Calendar;

public class AllTollClass {

	
	
	public static String getSubString(String content, int size, String encoding) throws Exception{
		
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
		      out.write(content.substring(index, index+1).getBytes());
		    }
		    index++;
		   }
		   String result = new String(out.toByteArray(),encoding);
		   System.out.println(result);
		   out.close();
		      return result;
		}
	
	
	public static void main(String[] args) {
		try {
			AllTollClass.getSubString("我的名字是什麼", 2, "GBK");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
