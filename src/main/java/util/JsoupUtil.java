package util;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupUtil {

	 //中华英才网
	 static String url="http://www.chinahr.com/sou/?utm_source=sem-baidu-pc&spm=28294241367.8938432036&utm_campaign=sell&utm_medium=cpc"; 
	 //海投网 (宣讲会资源)
	 static String url2 = "http://xjh.haitou.cc/"; 
	 //拉勾网
	 static String url3 = "http://www.lagou.com/?utm_source=AD__baidu_pinzhuan&utm_medium=sem&utm_campaign=SEM"; 
	 //实习僧
	 static String url4 = "http://www.shixiseng.com/";
	 
	 public static List<String> jsoupSearch(String param) throws IOException {
	        Document doc = Jsoup.connect(url3).get();
	        Elements links = doc.select("a[href]");
	        Elements media = doc.select("[src]");
	        Elements imports = doc.select("link[href]");
	        StringBuffer sb = new StringBuffer();
	     
	        List<String> lists = new ArrayList<String>();
	        System.out.println(links.size());
	        for (Element link : links) {
	        	if(link.text().contains(param) ){
	        		lists.add("<a href='"+link.attr("abs:href")+"' >"+trim(link.text(), 35)+"</a>");
	        		System.out.println("<a href='"+link.attr("abs:href")+" '>"+trim(link.text(), 35)+" </a>");
	        	}
	        }
	       
			return lists;
	    }
	 
		 public static void main(String args[]) throws Exception {
			 	System.out.println(jsoupSearch("公司"));
		 }
		 
		 private static void print(String msg, Object... args) {
		        System.out.println(String.format(msg, args));
		 }
	
	     private static String trim(String s, int width) {
	        if (s.length() > width)
	            return s.substring(0, width-1) + ".";
	        else
	            return s;
	     }
	}
