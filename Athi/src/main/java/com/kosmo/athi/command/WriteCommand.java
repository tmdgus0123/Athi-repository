package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;

public class WriteCommand implements ICommand {

	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		String boardName = req.getParameter("boardName");
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String pLang = "";

		int retValue = 0;

		BoardDAO bDao = new BoardDAO();

		if (req.getParameter("pLang") != null) {
			pLang = req.getParameter("pLang");
			retValue = bDao.write(boardName, id, title, content, pLang);
		} else {
			retValue = bDao.write(boardName, id, title, content);
		}

		model.addAttribute("boardName", boardName);
		bDao.close();
	}
}
