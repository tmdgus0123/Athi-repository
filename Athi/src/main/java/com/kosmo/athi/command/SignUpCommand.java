package com.kosmo.athi.command;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;
import com.kosmo.athi.model.MemberDTO;

public class SignUpCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String id = req.getParameter("inputId");
		String pass = req.getParameter("inputPassword");
		String name = req.getParameter("inputName");
		String address = req.getParameter("inputAddr");
		String email = req.getParameter("inputEmail") + req.getParameter("inputEmail2");
		java.util.Date birthday;
		java.sql.Date realBirthday;
		try{	
			birthday = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("inputBirthday"));
			realBirthday = new java.sql.Date(birthday.getTime());
		}
		catch(Exception e){
			e.printStackTrace();
			realBirthday = null;
		}
		String gender = req.getParameter("inputGender");
		String phone = req.getParameter("inputPhone");
		
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO(id, pass, name, address, email, realBirthday, gender, phone);
		
		int retValue = mdao.signUp(mdto);
		
		model.addAttribute("retValue", retValue);
	
		mdao.close();
	}
}
