package univ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StudentDatabaseCP {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public StudentDatabaseCP(){
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void connection() {
		try {
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void disConnection() {
		if(pstmt != null)
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		if(conn != null)
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
	
	// 게시판의 모든 레코드를 반환하는 메소드
	public ArrayList<StudentEntity> getStudentList(){
		connection();
		
		ArrayList<StudentEntity> list = new ArrayList<>();
		
		String SQL = "SELECT * FROM student";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				// 한 행의 학생 정보를 저장할 자바빈즈 객체 생성
				StudentEntity stu = new StudentEntity();
				
				// 한 행의 정보를 자바빈즈에 저장				
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
				
				list.add(stu);
			}
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
}
