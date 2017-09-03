package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;

public class MemberDeleteCommand implements ICommand{
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String id = req.getParameter("user_id");
		String pwd = req.getParameter("user_pwd");
		
		System.out.println(id + " " + pwd);
		
		MemberDAO mDao = new MemberDAO();
		int retValue = mDao.deleteMember(id, pwd);
		
		model.addAttribute("modeValue", retValue);
		mDao.close();
	}
}
