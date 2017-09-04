package com.kosmo.athi.model;

import java.util.Date;

public class CommentsDTO {

	private int num;
	private String id;
	private java.util.Date postdate;
	private String content;
	private int board_num;
	private int cgroup;
	private int cstep;
	private int cdepth;
	private int recom_cnt;
	
	public CommentsDTO(){}
	public CommentsDTO(int num, String id, Date postdate, String content, int board_num, int cgroup, int cstep, int cdepth, int recom_cnt) {
		this.num = num;
		this.id = id;
		this.postdate = postdate;
		this.content = content;
		this.board_num = board_num;
		this.cgroup = cgroup;
		this.cstep = cstep;
		this.cdepth = cdepth;
		this.recom_cnt = recom_cnt;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.util.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.util.Date postdate) {
		this.postdate = postdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getCgroup() {
		return cgroup;
	}
	public void setCgroup(int cgroup) {
		this.cgroup = cgroup;
	}
	public int getCstep() {
		return cstep;
	}
	public void setCstep(int cstep) {
		this.cstep = cstep;
	}
	public int getCdepth() {
		return cdepth;
	}
	public void setCdepth(int cdepth) {
		this.cdepth = cdepth;
	}
	public int getRecom_cnt() {
		return recom_cnt;
	}
	public void setRecom_cnt(int recom_cnt) {
		this.recom_cnt = recom_cnt;
	}
	
	
}
