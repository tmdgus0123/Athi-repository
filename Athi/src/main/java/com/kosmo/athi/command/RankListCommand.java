package com.kosmo.athi.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;
import com.kosmo.athi.model.MemberDTO;

public class RankListCommand implements ICommand{
	
	@Override
	public void execute(Model model) {
		
		MemberDAO mDao = new MemberDAO();
		
		ArrayList<MemberDTO> rankList = mDao.rankList();
		
		model.addAttribute("firstId", rankList.get(0).getId());
		model.addAttribute("secondId", rankList.get(1).getId());
		model.addAttribute("thirdId", rankList.get(2).getId());
		
		model.addAttribute("firstGrade", rankList.get(0).getGrade());
		model.addAttribute("secondGrade", rankList.get(1).getGrade());
		model.addAttribute("thirdGrade", rankList.get(2).getGrade());
		
		model.addAttribute("firstrDate", rankList.get(0).getRegidate());
		model.addAttribute("secondrDate", rankList.get(1).getRegidate());
		model.addAttribute("thirdrDate", rankList.get(2).getRegidate());
	}
}
