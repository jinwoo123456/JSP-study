package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
    // 멤버 변수: DB 연결, 정적 쿼리 실행, 동적 쿼리 실행, SELECT 결과 반환
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    // 기본 생성자: 매개변수가 없는 생성자
    public JDBConnect() {
        try {
            // 오라클 드라이버를 메모리에 로드
            Class.forName("oracle.jdbc.OracleDriver");
            // 커넥션 URL 생성
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            // 계정의 ID와 비밀번호 설정
            String id = "education";
            String pwd = "1234";
            // DB 연결 시도 및 커넥션 객체 생성
            con = DriverManager.getConnection(url, id, pwd);
            // 연결 성공 메시지 출력
            System.out.println("DB 연결 성공 (기본 생성자)");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("연결 실패");
        }
    }

    // 인자 생성자1: 4개의 매개변수를 받는 생성자
    public JDBConnect(String driver, String url, String id, String pwd) {
        try {
            // 지정된 드라이버를 로드
            Class.forName(driver);
            // DB 연결
            con = DriverManager.getConnection(url, id, pwd);
            System.out.println("DB 연결 성공 (인수 생성자 1)");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("연결 실패");
        }
    }

    // 인자 생성자2: ServletContext를 통해 초기화 파라미터를 받아오는 생성자
    public JDBConnect(ServletContext application) {
        try {
            // web.xml에서 초기화 파라미터를 읽어옴
            String driver = application.getInitParameter("OracleDriver");
            String url = application.getInitParameter("OracleURL");
            String id = application.getInitParameter("OracleId");
            String pwd = application.getInitParameter("OraclePwd");
            // 드라이버 로드
            Class.forName(driver);
            // DB 연결
            con = DriverManager.getConnection(url, id, pwd);
            System.out.println("DB 연결 성공 (인수 생성자 2)");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("연결 실패 3");
        }
    }

    // 자원 해제 메서드
    public void close() {
        try {
            // ResultSet 객체 해제
            if (rs != null) rs.close();
            // Statement 객체 해제
            if (stmt != null) stmt.close();
            // PreparedStatement 객체 해제
            if (psmt != null) psmt.close();
            // Connection 객체 해제
            if (con != null) con.close();
            System.out.println("JDBC 자원 해제");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("연결 실패 2");
        }
    }
}
