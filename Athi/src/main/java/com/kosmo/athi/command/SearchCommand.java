package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public class SearchCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		model.addAttribute("boardName", req.getParameter("boardName"));
		model.addAttribute("searchColumn", req.getParameter("searchColumn"));
		model.addAttribute("searchWord", req.getParameter("searchWord"));
		model.addAttribute("category", req.getParameter("category"));
	}
}
