package com.Disney.common;
/*
 * ***************************************
 * @source : DBManager.java
 * @descripsion : connection 객체를 취득, 사용이 끝난 자원을 해제하는 클래스 
 * ***************************************
 *  DATE              AUTHOR                DESCRIPTION
 *  **************************************
 *  2018/07/16          최초롱                            최초작성 
 */
import java.sql.*;

//공통으로 사용하니까 common으로 package생성 
//싱글톤 패턴을 활용한 공유 방법 
public class DBManager {
	// 프레임 워크 -> 개발자가 개발을 하기 쉽게 도와주는 도구

	// 인스턴스의 주소를 저장하기 위한 참조 변수
	private static Connection conn;
	// Connection 관련 정보 상수
	private final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private final static String USER = "java";
	private final static String PASS = "1234";

	// 생성자를 private으로만들어 은닉화 시킨다
	// =>외부에서 인스턴스를 생성하지 못하도록 선언
	// =>이유:공유해서 사용하려고 하는데 다른 개발자가 객체생성해서 사용하면 공유의 의미 없은
	// (사용자의 실수를 막는 용도 )
	private DBManager() {

	}

	// 인스턴스를 생성 또는 기존 인스턴스를 반환하는
	public static Connection getConnection() {
		conn = null;
		if (conn == null) {
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USER, PASS);
			} catch (Exception e) {

			}
		}
		return conn;
	}

	// selcet 수행 후 자원해제 위한 메소드
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// insert, delete , update 수행후 자원해제위한 메소드
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {

			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}