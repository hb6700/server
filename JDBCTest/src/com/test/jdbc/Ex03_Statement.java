//Ex03_Statement.java
package com.test.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Ex03_Statement {

	public static void main(String[] args) {
		/*
			1. connection : 연결/종료 
		 	2. Statement : 모든 SQL을 실행하는 역할
		 	
		 	Statement의 종류
		 	1. Statement
		 		- 기본형
		 		- 매개변수 처리 귀찮음
		 		- 안정성 낮음 
		 		- 가독성 높음
		 	2. PreparedStatement
		 		- 개량형
		 		- 매개변수 처리 특화
		 		- 안정성 높음
		 		- 가독성 높음
		 	3. CallableStatement
		 		- 개량형
		 		- 프로시저 호출 전용
		*/
		
		//m1();		//insert
		//m2();		//update
		//m3();		//delete
		//m4();		//create
		//m5();		//insert -> scanner이용
		
		//select
		//m6();					//1. 단일값 반환 > 1행 1열
		//m7();					//2. 다중값 반환 > 1행 N열
		//m8();					//3. 다중값 반환 > N행 1열
		m9();					//4. 다중값 반환 > N행 N열
		
	}
	
	
	//4. 다중값 반환 > N행 N열
	private static void m9() {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.open();
			stat = conn.createStatement();
			
			String sql = "select * from tblAddress";
			
			rs = stat.executeQuery(sql);
			
			System.out.println("[번호]\t[이름]\t[나이]\t[주소]");
			while(rs.next()) {
				System.out.printf("%s\t%s\t%s\t%s\n", rs.getString("seq"), rs.getString("name"), rs.getString("age"), rs.getString("address"));
			}
			
			//자원해제
			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//3. 다중값 반환 > N행 1열
	private static void m8() {
		//주소록에 있는 연락처 가져오기...?
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.open();
			stat = conn.createStatement();
			
			String sql = "select name from tblAddress";
			
			rs = stat.executeQuery(sql);
			while(rs.next()) {
				System.out.println(rs.getString("name"));
			}
			
//			rs.next();
//			System.out.println(rs.getString("name"));
//			rs.next();
//			System.out.println(rs.getString("name"));
			
			//자원해제
			rs.close();
			stat.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//2. 다중값 반환 > 1행 N열
	private static void m7() {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("번호 : ");
		String seq = scan.nextLine();
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.open();
			stat = conn.createStatement();
			
			String sql = "select * from tblAddress where seq = " + seq;
			
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				System.out.println("번호 : " + rs.getString("seq"));
				System.out.println("이름 : " + rs.getString("name"));
				System.out.println("나이 : " + rs.getString("age"));
				System.out.println("성별 : " + rs.getString("gender"));
				System.out.println("주소 : " + rs.getString("address"));
				System.out.println("날짜 : " + rs.getString("regdate"));
			} else {
				System.out.printf("입력한 %s번의 데이터가 없습니다.\n", seq);
			}
			
			//자원해제
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//1. 단일값 반환 > 1행 1열
	private static void m6() {
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();
			
//			String sql = "select count(*) from tblAddress";
			String sql = "select count(*) as cnt from tblAddress";
			
			rs = stat.executeQuery(sql);
			
//			System.out.println(rs);
//			ResultSet -> Iterator, 향상된for문, 스트림, 커서
			rs.next();		//커서 1줄 전진
			
			//현재 커서가 가르키고 있는 레코드의 원하는 컬럼을 접근 -> 데이터
//			int count = rs.getInt(1);					//컬럼 위치(index)
			int count = rs.getInt("cnt");			//컬럼명
			
			System.out.println(count);
			
			//자원해제
			rs.close();
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//INSERT
		private static void m5() { 
			//새로운 사람 등록하기
			Scanner scan = new Scanner(System.in);
			String name ="";
			String age ="";
			String gender ="";
			String address ="";
			
			Connection conn = null;
			Statement stat = null;
			
			try {
				
				System.out.print("이름 : ");
				name = scan.nextLine();
				System.out.print("나이 : ");
				age = scan.nextLine();
				System.out.print("성별(m/f) : ");
				gender = scan.nextLine();
				System.out.print("주소 : ");
				address = scan.nextLine();
				
				conn = DBUtil.open();
				if(!conn.isClosed()) {
					System.out.println("DB접속 성공");

					String sql = String.format(" insert into tblAddress (seq, name, age, gender, address, regdate) values(seqAddress.nextVal, '%s', '%s', '%s', '%s', default)", name, age, gender, address);
					
					stat = conn.createStatement();
					
					int result = stat.executeUpdate(sql);
						if(result == 1) {
							System.out.println("삽입 성공");
						} else {
							System.out.println("삽입 실패");						
						}
						
						stat.close();
						conn.close();
					
				} else {
					System.out.println("DB접속 실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	
	//CREATE
	private static void m4() {
		//반환값X  > create
		Connection conn = null;
		Statement stat = null;
		
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();		
			
			//수정되어지는 부분
			String sql = "create table tblAddress(\r\n"
					+ "    seq number primary key,\r\n"
					+ "    name varchar2(30) not null,\r\n"
					+ "    age number not null,\r\n"
					+ "    gender char(1) not null,\r\n"
					+ "    address varchar2(300) not null,\r\n"
					+ "    regdate date default sysdate not null)";
			
			//무조건 0이 됨
			int result = stat.executeUpdate(sql);
			
			//의미가 없는 부분
			if(result > 0) {
				System.out.println("삭제 성공");
			} else {						
				System.out.println("삭제 실패");
			}
			
			stat.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//DELETE
	private static void m3() {
		Connection conn = null;
		Statement stat = null;
		
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();		
			
			String sql = "delete from tblAddress where seq = 1";
			
			int result = stat.executeUpdate(sql);
			
			if(result > 0) {
				System.out.println("삭제 성공");
			} else {						
				System.out.println("삭제 실패");
			}
			
			stat.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//UPDATE
	private static void m2() {
		Connection conn = null;
		Statement stat = null;
		
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();		
			
			String sql = "update tblAddress set age = age + 1";
			
			int result = stat.executeUpdate(sql);
			
			if(result > 0) {
				System.out.println("수정 성공");
			} else {						
				System.out.println("수정 실패");
			}
			
			stat.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//INSERT
	private static void m1() { 
		//반환값 X > insert 실행
		Connection conn = null;
		Statement stat = null;
		
		try {
			conn = DBUtil.open();
			if(!conn.isClosed()) {
				System.out.println("DB접속 성공");
				
				//SQL실행 > 자바 : SQL모름 -> SQL을 문자열로 취급
				//서블릿(자바) -> HTML, CSS, JavaScript -> "<html>"
				//String sql = "insert into tblAddress";
				
				//ORA-00911: invalid character -> 밑의 문장 맨 마지막 세미콜론 없애야
				String sql = " insert into tblAddress (seq, name, age, gender, address, regdate) values(seqAddress.nextVal, '아무개', 22, 'm', '서울시 강남구 대치동', default)";
				
				//stat > SQL 실행하는 역할
				stat = conn.createStatement();
				
				//1. 반환값이 없는 쿼리 : select제외 나머지 전부
				//int stat.executeUpdate(String sql)
				//2. 반환값이 있는 쿼리 : select
				//ResultSet stat.executeQuery(String sql)
				
				//SQL Developer > ctrl+enter(실행)과 동일
				//적용된 행의 개수
				int result = stat.executeUpdate(sql);
					if(result == 1) {
						System.out.println("삽입 성공");
					} else {
						System.out.println("삽입 실패");						
					}
					
					//자원해제(정리_
					stat.close();
					conn.close();
				
			} else {
				System.out.println("DB접속 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
