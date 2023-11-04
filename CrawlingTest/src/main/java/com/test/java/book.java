package com.test.java;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class book {

	public static void main(String[] args) {
		
		try {
			String url = "https://www.yes24.com/24/Category/More/001001003?ElemNo=91&ElemSeq=1";
			Document doc = Jsoup.connect(url).get();
//			System.out.println(doc.html());						//사이트 전체
			
			Elements list = doc.select("#category_layout > ul > li:nth-child(1) > div > div.goods_info > div.goods_name > a:nth-child(2)");
			
			System.out.println(list.html());
//			
////			System.out.println(list.size());					//개수
//			
//			for(Element movie : list) {
//				//책제목 
//				Element title = movie.selectFirst("ul > li:nth-child(1) > div > div.goods_info > div.goods_name > a:nth-child(2)");
//				System.out.println(title.text());
//
//				//가격 
//				Element date = movie.selectFirst("#category_layout > ul > li:nth-child(1) > div > div.goods_info > div.goods_price > em.yes_b");
//				System.out.println(date.text());
//				
//				//출판사 
//				Element count = movie.selectFirst("#category_layout > ul > li:nth-child(1) > div > div.goods_info > div.goods_pubGrp > span.goods_auth > a");
//				System.out.println(count.nextSibling());
//				
//				//책 표지 
//				Element poster = movie.selectFirst("#category_layout > ul > li:nth-child(1) > div > p > span > span > a > img");
//				if(poster != null) {
//					System.out.println(poster.attr("src"));				
//					getImage(poster.attr("src"), title.text());
//					
//					//Thread.sleep(2000);	//여기서 잠시 멈춤
//				}
//				
//			}
			
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
			out = new FileOutputStream("/Users/hyunbin/Pictures/cover" + fileName + ".png");		//파일 저장하기
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
