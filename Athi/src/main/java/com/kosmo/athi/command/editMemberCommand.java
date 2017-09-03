package com.kosmo.athi.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;
import com.kosmo.athi.model.MemberDTO;

public class editMemberCommand implements ICommand{
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("session");
		
		String id = session.getAttribute("user_id").toString();
		String pass = session.getAttribute("user_pwd").toString();
		
		System.out.println(id + " " + pass);
		
		MemberDAO mDao = new MemberDAO();
		ArrayList<MemberDTO> mDto = mDao.selectMember(id, pass);
		
		model.addAttribute("memberInfo", mDto);
		mDao.close();
	}	
}
