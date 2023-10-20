package com.test.jdbc;

import java.sql.Connection;

public class Ex02 {
	public static void main(String[] args) {
		
		//1. DB연결
		//2. DB연결 확인
		//3. DB연결 종료
		
		Connection conn = null;
		
		try {
			conn = DBUtil.open();
			System.out.println(conn.isClosed());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main
	
}
