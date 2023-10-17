package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02_Receive extends HttpServlet{

	//서블릿 요청 메소드
	//1. doGet() : get방식요청
	//2. doPost() : post방식요청
	
//	doGet
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수신
		//<input type="text" name="name">
		//<input type="text" name="age">
		
		//HttpServlet Request req
		//데이터를 수신하는 담당자 역할
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		
		System.out.println(name);
		System.out.println(age);
		
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.println("<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "<head>\r\n"
				+ "<meta charset=\"UTF-8\">\r\n"
				+ "<title>title</title>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "	<h1>데이터 수신</h1>\r\n"
				+ "	<p>데이터 처리가 완료되었습니다.</p>\r\n"
				+ "</body>\r\n"
				+ "</html>");
	}
	

}
