package com.kosmo.athi.model;

public class MemberDTO {
	
	private String id;
	private String pass;
	private String name;
	private String address;
	private String email;
	private java.sql.Date birthday;
	private String gender;
	private String phone;
	private java.sql.Date regidate;
	
	private int grade;
	private int report_cnt;
	private int exp;
	
	public MemberDTO(){}
	
	//모든 멤버변수가 들어간 인자생성자
	public MemberDTO(String id, String pass, String name, String address, String email, java.sql.Date birthday, String gender, String phone, java.sql.Date regidate, int grade, int report_cnt, int exp) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.address = address;
		this.email = email;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.regidate = regidate;
		this.grade = grade;
		this.report_cnt = report_cnt;
		this.exp = exp;
	}

	//회원가입떄 사용하는 인자생성자
	public MemberDTO(String id, String pass, String name, String address, String email, java.sql.Date birthday, String gender, String phone) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.address = address;
		this.email = email;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public java.sql.Date getBirthday() {
		return birthday;
	}

	public void setBirthday(java.sql.Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public java.sql.Date getRegidate() {
		return regidate;
	}

	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getreport_cnt() {
		return report_cnt;
	}

	public void setreport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}

	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}	
}
