package com.kosmo.athi.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;

public class newPortfolioListCommand implements ICommand{

	@Override
	public void execute(Model model) {
		
		BoardDAO pDao = new BoardDAO();
		ArrayList<BoardDTO> pList = pDao.newPortfolioList();
		
		model.addAttribute("newPortfolioList", pList);
		pDao.close();
	}
}
