package customerEnter.tool;


/**
 * �f��������class �ļ�����һ�����ּӜpģ�K
 * �r�g��2015/11/16
 * ���ߣ�����Ժ
 * **/
public class Add_subtractClassJSP {

	
	
	public static String getCheckBox(String name){
		String str="<input type='checkbox' name='"+name+"' id='"+name+"Id' onclick='selectAllOrDisSelectAll();' class='checkbox'/>";
		
		return str;
	}
	
}
