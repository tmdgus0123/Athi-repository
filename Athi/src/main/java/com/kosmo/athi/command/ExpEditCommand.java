package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;

public class ExpEditCommand implements ICommand{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String exp = req.getParameter("exp");
		String id = req.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		dao.expEdit(exp, id);
		
		dao.close();
	}
}
