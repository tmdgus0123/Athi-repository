package com.kosmo.athi.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

public class BoardDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	/*
	 * Spring JDBC 템플릿 사용
	 */
	JdbcTemplate template;

	// 생성자메소드 : DB연결
	public BoardDAO() {
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

	public int getTotalCount(Map<String, Object> map, String category) {
		int totalRecord = 0;

		String boardName = (String) map.get("boardName");

		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");

		try {
			String sql = "SELECT count(*) FROM board b JOIN board_type bt ON b.num = bt.num";
			if (boardName != null) {
				sql += " WHERE board_name='" + boardName + "'";
			}
			if (category != null) {
				sql += " AND p_language='" + category + "'";
			}
			if (searchColumn != null && searchWord != null) {
				sql += " AND " + searchColumn + " like '%" + searchWord + "%'";
			}
			/*
			 * 검색어가 있을 경우 검색조건을 쿼리에 추가해야함 where 컬럼 like '%검색어%'
			 */
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalRecord = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalRecord;
	}

	// 전체 레코드 수 불러오기
	public int getTotalCount(Map<String, Object> map) {
		int totalRecord = 0;

		String boardName = (String) map.get("boardName");

		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");

		try {
			String sql = "SELECT count(*) FROM board b JOIN board_type bt ON b.num = bt.num";
			if (boardName != null) {
				sql += " WHERE board_name ='" + boardName + "' ";
			}
			if (searchColumn != null && searchWord != null) {
				sql += " AND " + searchColumn + " like '%" + searchWord + "%'";
			}
			/*
			 * 검색어가 있을 경우 검색조건을 쿼리에 추가해야함 where 컬럼 like '%검색어%'
			 */
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalRecord = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalRecord;
	}

	public int myPageGetTotalCount(Map<String, Object> map) {
		int myPagetotalRecord = 0;

		String id = (String) map.get("id");
		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");
		System.out.println("DAO 아이디 " + id);

		try {
			String sql = "SELECT count(*) FROM board b JOIN board_type bt ON b.num = bt.num where id ='" + id + "'";

			if (searchColumn != null && searchWord != null) {
				sql += " AND " + searchColumn + " like '%" + searchWord + "%'";
			}
			/*
			 * 검색어가 있을 경우 검색조건을 쿼리에 추가해야함 where 컬럼 like '%검색어%'
			 */

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			myPagetotalRecord = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return myPagetotalRecord;
	}
	
	public int portfolioGetTotalCount(Map<String, Object> map) {
		int totalRecord = 0;

		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");

		try {
			String sql = "select count(*) from project_board num";
			if (searchColumn != null && searchWord != null) {
				sql += " AND " + searchColumn + " like '%" + searchWord + "%'";
			}

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalRecord = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalRecord;
	}
	
	public int myPortfolioGetTotalCount(Map<String, Object> map) {
		int totalRecord = 0;
		
		String id = (String) map.get("id");
		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");

		try {
			String sql = "select count(*) from project_board num where id ='" + id + "'";
			if (searchColumn != null && searchWord != null) {
				sql += " AND " + searchColumn + " like '%" + searchWord + "%'";
			}

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalRecord = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalRecord;
	}

	// 게시판 목록 불러오기
	public ArrayList<BoardDTO> boardList(Map<String, Object> map) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		String boardName = (String) map.get("boardName");

		String category = (String) map.get("category");
		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");

		String sql = "SELECT * FROM ( SELECT Tb.*, rownum rNum FROM ( " + " SELECT * FROM board b JOIN board_type bt ON b.num = bt.num ";
		if (boardName != null) {
			sql += " WHERE board_name = '" + boardName + "' ";
		}
		if (category != null) {
			sql += " AND p_language='" + category + "'";
		}
		if (searchWord != null) {
			sql += " AND " + searchColumn + " like '%" + searchWord + "%'";
		}
		sql += " ORDER BY bgroup DESC, bstep ASC) Tb " + " ) WHERE rNum BETWEEN " + start + " AND " + end;

		return (ArrayList<BoardDTO>) template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

	public ArrayList<BoardDTO> boardList(Map<String, Object> map, String category) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		String boardName = (String) map.get("boardName");
		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");

		String sql = "SELECT * FROM ( SELECT Tb.*, rownum rNum FROM ( " + " SELECT * FROM board b JOIN board_type bt ON b.num = bt.num ";
		if (boardName != null) {
			sql += " WHERE board_name = '" + boardName + "' ";
		}
		if (category != null) {
			sql += " AND p_language='" + category + "'";
		}
		if (searchWord != null) {
			sql += " AND " + searchColumn + " like '%" + searchWord + "%'";
		}
		sql += " ORDER BY bgroup DESC, bstep ASC) Tb " + " ) WHERE rNum BETWEEN " + start + " AND " + end;

		return (ArrayList<BoardDTO>) template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

	// 자신이 쓴 글 불러오기
	public ArrayList<BoardDTO> myPageBoardList(Map<String, Object> map) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());

		String id = map.get("id").toString();

		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");

		String sql = "SELECT * FROM ( SELECT Tb.*, rownum rNum FROM ( SELECT * FROM board b JOIN board_type bt ON b.num = bt.num WHERE b.id ='" + id + "'";
		if (searchWord != null) {
			sql += " AND " + searchColumn + " like '%" + searchWord + "%'";
		}
		sql += " ORDER BY b.num DESC) Tb " + " ) WHERE rNum BETWEEN " + start + " AND " + end;

		return (ArrayList<BoardDTO>) template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

	// 포트폴리오 목록 불러오기
	public ArrayList<BoardDTO> portfolioBoardList(Map<String, Object> map) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());

		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");

		String sql = "select * from ( select Tb.*, rownum rNum from ( select * from project_board ";
		if (searchWord != null) {
			sql += " where " + searchColumn + " like '%" + searchWord + "%'";
		}
		sql += "order by bgroup desc, bstep asc) Tb ) where rNum between " + start + " and " + end;

		return (ArrayList<BoardDTO>) template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}
	
	// 자신이 쓴 포트폴리오 목록 불러오기
	public ArrayList<BoardDTO> myPortfolioBoardList(Map<String, Object> map) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());

		String id = map.get("id").toString();
		
		String searchColumn = (String) map.get("searchColumn");
		String searchWord = (String) map.get("searchWord");

		String sql = "select * from ( select Tb.*, rownum rNum from ( select * from project_board ";
		if (searchWord != null) {
			sql += " where " + searchColumn + " like '%" + searchWord + "%'";
		}
		sql += "where id ='" + id + "' order by bgroup desc, bstep asc) Tb ) where rNum between " + start + " and " + end;

		return (ArrayList<BoardDTO>) template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

	// 게시판 전체목록 불러오기(오버로딩)
	public ArrayList<BoardDTO> boardList() {

		String sql = "SELECT * FROM board b JOIN board_type bt ON b.num = bt.num";

		return (ArrayList<BoardDTO>) template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

	// 조회수증가
	private void visit_cnt(final String pidx) {

		String sql = "UPDATE board SET visit_cnt=visit_cnt+1 WHERE num=?";

		this.template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psmt) throws SQLException {
				psmt.setInt(1, Integer.parseInt(pidx));
			}
		});
	}

	// 포트폴리오 조회수 증가
	private void portfoliovisit_cnt(final String pidx) {

		String sql = "UPDATE project_board SET visit_cnt=visit_cnt+1 WHERE num=?";

		this.template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psmt) throws SQLException {
				psmt.setInt(1, Integer.parseInt(pidx));
			}
		});
	}

	// 상세보기
	public BoardDTO postView(String pidx) {
		// 조회수증가
		visit_cnt(pidx);

		String sql = "SELECT * FROM board b join board_type bt on b.num=bt.num WHERE b.num='" + pidx + "'";
		return (BoardDTO) template.queryForObject(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

	// 게시글 추천수증가
	public void recom_Cnt(final String num) {

		String sql = "UPDATE board SET recom_cnt=recom_cnt+1 WHERE num=?";

		this.template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psmt) throws SQLException {
				psmt.setString(1, num);
			}
		});
	}

	// 게시글 추천수 DB등록
	public int chuCnt(int recomm_cnt) {
		int rs = 0;

		try {
			String sql = "INSERT INTO board VALUES board VALUES(board_seq.nextval, title, content, sysdate, id, 0, 0, ?, board_seq.currval, 0, 0, null,0)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, recomm_cnt);

			rs = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 게시글 반대수증가
	public void nrecom_Cnt(final String num) {

		String sql = "UPDATE board SET nrecom_cnt=nrecom_cnt+1 WHERE num=?";

		this.template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psmt) throws SQLException {
				psmt.setString(1, num);
			}
		});
	}

	// 게시글 반대수 DB등록
	public int NchuCnt(int nrecom_cnt) {
		int rs = 0;

		try {
			String sql = "INSERT INTO board VALUES board VALUES(board_seq.nextval, title, content, sysdate, id, 0, 0, 0, board_seq.currval, 0, 0, null,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, nrecom_cnt);

			rs = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 게시글 댓글수증가
	public void reply_Cnt(final String num) {

		String sql = "UPDATE board SET comm_cnt=comm_cnt+1 WHERE num=?";

		this.template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psmt) throws SQLException {
				psmt.setString(1, num);
			}
		});
	}

	// 게시글 댓글수 DB등록
	public int replyCnt(int comm_cnt) {
		int rs = 0;

		try {
			String sql = "INSERT INTO board VALUES board VALUES(board_seq.nextval, title, content, sysdate, id, 0, ?, 0, board_seq.currval, 0, 0, null,0)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, comm_cnt);

			rs = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 포트폴리오 상세보기
	public BoardDTO portfolioView(String pidx) {

		// 조회 수 증가
		portfoliovisit_cnt(pidx);

		String sql = "SELECT * FROM project_board WHERE num='" + pidx + "'";
		return (BoardDTO) template.queryForObject(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

	// 글쓰기 (언어 X)
	public int write(final String boardName, final String id, final String title, final String content) {
		int retValue = 0;
		// 컬럼 순서 : num, title, content, postdate, id, visit_cnt, comm_cnt,
		// recom_cnt,
		// bgroup, bstep, bdepth, p_language
		
		updateExp(id);
		
		String sql = "INSERT ALL INTO board VALUES(board_seq.nextval, ?, ?, sysdate, ?, 0, 0, 0, board_seq.currval, 0, 0, null,0)" + " INTO board_type VALUES(board_seq.currval, ?) SELECT * FROM DUAL";

		retValue = this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, title);
				ps.setString(2, content);
				ps.setString(3, id);
				ps.setString(4, boardName);
			}
		});

		return retValue;
	}

	// 글쓰기 (언어 O) - 오버로딩
	public int write(final String boardName, final String id, final String title, final String content, final String pLang) {
		int retValue = 0;
		// 컬럼 순서 : num, title, content, postdate, id, visit_cnt, comm_cnt,
		// recom_cnt,
		// bgroup, bstep, bdepth, p_language
		
		updateExp(id);
		
		String sql = "INSERT ALL INTO board VALUES(board_seq.nextval, ?, ?, sysdate, ?, 0, 0, 0, board_seq.currval, 0, 0, ?,0)" + " INTO board_type VALUES(board_seq.currval, ?) SELECT * FROM DUAL";

		retValue = this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, title);
				ps.setString(2, content);
				ps.setString(3, id);
				ps.setString(4, pLang);
				ps.setString(5, boardName);
			}
		});
		return retValue;
	}

	// 게시글 수정
	public void postModify(final int num, final String id, final String title, final String content) {

		String sql = "UPDATE board SET title=?, content=? WHERE id=? AND num=?";

		this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {

				ps.setString(1, title);
				ps.setString(2, content);
				ps.setString(3, id);
				ps.setInt(4, num);
			}
		});
	}

	// 게시글 삭제
	public void postDelete(final String boardName, final String id, final int num) {

		System.out.println("postDelete() 실행");

		int res;

		String sql = "DELETE FROM board_type WHERE num=?";

		res = this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, num);
			}
		});

		if (res == 1) {
			String sql2 = "DELETE FROM board WHERE id=? AND num=?";

			this.template.update(sql2, new PreparedStatementSetter() {

				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, id);
					ps.setInt(2, num);
				}
			});
		}
	}

	// 게시글 삭제
	public void postDelete(final String num) {

		System.out.println("postDelete() 실행");

		int res;

		String sql = "DELETE FROM board_type WHERE num=?";

		res = this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, num);
			}
		});

		if (res == 1) {
			String sql2 = "DELETE FROM board WHERE num=?";

			this.template.update(sql2, new PreparedStatementSetter() {

				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, num);
				}
			});
		}
	}
	
	//게시글 하나 가져오기
	public BoardDTO getPost(String num) {

		String dbQuery = "SELECT * FROM board b JOIN board_type bt ON b.num=bt.num WHERE b.num="+ num;

		return (BoardDTO) template.queryForObject(dbQuery, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

	// 답변글 입력전 레코드 일괄 업데이트
	public void replyPrevUpdate(int bgroup, int bstep) {
		/*
		 * 현재 답변글이 작성되는 위치(Bstep를 확인하여 해당위치보다 큰 레코드를 일괄적으로 +1 처리한다
		 */
		try {
			String sql = "UPDATE board SET bstep=bstep+1 WHERE bgroup=? AND bstep>?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bgroup);
			psmt.setInt(2, bstep);

			int rn = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 답글
	public int replyWrite(BoardDTO dto, String id, String title, String content) {

		int rs = 0;
		int result = 0;

		try {
			String sql = "INSERT INTO board VALUES (board_seq.nextval, ?, ?, sysdate, ?, 0, 0, 0, ?, ?, ?, null, 0)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, id);
			psmt.setInt(4, dto.getBgroup());
			psmt.setInt(5, dto.getBstep() + 1);
			psmt.setInt(6, dto.getBdepth() + 1);

			rs = psmt.executeUpdate();
			if (rs == 1) {
				try {
					String sql2 = "INSERT INTO board_type VALUES (board_seq.currval, ?)";

					psmt = conn.prepareStatement(sql2);
					psmt.setString(1, dto.getBoard_name());

					result = psmt.executeUpdate();
				} catch (Exception e2) {
					System.out.println("답글 타입 인서트 실패");
					e2.printStackTrace();
				}
			}
		} catch (Exception e) {
			System.out.println("답글 인서트 실패");
			e.printStackTrace();
		}

		return result;
	}

	public int portfolioWrite(final String id, final String title, final String content, final String fileName, final String language) {

		int retValue = 0;

		String sql = "INSERT INTO project_board VALUES(project_seq.nextval, ?, ?, sysdate, ?, 0, 0, 0, ?, 0, 0, 0, ?)";

		retValue = this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, title);
				ps.setString(2, content);
				ps.setString(3, id);
				ps.setString(4, fileName);
				ps.setString(5, language);
			}
		});

		return retValue;
	}

	public void modifyPortfolio(final String id, final String num, final String title, final String content, final String fileName) {

		String query = "update project_board SET title=?, content=?, fileName=? WHERE id=? AND num=?";

		this.template.update(query, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement psmt) throws SQLException {
				psmt.setString(1, title);
				psmt.setString(2, content);
				psmt.setString(3, fileName);
				psmt.setString(4, id);
				psmt.setInt(5, Integer.parseInt(num));
			}
		});
	}

	public void deletePortfolio(final String num) {

		String query = "delete from project_board where num=?";

		this.template.update(query, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement psmt) throws SQLException {
				psmt.setInt(1, Integer.parseInt(num));
			}
		});
	}
	
	public void updateExp(final String id){
		
		String sql = "UPDATE member_grade SET exp=exp+1 WHERE id=?";
		
		this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, id);
			}
		});
	}
	
	public void updateReportCnt(final String id){
		
		String sql = "UPDATE member_grade SET report_cnt=report_cnt+1 WHERE id=?";
		
		this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, id);
			}
		});
	}
	
	// 자동 레벨업 기능을 위한 경험치 체크 함수
	public int checkExp(final String id){
		String sql = "UPDATE member_grade SET grade = grade+1 WHERE id=? AND exp >= (SELECT exp FROM exp_grade_list)";
		
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setString(1, id);
			}
		});
	}
}
