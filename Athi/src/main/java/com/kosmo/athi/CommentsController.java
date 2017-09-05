package com.kosmo.athi;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.athi.command.CommentsCommand;
import com.kosmo.athi.command.DeleteCommentCommand;
import com.kosmo.athi.command.ICommand;
import com.kosmo.athi.model.Constant;

@Controller
public class CommentsController {

	ICommand command = null;

	// Spring JDBC를 사용하기 위한 설정
	// JDBC템플릿설정
	private JdbcTemplate template;

	// setter설정
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}

	@RequestMapping("/comments.do")
	public String comments(HttpServletRequest req, Model model) {
		System.out.println("comments() 메소드 실행");
		
		model.addAttribute("req", req);
		command = new CommentsCommand();
		command.execute(model);
		
		return "board/commentsAction";
	}
	
	@RequestMapping("/deleteComments.do")
	public String deleteComments(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		command = new DeleteCommentCommand();
		command.execute(model);
		
		return "/board/view";
	}
}
