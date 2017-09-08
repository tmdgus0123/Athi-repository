package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;

public class ReplyActionCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		BoardDAO dao = new BoardDAO();
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest) paramMap.get("req");

		String num = req.getParameter("num");
		BoardDTO dto = dao.getPost(num);
		
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		

		//답글의 깊이만큼 들여쓰기
		for(int i=0; i<dto.getBdepth(); i++) {
			title = "  "+ title;
		}
		dao.replyWrite(dto, id, title, content);
		dao.close();
	}

}
