package com.kosmo.athi.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.MemberDAO;
import com.kosmo.athi.model.MemberDTO;

public class AdminMemberCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		BoardDAO bDao = new BoardDAO();
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberDTO> lists = dao.getTotalMemberRecord();
		
		int newPostCnt = bDao.newPosts();
		int newPortfolioCnt = bDao.newPortfolios();
		int newMemberCnt = dao.newMembers();
		
		model.addAttribute("newPostCnt", newPostCnt);
		model.addAttribute("newPortfolioCnt", newPortfolioCnt);
		model.addAttribute("newMemberCnt", newMemberCnt);
		model.addAttribute("memberRows", lists);

		dao.close();
		bDao.close();
	}

}
