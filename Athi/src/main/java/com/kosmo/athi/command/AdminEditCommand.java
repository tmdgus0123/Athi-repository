package com.kosmo.athi.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;
import com.kosmo.athi.model.MemberDTO;

public class AdminEditCommand implements ICommand{
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String id = req.getParameter("user_id").trim();
		
		MemberDAO dao = new MemberDAO();
		
		MemberDTO mList = dao.memberInfo(id);
		
		model.addAttribute("mList", mList);
		
		dao.close();
	}
}
