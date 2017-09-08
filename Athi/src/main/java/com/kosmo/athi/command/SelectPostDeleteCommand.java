package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;

public class SelectPostDeleteCommand implements ICommand{
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String[] postNum = req.getParameterValues("postNum");
		String exePostNum = "";
		
		BoardDAO dao = new BoardDAO();
		
		for(int i=0; i<postNum.length; i++){
			exePostNum = postNum[i];
			dao.postDelete(exePostNum);
		}
		dao.close();
	}
}
