package com.kosmo.athi.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.athi.model.BoardDAO;
import com.kosmo.athi.model.BoardDTO;
import com.kosmo.athi.model.PagingUtil;

public class BoardCommand implements ICommand {

	@Override
	public void execute(Model model) {
		
		BoardDAO dao = new BoardDAO();
		
		//파라미터받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		//게시판 이름
		String boardName = req.getParameter("boardName");
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		String category = req.getParameter("category");
		
		paramMap.put("searchColumn", searchColumn);
		paramMap.put("searchWord", searchWord);
		paramMap.put("boardName", boardName);
		
		//전체 레코드수 카운트
		int totalRecordCount = 0;

		if (category != "") {
			paramMap.put("category", category);
			totalRecordCount = dao.getTotalCount(paramMap, category);
		} else {
			totalRecordCount = dao.getTotalCount(paramMap);
		}
		
		//페이지 설정값
		int pageSize = 9;
		int blockPage = 5;
		//전체페이지수
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		//현재페이지를 파라미터로 받기
		int nowPage = req.getParameter("nowPage") == null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		//시작 및 끝 rownum 구하기
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		//DAO로 넘길 파라미터 조립
		paramMap.put("start", start);
		paramMap.put("end", end);
		paramMap.put("totalPage", totalPage);
		paramMap.put("nowPage", nowPage);
		paramMap.put("totalCount", totalRecordCount);
		paramMap.put("pageSize", pageSize);
		paramMap.put("boardName", boardName);
		
		//page처리를 위한 문자열 생성
		String addQueryStr = "boardName="+ boardName +"&";
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, 
				req.getContextPath() + "/"+ boardName +".do?"+ addQueryStr);
		
		// DAO에서 list()메소드로 목록 가져오기
		// 여러 게시판을 분류하기 위해 게시판 이름을 파라미터로 받음
		ArrayList<BoardDTO> listRows = null;
		
		if(category!=""){
			listRows = dao.boardList(paramMap, category);
		}
		else{
			listRows = dao.boardList(paramMap);
		}
		
		//Spring JDBC사용시 답변글 들여쓰기 처리
		int virtualNum = 0;
		int countNum = 0;
		for(BoardDTO row : listRows) {
			String reSpace = "";
			if(row.getBdepth()>0) {
				//답변글 들여쓰기
				for (int i=0; i<row.getBdepth(); i++) {
					reSpace += "&nbsp;&nbsp;";
				}
				//답변글 아이콘 붙여주기
				row.setTitle(reSpace + "<img src='./resources/images/re3.gif'>" + row.getTitle());
			}
			//리스트 가상번호
			virtualNum = totalRecordCount - (((nowPage - 1)*pageSize) + countNum++);
			row.setrNum(virtualNum);
		}
		
		//페이지 처리를 위한 부분
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		//리스트 레코드를 저장
		model.addAttribute("listRows", listRows);
		//게시판 이름 저장
		model.addAttribute("boardName", boardName);
		model.addAttribute("category", category);
		dao.close();
	}

}
