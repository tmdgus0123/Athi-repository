package com.kosmo.athi.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;
import com.kosmo.athi.model.MemberDTO;

public class AdminMemberCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberDTO> lists = dao.getTotalMemberRecord();
		
		
		model.addAttribute("memberRows", lists);

		dao.close();
	}

}
