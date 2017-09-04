package com.kosmo.athi.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

public class MemberDAO { 

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	/*
	 * Spring JDBC 템플릿 사용
	 */
	JdbcTemplate template;

	// 생성자메소드 : DB연결
	public MemberDAO() {
		try {
			// 커넥션 풀 사용
			Context ctx = new InitialContext();
			DataSource source = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
			conn = source.getConnection();

			// Spring JDBC 템플릿 사용
			this.template = Constant.template;

			System.out.println("DB연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 실패");
		}
	}

	// 자원해제
	public void close() {
		try {
			if (conn != null)
				conn.close();
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//전체 회원 레코드 가져오기
	public ArrayList<MemberDTO> getTotalMemberRecord() {
		
		String sql = "SELECT * FROM member m JOIN member_grade mg ON m.id=mg.id";
		
		return (ArrayList<MemberDTO>) template.query(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
	}	
	
	//회원가입
	public int signUp(MemberDTO dto) {
		int retVal = 0;
		try {
			//인자 순서 : id, pass, name, address, email, birthday, gender, phone, regidate, grade, report_cnt, exp
			String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getEmail());
			psmt.setDate(6, (java.sql.Date)dto.getBirthday());
			psmt.setString(7, dto.getGender());
			psmt.setString(8, dto.getPhone());			
			
			retVal = psmt.executeUpdate();
			
			if(retVal==1){
				String sql2 = "INSERT INTO member_grade VALUES(?, 1, 0, 0)";
				psmt = conn.prepareStatement(sql2);
				psmt.setString(1, dto.getId());
				
				retVal += psmt.executeUpdate();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return retVal;
	}
	
	//회원 삭제
	public int secession(String id) {
		int rs = 0;
		
		try {
			String sql = "DELETE FROM member WHERE id=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//회원정보수정
	public int modifyInfo(MemberDTO dto) {
		int rs = 0;
		
		try {
			String sql = "UPDATE member SET pass=?, name=?, address=?, email=?, birthday=?, phone=?, gender=? WHERE id=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getAddress());
			psmt.setString(4, dto.getEmail());
			psmt.setDate(5, (java.sql.Date)dto.getBirthday());
			psmt.setString(6, dto.getPhone());
			psmt.setString(7, dto.getGender());
			psmt.setString(8, dto.getId());
			
			rs = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	// 관리자 모드에서 회원정보 불러오기
	public ArrayList<MemberDTO> selectMember(String id){
		
		String sql = "SELECT b.* FROM member b join member_grade bg on b.id=bg.id WHERE b.id='"+id+"'";
		
		return (ArrayList<MemberDTO>)template.query(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
	}
	
	//회원정보수정을 위한 회원 데이터 가져오기
	public ArrayList<MemberDTO> selectMember(String id, String pass){
		
		String sql = "SELECT b.* FROM member b join member_grade bg on b.id=bg.id WHERE b.id='"+id+"' AND b.pass='"+pass+"'";
		
		return (ArrayList<MemberDTO>)template.query(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
	}
	
	// 로그인 처리를 위한 함수
	public boolean isMember(String id, String pass){
		
		boolean isFlag = false;
		
		String sql = "SELECT * FROM member m join member_grade mg on m.id=mg.id WHERE m.id=? AND m.pass=?";
		
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				isFlag = true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return isFlag;
	}
	
	// 중복체크 함수(오버로딩)
	public boolean isMember(String id){
		
		boolean isFlag = false;
		
		String sql = "SELECT * FROM member m join member_grade mg on m.id=mg.id WHERE m.id=?";
		
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				isFlag = true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return isFlag;
	}
	
	public int deleteMember(final String id, final String pass){
		
		int retval = deleteMember2(id);
		int retValue = 0;
		
		if(retval==1){
		String dbQuery2 = "DELETE FROM member WHERE id=? AND pass=?";
		
		retValue = this.template.update(dbQuery2, new PreparedStatementSetter() {
			
				@Override
				public void setValues(PreparedStatement psmt) throws SQLException {
				
					psmt.setString(1, id);
					psmt.setString(2, pass);
				}
			});
		}
		
		return retValue;
	}
	
	public int deleteMember2(final String id){
		
		String dbQuery1 = "DELETE FROM member_grade WHERE id=?";
		
		return this.template.update(dbQuery1, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement psmt) throws SQLException {
				psmt.setString(1, id);
			}
		});
	}

	public ArrayList<MemberDTO> rankList(){
		
	    String sql ="SELECT * FROM (" +
	        " SELECT Tb.*, rownum rNum FROM(" + 
	        "   SELECT m.*, mg.grade, ROW_NUMBER() OVER(ORDER BY mg.grade DESC, mg.exp DESC) FROM member m join member_grade mg on m.id = mg.id WHERE m.id!='athi'"
	        +" ) Tb ) WHERE rNum BETWEEN 1 AND 3";
		
		return (ArrayList<MemberDTO>)this.template.query(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
	}
}