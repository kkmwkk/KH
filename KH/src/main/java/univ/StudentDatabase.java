package univ;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class StudentDatabase {
	
	// 테이블 STUDENT 데이터베이스 연동을 위한 자바빈즈 프로그램 
	
	
	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String JDBC_URL = "Jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "scott";
	private static final String PASSWD = "tiger";
	
	private Connection conn = null;
	private Statement stmt = null;
	
	
	// JDBC 드라이버 등록
	public StudentDatabase() {
		try {
			Class.forName(JDBC_DRIVER);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// Connection 객체 생성
	public void connect() {
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		}catch(Exception e){
			e.printStackTrace();		
		}
	}
	
	public void disConnect() {
		if(stmt != null) {
			try {
				stmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 모든 레코드를 반환하는 메소드
	
	public ArrayList<StudentEntity> getStudentList(){
		
		connect();
		
		// 질의 결고리를 저장한 ArrayList 객체 생성
		
		ArrayList<StudentEntity> list = new ArrayList<>();
		
		String SQL = "SELECT * FROM student";
		
		try {
			// statement객체 생성
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
			// ResultSet의 모든 행을 각각의 StudentEntity에 저장
			
			while(rs.next()) {
				// 한 학생의 정보를 저장할 빈즈 객체 생성
				StudentEntity stu = new StudentEntity();
				
				// 자바 빈즈 객체에 저장
				stu.setId(rs.getString("id"));
				stu.setPasswd(rs.getString("passwd"));
				stu.setName(rs.getString("name"));
				stu.setYear(rs.getInt("year"));
				stu.setSnum(rs.getString("snum"));
				stu.setDepart(rs.getString("depart"));
				stu.setMobile1(rs.getString("mobile1"));
				stu.setMobile2(rs.getString("mobile2"));
				stu.setAddress(rs.getString("address"));
				stu.setEmail(rs.getString("email"));
				
				//ArrayList의 학생정보를 StudentEntity에 추가
				list.add(stu);
			}
			
			rs.close();		
		}catch(Exception e) {
			
		}finally {
			disConnect();
		}
		
		//완성된 ArrayList 객체를 반환
		
		return list;
	}

}
