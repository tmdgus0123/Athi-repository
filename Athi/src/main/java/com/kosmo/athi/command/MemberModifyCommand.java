package com.kosmo.athi.command;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;
import com.kosmo.athi.model.MemberDTO;

public class MemberModifyCommand implements ICommand{
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		MemberDAO mDao = new MemberDAO();
		MemberDTO mDto = new MemberDTO();
		
		mDto.setId(req.getParameter("inputId"));
		mDto.setPass(req.getParameter("inputPassword"));
		mDto.setName(req.getParameter("inputName"));
		mDto.setAddress(req.getParameter("inputAddr"));
		String realEmail = req.getParameter("inputEmail")+req.getParameter("inputEmail2");
		mDto.setEmail(realEmail);
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
		mDto.setBirthday(realBirthday);
		mDto.setPhone(req.getParameter("inputPhone"));
		mDto.setGender(req.getParameter("inputGender"));
		
		int modeValue = mDao.modifyInfo(mDto);
		
		model.addAttribute("modeValue", modeValue);
		
		mDao.close();
	}
}
