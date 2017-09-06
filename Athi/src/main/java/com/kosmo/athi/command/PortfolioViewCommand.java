package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;

public class PortfolioViewCommand implements ICommand{

	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String num = req.getParameter("num");
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.portfolioView(num);
		
		//상세보기 출바꿈 처리
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		model.addAttribute("viewRow", dto);
		dao.close();
		
	}
	
}