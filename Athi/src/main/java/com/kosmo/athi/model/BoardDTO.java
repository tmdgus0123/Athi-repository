package com.kosmo.athi.model;

import java.util.Date;

public class BoardDTO {

	private int num;
	private String title;
	private String content;
	private java.util.Date postdate;
	private String id;
	private int visit_cnt; // 조회수

	private int comm_cnt; // 댓글수
	private int recom_cnt; // 추천수
	private int nrecom_cnt; //반대수

	// 게시판 정렬에 필요한 변수
	private int bgroup;
	private int bstep;
	private int bdepth;
	
	// 조인시 필요한 변수
	private String board_name;
	
	// 게시글 가상 번호
	private int rNum;
	
	// 포트폴리오 파일 이름
	private String fileName;
	
	// 포트폴리오 카테고리 언어
	private String p_language;
	
	public BoardDTO() {
	}

	protected BoardDTO(int num, String title, String content, Date postdate, String id, int visit_cnt, int comm_cnt, int recom_cnt, int nrecom_cnt, int bgroup, int bstep, int bdepth, String board_name, String fileName, String p_language) {

		this.num = num;
		this.title = title;
		this.content = content;
		this.postdate = postdate;
		this.id = id;
		this.visit_cnt = visit_cnt;
		this.comm_cnt = comm_cnt;
		this.recom_cnt = recom_cnt;
		this.nrecom_cnt = nrecom_cnt;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bdepth = bdepth;
		this.board_name = board_name;
		this.fileName = fileName;
		this.p_language = p_language;
	}

	protected BoardDTO(int num, String title, String content, Date postdate, String id, int visit_cnt, int comm_cnt, int recom_cnt, int bgroup, int bstep, int bdepth, int nrecom_cnt) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.postdate = postdate;
		this.id = id;
		this.visit_cnt = visit_cnt;
		this.comm_cnt = comm_cnt;
		this.recom_cnt = recom_cnt;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bdepth = bdepth;
		this.nrecom_cnt = nrecom_cnt;
	}

	public String getP_language() {
		return p_language;
	}

	public void setP_language(String p_language) {
		this.p_language = p_language;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.util.Date getPostdate() {
		return postdate;
	}

	public void setPostdate(java.util.Date postdate) {
		this.postdate = postdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getVisit_cnt() {
		return visit_cnt;
	}

	public void setVisit_cnt(int visit_cnt) {
		this.visit_cnt = visit_cnt;
	}

	public int getcomm_cnt() {
		return comm_cnt;
	}

	public void setcomm_cnt(int nrecom_cnt) {
		this.comm_cnt = nrecom_cnt;
	}

	public int getRecom_cnt() {
		return recom_cnt;
	}

	public void setRecom_cnt(int recom_cnt) {
		this.recom_cnt = recom_cnt;
	}
	
	public int getNrecom_cnt() {
		return nrecom_cnt;
	}

	public void setNrecom_cnt(int nrecom_cnt) {
		this.nrecom_cnt = nrecom_cnt;
	}

	public int getBgroup() {
		return bgroup;
	}

	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}

	public int getBstep() {
		return bstep;
	}

	public void setBstep(int bstep) {
		this.bstep = bstep;
	}

	public int getBdepth() {
		return bdepth;
	}

	public void setBdepth(int bdepth) {
		this.bdepth = bdepth;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	
}
