package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;

public class ModeCommand implements ICommand{
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String mode = req.getParameter("mode");
		int num = Integer.parseInt(req.getParameter("num"));
		String boardName = req.getParameter("boardName");
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		BoardDAO bDao = new BoardDAO();
		
		if("modify".equalsIgnoreCase(mode)==true){
			bDao.postModify(num, id, title, content);
		}
		else if("delete".equalsIgnoreCase(mode)==true){
			bDao.postDelete(boardName, id, num);
		}
		
		model.addAttribute("boardName", boardName);
<<<<<<< HEAD
=======
		
>>>>>>> branch 'master' of https://github.com/tmdgus0123/Athi-repository.git
		bDao.close();
	}
}
