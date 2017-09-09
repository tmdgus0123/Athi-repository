package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.MemberDAO;

public class GradeEditCommand implements ICommand{
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int grade = Integer.parseInt(req.getParameter("grade"));
		String id = req.getParameter("id");

		MemberDAO dao = new MemberDAO();
		dao.gradeEdit(grade, id);
System.out.println("GradeEditComment exit");
		dao.close();
	}
}
