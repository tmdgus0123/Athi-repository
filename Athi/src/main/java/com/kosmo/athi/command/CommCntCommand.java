package com.kosmo.athi.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;

public class CommCntCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String num = req.getParameter("num");

		BoardDAO dao = new BoardDAO();
		dao.comm_Cnt(num);
		
		BoardDTO dto = dao.postView(num);
		model.addAttribute("commCnt", dto.getcomm_cnt());
		dao.close();
	}

//	//추천수카운트 DB에 저장
//			dao.chuCnt(num);
//			BoardDTO dto = dao.getcommCnt(num);
//			int comm_cnt = dto.getcomm_cnt();
//			//저장한 카운트 model에 담기
//			model.addAttribute("comm_cnt", comm_cnt);
}
