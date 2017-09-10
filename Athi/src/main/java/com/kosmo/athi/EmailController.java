package com.kosmo.athi;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.athi.model.EmailServiceDAO;

@Controller
public class EmailController {
	
	private EmailServiceDAO eDao;
	
	public void setEDAO(EmailServiceDAO eDao){
		this.eDao = eDao;
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	@ResponseBody
	public boolean sendMailAuth(HttpSession session, @RequestParam String email){
		int getAuthCode = new Random().nextInt(1000000)+100000;
		String realAuthCode = String.valueOf(getAuthCode);
		
		session.setAttribute("authCode", realAuthCode);
		
		String subject = "아띠 회원가입 인증 코드 안내";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는" + realAuthCode + " 입니다.");
		
		return eDao.send(subject, sb.toString(), "아이디@gmail.com", email, null);
	}
}
