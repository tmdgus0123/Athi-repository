package com.kosmo.athi.command;

import java.util.ArrayList;
import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;

public class AdminBoardCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		BoardDAO dao = new BoardDAO();

		ArrayList<BoardDTO> lists = dao.boardList();
		
		model.addAttribute("boardRows", lists);

		dao.close();
	}
}