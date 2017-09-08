package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.CommentsDAO;

public class PortpolioCommentsCommand implements ICommand {
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String num = req.getParameter("num");
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		
		CommentsDAO cDao = new CommentsDAO();
		
		// 댓글 DB에 저장
		cDao.proj_enroll(num, id, content);
		
		model.addAttribute("dto", cDao.proj_getComments());
		
		cDao.close();
	}
}
