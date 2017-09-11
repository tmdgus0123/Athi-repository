package com.kosmo.athi;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.athi.model.EmailServiceDAO;

@Controller
public class EmailController {
	
	private EmailServiceDAO EmailServiceDAO;
	
	public void setEDAO(EmailServiceDAO EmailServiceDAO){
		this.EmailServiceDAO = EmailServiceDAO;
	}
	
	@RequestMapping("emailAccept.do")
	public String emailAccept(HttpServletRequest req, Model model){
		
		model.addAttribute("req", req);
		
		return "process/emailAccept";
	}
	
	@RequestMapping(value="emailAcception.do", method=RequestMethod.POST, produces = "application/json")
	public void sendMailAuth(HttpSession session, @RequestParam String email){
		int getAuthCode = new Random().nextInt(1000000)+100000;
		String realAuthCode = String.valueOf(getAuthCode);
		
		session.setAttribute("authCode", realAuthCode);
		
		String subject = "아띠 회원가입 인증 코드 안내";
		String content = "귀하의 인증 코드는" + realAuthCode + " 입니다.";
		StringBuilder fromUser = new StringBuilder();
		fromUser.append("아이디@gmail.com");
		StringBuilder toUser = new StringBuilder();
		toUser.append(email);
		
		System.out.println(subject + " " +fromUser.toString()+" "+  content + " " + toUser.toString());
		
		boolean result = EmailServiceDAO.send(subject, content, fromUser.toString(), toUser.toString());
	}
}
