package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;

public class ReplyCommand implements ICommand {

	@Override
	public void execute(Model model) {

		BoardDAO dao = new BoardDAO();
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest) paramMap.get("req");
		
		String nowPage = req.getParameter("nowPage");
		String num = req.getParameter("num");

		BoardDTO dto = dao.getPost(num);
		
		//답글 추가 처리
		dto.setTitle("[답글]"+ dto.getTitle());
		dto.setContent("\r\n\r\n\r\n\r\n\r\n==========[원본 글 내용]==========\r\n\r\n\r\n"+ dto.getContent());
		
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("dto", dto);
		dao.close();
	}
	
}
