package com.kosmo.athi.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;

public class newPostListCommand implements ICommand{

	@Override
	public void execute(Model model) {
		
		BoardDAO bDao = new BoardDAO();
		ArrayList<BoardDTO> bList = bDao.newPostList();
		
		model.addAttribute("newPostList", bList);
		bDao.close();
	}
}
