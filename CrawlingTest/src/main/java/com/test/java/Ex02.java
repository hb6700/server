package com.test.java;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex02 {

	public static void main(String[] args) {
		
		try {
			String url = "https://movie.daum.net/ranking/boxoffice/yearly?date=2015";
			Document doc = Jsoup.connect(url).get();
//			System.out.println(doc.html());				//사이트 전체
			
			Elements list = doc.select(".item_poster");
//			System.out.println(list.size());					//개수
			
			for(Element movie : list) {
				//영화제목
				Element title = movie.selectFirst(".link_txt");
				System.out.println(title.text());

				//개봉일
				Element date = movie.selectFirst(".txt_num");
				System.out.println(date.text());
				
				//관객수
				Element count = movie.selectFirst(".screen_out");
				System.out.println(count.nextSibling());
				
				//포스터이미지(?)
				Element poster = movie.selectFirst(".img_thumb");
				if(poster != null) {
					System.out.println(poster.attr("src"));				
					getImage(poster.attr("src"), title.text());
					
					//Thread.sleep(2000);	//여기서 잠시 멈춤
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		getImage("");
		
	}

	private static void getImage(String imgUrl, String fileName) {
		URL url = null;
		InputStream in = null;
		OutputStream out = null;
		
		try {
			url = new URL(imgUrl);
			in = url.openStream();
			out = new FileOutputStream("C:\\class\\code\\server\\CrawlingTest\\poster\\" + fileName + ".png");		//파일 저장하기
			while(true) {
				int data = in.read();
				if(data == -1) break;
				out.write(data);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
