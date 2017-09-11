package com.kosmo.athi.model;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceDAO implements EmailService {
	
	// emailSender 사용을 위한 참조변수 생성
	private JavaMailSender javaMailSender;
	
	public EmailServiceDAO(){}
	
	public void setJavaMailSender(JavaMailSender javaMailSender){
		this.javaMailSender = javaMailSender;
	}
	
	@Override
	public boolean send(String title, String content, String fromUser, String toUser)
	{	
		System.out.println("send() 실행");
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		System.out.println(message);
		try{
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(title);
			helper.setText(content, true);
			helper.setFrom(fromUser);
			helper.setTo(toUser);
			
			javaMailSender.send(message);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
}
