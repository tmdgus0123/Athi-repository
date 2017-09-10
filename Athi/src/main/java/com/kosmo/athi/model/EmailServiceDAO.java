package com.kosmo.athi.model;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceDAO implements EmailService {
	
	// emailSender 사용을 위한 참조변수 생성
	private JavaMailSender javaMailSender;
	
	
	public void setJavaMailSender(JavaMailSender sender){
		this.javaMailSender = sender;
	}
	
	@Override
	public boolean send(String title, String content, String fromUser, String toUser, String filePath)
	{
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try{
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(title);
			helper.setText(content);
			helper.setFrom(fromUser);
			helper.setTo(toUser);
			
			// 첨부 파일 처리
			if(filePath != null){
				File file = new File(filePath);
				if(file.exists()){
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
			
			javaMailSender.send(message);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
}
