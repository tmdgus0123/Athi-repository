package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.CommentsDAO;

public class DeleteCommentCommand implements ICommand {

	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String num = req.getParameter("num");
		
		CommentsDAO cdao = new CommentsDAO();
		
		cdao.delete(num);

		cdao.close();
	}

}
