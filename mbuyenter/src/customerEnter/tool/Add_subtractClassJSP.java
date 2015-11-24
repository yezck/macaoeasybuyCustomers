package customerEnter.tool;


/**
 * 說明：根據class 文件生成一個數字加減模塊
 * 時間：2015/11/16
 * 編者：徐新院
 * **/
public class Add_subtractClassJSP {

	
	
	public static String getCheckBox(String name){
		String str="<input type='checkbox' name='"+name+"' id='"+name+"Id' onclick='selectAllOrDisSelectAll();' class='checkbox'/>";
		
		return str;
	}
	
}
