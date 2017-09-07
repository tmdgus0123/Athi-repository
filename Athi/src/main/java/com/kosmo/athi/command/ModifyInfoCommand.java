package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;

public class ModifyInfoCommand implements ICommand{
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String idx  = req.getParameter("idx");
		
		BoardDAO bDao = new BoardDAO();
		BoardDTO infoList = bDao.getPost(idx);
		
		model.addAttribute("postInfo", infoList);
		bDao.close();
	}
}
