package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.CommentsDAO;

public class CommentsCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String num = req.getParameter("num");
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		
		CommentsDAO dao = new CommentsDAO();
		//댓글 DB에 저장
		dao.enroll(num, id, content);
		//저장한 댓글 model에 담기
		model.addAttribute("dto", dao.getComments());
		
		dao.close();
	}

}
