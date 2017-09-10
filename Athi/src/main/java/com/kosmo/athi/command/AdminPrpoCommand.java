package com.kosmo.athi.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;

public class AdminPrpoCommand implements ICommand{
	
	@Override
	public void execute(Model model) {
		
		BoardDAO pDao = new BoardDAO();
		ArrayList<BoardDTO> pList = pDao.portfolioBoardList();
		
		model.addAttribute("portfolioRows", pList);
		pDao.close();
	}
}
