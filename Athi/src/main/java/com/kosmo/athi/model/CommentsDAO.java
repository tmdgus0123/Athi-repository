package com.kosmo.athi.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class CommentsDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	/*
	 * Spring JDBC 템플릿 사용
	 */
	JdbcTemplate template;

	// 생성자메소드 : DB연결
	public CommentsDAO() {
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
	
	//전체 댓글 가져오기
	public ArrayList<CommentsDTO> getAllComments(String board_num) {

		String sql = "SELECT * FROM comments WHERE board_num="+ board_num +"ORDER BY num ASC";

		return (ArrayList<CommentsDTO>) template.query(sql, new BeanPropertyRowMapper<CommentsDTO>(CommentsDTO.class));
	}
	
	//전체 댓글 가져오기
	public ArrayList<CommentsDTO> proj_getAllComments(String board_num) {

		String sql = "SELECT * FROM proj_comments WHERE board_num="+ board_num +"ORDER BY num ASC";

		return (ArrayList<CommentsDTO>) template.query(sql, new BeanPropertyRowMapper<CommentsDTO>(CommentsDTO.class));
	}
	
	//댓글 DB등록
	public int enroll(String board_num, String id, String content) {
		int rs = 0;
		try {
			String sql = "INSERT INTO comments VALUES ( comments_seq.nextval, ?, sysdate, ?, ?, 0, 0, 0, 0)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, content);
			psmt.setString(3, board_num);
			
			rs = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//포트폴리오 댓글 DB등록
	public int proj_enroll(String board_num, String id, String content) {
		int rs = 0;
		try {
			String sql = "INSERT INTO proj_comments VALUES (proj_comments_seq.nextval, ?, sysdate, ?, ?, 0, 0, 0, 0)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, content);
			psmt.setString(3, board_num);
			
			rs = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//특정 인덱스의 댓글 가져오기
	public CommentsDTO getComments(String num) {
		
		String sql = "SELECT * FROM comments WHERE num="+ num;
		
		return (CommentsDTO)template.queryForObject(sql, new BeanPropertyRowMapper<CommentsDTO>(CommentsDTO.class));
	}
	
	//포트폴리오 특정 인덱스의 댓글 가져오기
	public CommentsDTO proj_getComments(String num) {
		
		String sql = "SELECT * FROM proj_comments WHERE num="+ num;
		
		return (CommentsDTO)template.queryForObject(sql, new BeanPropertyRowMapper<CommentsDTO>(CommentsDTO.class));
	}
	
	//가장 최근에 달린 댓글 가져오기
	public CommentsDTO getComments() {
		
		String sql = "SELECT * FROM comments WHERE num in (SELECT MAX(num) FROM comments)";
		
		return (CommentsDTO)template.queryForObject(sql, new BeanPropertyRowMapper<CommentsDTO>(CommentsDTO.class));
	}
	
	//포트폴리오 가장 최근에 달린 댓글 가져오기
	public CommentsDTO proj_getComments() {
		
		String sql = "SELECT * FROM proj_comments WHERE num in (SELECT MAX(num) FROM proj_comments)";
		
		return (CommentsDTO)template.queryForObject(sql, new BeanPropertyRowMapper<CommentsDTO>(CommentsDTO.class));
	}

	public int deleteComments(String num) {
		int rs = 0;
				
		try {
		String sql = "DELETE FROM comments WHERE num=?";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, num);
		
		rs = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public int proj_deleteComments(String num) {
		int rs = 0;
				
		try {
		String sql = "DELETE FROM proj_comments WHERE num=?";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, num);
		
		rs = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
