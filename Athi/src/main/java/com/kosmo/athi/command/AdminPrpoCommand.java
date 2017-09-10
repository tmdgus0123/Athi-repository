package com.kosmo.athi.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;
import com.kosmo.athi.model.MemberDAO;

public class AdminPrpoCommand implements ICommand{
	
	@Override
	public void execute(Model model) {
		
		BoardDAO pDao = new BoardDAO();
		MemberDAO dao = new MemberDAO();
		ArrayList<BoardDTO> pList = pDao.portfolioBoardList();
		
		int newPostCnt = pDao.newPosts();
		int newPortfolioCnt = pDao.newPortfolios();
		int newMemberCnt = dao.newMembers();
		
		model.addAttribute("newPostCnt", newPostCnt);
		model.addAttribute("newPortfolioCnt", newPortfolioCnt);
		model.addAttribute("newMemberCnt", newMemberCnt);
		model.addAttribute("portfolioRows", pList);
		pDao.close();
		dao.close();
	}
}
