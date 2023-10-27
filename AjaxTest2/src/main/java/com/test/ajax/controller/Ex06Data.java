package com.test.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.ajax.respository.AjaxDAO;

@WebServlet("/ex06data.do")
public class Ex06Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex06Data.java
		//1. 데이터 가자ㅕ오기(id)
		//2. DB작업 -> 중복체크
		//3. 결과 반환
		
		//1.
		String id = req.getParameter("id");
		
		//2.
		AjaxDAO dao = new AjaxDAO();
		int result = dao.check(id);		//가능(0), 불가능(1)
		
		/*
			{
				result: 0
			}
		*/
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{ \"result\" : %d }", result);
		
		writer.close();
	}

}