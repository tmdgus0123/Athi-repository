package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;

public class SelectMemberDeleteCommand implements ICommand{
	@Override
	public void execute(Model model) {
		
		System.out.println("execute() 삭제 실행");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String[] id = req.getParameterValues("user_id");
		String exeId = "";
		
		MemberDAO mDao = new MemberDAO();
		for(int i=0; i<id.length; i++){
			exeId = id[i];
			mDao.deleteMember3(exeId);
		}
		mDao.close();
	}
}
