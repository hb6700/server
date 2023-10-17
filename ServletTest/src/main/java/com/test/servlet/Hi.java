package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hi extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		Calendar now = Calendar.getInstance();
		
		writer.println("<!DOCTYPE html>\r\n"
				+ "		<html>\r\n"
				+ "		<head>\r\n"
				+ "		<meta charset=\"UTF-8\">\r\n"
				+ "		<title>hello</title>\r\n"
				+ "		</head>\r\n"
				+ "		<body>\r\n"
				+ "			<h1>HELLO</h1>\r\n"
				+ "			<p>안녕하세요</p>\r\n"
				+ "			<p id=\"time\">"
				+ 				String.format("%tT", now)
				+ "			</p>\r\n"
				+ "			<script>\r\n"
				+ "				document.getElementbyid('time').innerText = (new Date()).tolocaleTimeStiring();\r\n"
				+ "			</script>\r\n"
				+ "		</body>\r\n"
				+ "		</html>");
		
		writer.close();
	}

}




