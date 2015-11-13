package customerEnter.tool;

import java.io.ByteArrayOutputStream;
import java.util.Calendar;

public class AllTollClass {

	
	
	public static String getSubString(String content, int size, String encoding) throws Exception{
		
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
			AllTollClass.getSubString("�ҵ�������ʲ�N", 2, "GBK");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
