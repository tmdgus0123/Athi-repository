package com.kosmo.athi.command;

import java.util.ArrayList;
import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;
import com.kosmo.athi.model.MemberDAO;

public class AdminBoardCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		BoardDAO dao = new BoardDAO();
		MemberDAO mDao = new MemberDAO();
		
		ArrayList<BoardDTO> lists = dao.boardList();
		
		int newPostCnt = dao.newPosts();
		int newPortfolioCnt = dao.newPortfolios();
		int newMemberCnt = mDao.newMembers();
		
		model.addAttribute("newPostCnt", newPostCnt);
		model.addAttribute("newPortfolioCnt", newPortfolioCnt);
		model.addAttribute("newMemberCnt", newMemberCnt);
		model.addAttribute("boardRows", lists);

		dao.close();
		mDao.close();
	}
}