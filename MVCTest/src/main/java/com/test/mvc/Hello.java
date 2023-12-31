package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//서블릿 호출
		//업무 처리
		
		//HTML페이지 생산 -> 불편;; > JSP 위임
//		resp.sendRedirect("/mvc/hello.jsp");
		
		//DB작업 -> select count(*)
		int count = 100;
		
		//서블릿 -> 자신의 업무 완료 -> 산출물 일부 -> 출력 -> JSP페이지 전달
		req.setAttribute("count", count);
		
//		resp.sendRedirect("/mvc/hello.jsp");
//		pageContext.forward("/mvc/hello.jsp");
		
		// '/' -> webapp폴더를 의미함
		// 경로 지정 시 '/' 를 먼저 작성해야함.
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/helo.jsp");
		dispatcher.forward(req, resp);

	}
	
}
