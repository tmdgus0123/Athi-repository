package com.kosmo.athi.model;

import org.springframework.jdbc.core.JdbcTemplate;

// id 찾기 또는 비밀번호 찾기에 이용할 클래스
public class userServiceDAO {
	
	public userServiceDAO(){
		JdbcTemplate template = Constant.template;
	}
}
