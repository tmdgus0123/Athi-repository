package com.kosmo.athi.model;

public interface EmailService {
	
	public boolean send(String title, String content, String fromUser, String toUser);	
}
