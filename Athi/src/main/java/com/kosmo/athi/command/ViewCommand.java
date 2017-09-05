package com.kosmo.athi.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;
import com.kosmo.athi.model.CommentsDAO;
import com.kosmo.athi.model.CommentsDTO;


public class ViewCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String num = req.getParameter("num");
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.postView(num);
		
		//상세보기 출바꿈 처리
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		model.addAttribute("viewRow", dto);

		//댓글 리스트
		CommentsDAO cdao = new CommentsDAO();
		ArrayList<CommentsDTO> list = cdao.getAllComments(num);
		model.addAttribute("comments", list);
		
		//댓글수
		dto.setcomm_cnt(list.size());

		dao.close();
		cdao.close();
	}

}
