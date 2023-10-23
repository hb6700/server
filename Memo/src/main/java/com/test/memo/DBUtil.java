package com.test.memo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	//DB연결코드 모음
	private static Connection conn;
	
	public static Connection open() {
		
		//접속작업
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hr";
		String pw = "java1234";
		
		try {
			//드라이버 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//connection 객체 생성
			conn = DriverManager.getConnection(url, id, pw);
			
			//반환
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
		
	}
	
public static Connection open(String server, String id, String pw) {
		
		//접속작업
		String url = "jdbc:oracle:thin:@" + server + ":1521:xe";
		
		try {
			//드라이버 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//connection 객체 생성
			conn = DriverManager.getConnection(url, id, pw);
			
			//반환
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
		
	}
	
}
