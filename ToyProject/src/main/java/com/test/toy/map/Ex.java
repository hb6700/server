package com.test.toy.map;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/map/ex.do")
public class Ex extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex.java
		String no = req.getParameter("no");
		
		if(no.equals("03")) {
			//좌표 가져오기
			MapDAO dao = new MapDAO();
			ArrayList<MapDTO> list = dao.list();
			req.setAttribute("list", list);
		}
		
//		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/map/ex01.jsp");
		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/map/ex" + no + ".jsp");
//		RequestDispatcher dispacher = req.getRequestDispatcher("/WEB-INF/views/map/ex02.jsp");
		dispacher.forward(req, resp);

	}

}