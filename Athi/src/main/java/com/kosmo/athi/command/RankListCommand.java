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
		
		if(rankList.size()!=0){
			
			String[] order = {"first","second", "third"};
			
			String modelAttr = "";
			String modelAttr2 = "";
			String modelAttr3 = "";
			
			for(int i=0; i<=rankList.size()-1; i++){
				for(int j=i; j<=i; j++){
					modelAttr=order[j]+"Id";
					modelAttr2=order[j]+"Grade";
					modelAttr3=order[j]+"Date";
					
					System.out.println(modelAttr + " " + rankList.get(i).getId());
					System.out.println(modelAttr2 + " " + rankList.get(i).getGrade());
					System.out.println(modelAttr3 + " " + rankList.get(i).getRegidate());
					
					model.addAttribute(modelAttr, rankList.get(i).getId());
					model.addAttribute(modelAttr2, rankList.get(i).getGrade());
					model.addAttribute(modelAttr3, rankList.get(i).getRegidate());
				}
			}
		}
		
		mDao.close();
	}
}
