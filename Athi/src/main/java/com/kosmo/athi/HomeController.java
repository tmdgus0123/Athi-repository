package com.kosmo.athi;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.kosmo.athi.command.AdminBoardCommand;
import com.kosmo.athi.command.AdminEditCommand;
import com.kosmo.athi.command.AdminMemberCommand;
import com.kosmo.athi.command.BoardCommand;
import com.kosmo.athi.command.RecomCntCommand;
import com.kosmo.athi.command.CommentsCommand;
import com.kosmo.athi.command.CategoryViewCommand;
import com.kosmo.athi.command.ICommand;
import com.kosmo.athi.command.MyPageCommand;
import com.kosmo.athi.command.PortfolioBoardCommand;
import com.kosmo.athi.command.PortfolioViewCommand;
import com.kosmo.athi.command.PortfolioWriteCommand;
import com.kosmo.athi.command.SearchCommand;
import com.kosmo.athi.command.SelectMemberDeleteCommand;
import com.kosmo.athi.command.SelectPostDeleteCommand;
import com.kosmo.athi.command.SignUpCommand;
import com.kosmo.athi.command.ViewCommand;
import com.kosmo.athi.command.WriteCommand;
import com.kosmo.athi.command.EditMemberCommand;
import com.kosmo.athi.command.ExpEditCommand;
import com.kosmo.athi.command.GradeEditCommand;
import com.kosmo.athi.command.MemberDeleteCommand;
import com.kosmo.athi.command.MemberModifyCommand;
import com.kosmo.athi.command.ModeCommand;
import com.kosmo.athi.command.ModifyInfoCommand;
import com.kosmo.athi.command.RankListCommand;
import com.kosmo.athi.command.ReplyActionCommand;
import com.kosmo.athi.command.ReplyCommand;
import com.kosmo.athi.model.Constant;
import com.kosmo.athi.model.MemberDAO;
import com.kosmo.athi.model.MemberDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

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

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {

		if (session.getAttribute("user_id") != null) {
			model.addAttribute("session", session);
		}

		command = new RankListCommand();
		command.execute(model);

		return "home";
	}

	@RequestMapping("/accident.do")
	public String accident(HttpServletRequest req, Model model) {
		System.out.println("accident() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "accident";
	}

	@RequestMapping("/freeBoard.do")
	public String freeBoard(HttpServletRequest req, Model model) {
		System.out.println("freeBoard() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);
		
		return "freeBoard";
	}

	@RequestMapping("/termsOfService.do")
	public String termsOfService(Model model) {
		System.out.println("termsOfService() 메소드 실행");
		return "termsOfService";
	}

	@RequestMapping("/myPortfolio.do")
	public String myPortfolio(Model model) {
		System.out.println("myPortfolio() 메소드 실행");
		return "myPortfolio";
	}

	@RequestMapping("/notice.do")
	public String notice(HttpServletRequest req, Model model) {
		System.out.println("notice() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "notice";
	}

	@RequestMapping("/QnABoard.do")
	public String QnADesign(HttpServletRequest req, Model model) {
		System.out.println("QnABoard() 메소드 실행");
		
		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "QnABoard";
	}

	@RequestMapping("/recruitProject.do")
	public String recruitProject(HttpServletRequest req, Model model) {
		System.out.println("recruitProject() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "recruitProject";
	}

	@RequestMapping("/recruitStudy.do")
	public String recruitStudy(HttpServletRequest req, Model model) {
		System.out.println("recruitStudy() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "recruitStudy";
	}

	@RequestMapping("/signUp.do")
	public String signUp(HttpServletRequest req) {
		System.out.println("signUp() 메소드 실행");

		return "signUp";
	}

	@RequestMapping("/suggestions.do")
	public String suggestions(HttpServletRequest req, Model model) {
		System.out.println("suggestions() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "suggestions";
	}

	@RequestMapping("/tipBoard.do")
	public String tipDL(HttpServletRequest req, Model model) {
		System.out.println("tipBoard() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "tipBoard";
	}

	@RequestMapping("/adminBoard.do")
	public String adminBoard(Model model) {
		System.out.println("adminBoard() 메소드 호출");

		command = new AdminBoardCommand();
		command.execute(model);

		return "adminBoard";
	}

	@RequestMapping("/adminMember.do")
	public String adminMember(Model model) {
		System.out.println("adminMember() 메소드 호출");

		command = new AdminMemberCommand();
		command.execute(model);

		return "adminMember";
	}

	// 글쓰기 페이지
	@RequestMapping("/write.do")
	public String write(Model model) {

		return "board/write";
	}

	// 글쓰기 처리
	@RequestMapping("/writeAction.do")
	public String writeAction(HttpServletRequest req, Model model) {

		model.addAttribute("req", req);
		command = new WriteCommand();
		command.execute(model);

		return "redirect:" + req.getParameter("boardName") + ".do";
	}

	// 상세보기
	@RequestMapping("view.do")
	public String view(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);

		command = new ViewCommand();
		command.execute(model);

		return "board/view";
	}

	@RequestMapping("myPage.do")
	public String myPage(Model model, HttpServletRequest req, HttpSession session) {
		System.out.println("myPage() 메소드 실행");
		System.out.println(session.getAttribute("user_id"));

		model.addAttribute("req", req);
		model.addAttribute("session", session);
		command = new MyPageCommand();
		command.execute(model);
		
		return "myPage";
	}

	@RequestMapping("/editMember.do")
	public String editMember(HttpSession session, HttpServletRequest req, Model model) {

		System.out.println(session.getAttribute("user_id"));
		model.addAttribute("session", session);
		command = new EditMemberCommand();
		command.execute(model);

		return "editMember";
	}

	@RequestMapping("/withDraw.do")
	public String withDraw(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		return "withDraw";
	}

	@RequestMapping(value = "/LoginProcess.do", method = RequestMethod.POST)
	public String LoginProcess(HttpServletRequest req, HttpSession session) {
		System.out.println("LoginProcess() 실행");

		MemberDAO mDao = new MemberDAO();
		boolean isMember = mDao.isMember(req.getParameter("user_id"), req.getParameter("user_pwd"));

		try {
			if (isMember == true) {
				session.setAttribute("user_id", req.getParameter("user_id"));
				session.setAttribute("user_pwd", req.getParameter("user_pwd"));

				System.out.println(session.getAttribute("user_id") + " " + session.getAttribute("user_pwd"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 정보가 없습니다.");
		}

		mDao.close();

		return "redirect:/";
	}

	@RequestMapping("signUpAction.do")
	public String signUpAction(HttpServletResponse response, HttpServletRequest req, Model model) {

		String urlPage;

		model.addAttribute("req", req);

		command = new SignUpCommand();
		command.execute(model);

		Map<String, Object> map = model.asMap();
		int retValue = (Integer) map.get("retValue");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (retValue == 2) {
			out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
		} else {
			out.println("<script>alert('회원가입을 실패하였습니다.');</script>");
		}
		out.flush();

		urlPage = "redirect:home";

		return urlPage;
	}

	@RequestMapping("/logOutAction.do")
	public ModelAndView logOutAction(HttpServletRequest req, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("user_id");
		session.removeAttribute("user_pwd");
		
		mav.setViewName("redirect:/");

		return mav;
	}

	@RequestMapping("/IDCheck.do")
	public String IDCheck(HttpServletRequest req) {

		return "IDCheck";
	}

	@RequestMapping("/modifyAction.do")
	public void modifyAction(HttpServletRequest req, HttpServletResponse rep, HttpSession session, Model model) throws IOException {

		System.out.println("modifyAction() 메소드 실행");

		model.addAttribute("req", req);

		command = new MemberModifyCommand();
		command.execute(model);

		Map<String, Object> map = model.asMap();
		int ret = (Integer) map.get("modeValue");
		
		PrintWriter out = null;
		
		if (ret==1){
			
			out = rep.getWriter();
			
			rep.setContentType("text/html; charset='UTF-8'"); 
			out.println("<script>");
			out.println("alert('정보 수정을 완료하였습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			out = rep.getWriter();
			
			rep.setContentType("text/html; charset='UTF-8'"); 
			out.println("<script>");
			out.println("alert('정보 수정을 실패하였습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}

	@RequestMapping("deleteAction.do")
	public void deleteAction(HttpServletRequest req, HttpServletResponse rep, Model model, HttpSession session) throws IOException {

		System.out.println("deleteAction() 메소드 실행");

		model.addAttribute("req", req);

		command = new MemberDeleteCommand();
		command.execute(model);

		Map<String, Object> map = model.asMap();
		int ret = (Integer) map.get("modeValue");
		
		
		PrintWriter out = null;
		
		if (ret==1){
			
			out = rep.getWriter();
			
			rep.setContentType("text/html; charset='UTF-8'"); 
			out.println("<script>");
			out.println("alert('탈퇴 완료! 이용해주셔서 감사합니다.');");
			out.println("history.back();");
			out.println("</script>");
			
			session.invalidate();
		}
		else{
			out = rep.getWriter();
			
			rep.setContentType("text/html; charset='UTF-8'"); 
			out.println("<script>");
			out.println("alert('탈퇴 실패! 정보 오류');");
			out.println("history.back();");
			out.println("</script>");
		}
	}

	@RequestMapping("search.do")
	public String search(HttpServletRequest req, Model model) {
		System.out.println("search() 메소드 호출");

		model.addAttribute("req", req);
		command = new SearchCommand();
		command.execute(model);

		return "redirect:" + req.getParameter("boardName") + ".do";
	}

	@RequestMapping("reply.do")
	public String reply(HttpServletRequest req, Model model) {

		model.addAttribute("req", req);
		command = new ReplyCommand();
		command.execute(model);
		
		return "board/replyWrite";
	}
	
	@RequestMapping("replyAction.do")
	public String replyAction(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		command = new ReplyActionCommand();
		command.execute(model);
		
		return "redirect:"+ req.getParameter("boardName") +".do?boardName="+req.getParameter("boardName")+"&nowPage="+ req.getParameter("nowPage");
	}

	@RequestMapping("/board/ModifyAction.do")
	public String pModifyAction(HttpServletRequest req, Model model) {

		model.addAttribute("req", req);

		command = new ModeCommand();
		command.execute(model);

		return "redirect:/" + req.getParameter("boardName") + ".do";
	}

	@RequestMapping("/board/modify.do")
	public String modify(HttpServletRequest req, Model model) {

		model.addAttribute("req", req);

		command = new ModifyInfoCommand();
		command.execute(model);

		return "board/modify";
	}

	@RequestMapping("/editAction.do")
	public String editAction(HttpServletRequest req, Model model) {

		model.addAttribute("req", req);

		command = new ModeCommand();
		command.execute(model);

		return "redirect:/" + req.getParameter("boardName") + ".do";
	}
	
	@RequestMapping("/portfolioBoard.do")
	public String portfolioBoard(HttpServletRequest req, Model model) {
		System.out.println("portfolioBoard() 메소드 실행");

		model.addAttribute("req", req);
		command = new PortfolioBoardCommand();
		command.execute(model);
		
		return "fileupload/portfolioBoard";
	}

	@RequestMapping("/portfolioWrite.do")
	public String portfolioWrite() {

		return "fileupload/portfolioWrite";
	}
	

	@RequestMapping("/QnAcategory.do")
	public String QnACategoryView(HttpServletRequest req, Model model){
		System.out.println("QnAcategory() 메소드 실행");
		
		System.out.println(req.getParameter("category"));
		
		model.addAttribute("req", req);
		command = new CategoryViewCommand();
		command.execute(model);
		
		return "QnACategoryView";
	}
	
	@RequestMapping("/tipcategory.do")
	public String tipCategoryView(HttpServletRequest req, Model model){
		System.out.println("QnAcategory() 메소드 실행");
		
		System.out.println(req.getParameter("category"));
		
		model.addAttribute("req", req);
		command = new CategoryViewCommand();
		command.execute(model);
		
		return "tipCategoryView";
	}
	@RequestMapping("/commChoice.do")
	public String choice(HttpServletRequest req, Model model) {
		System.out.println("recomCnt() 메소드 실행");
		System.out.println("값넘어옴"+ req.getParameter("num"));
		
		model.addAttribute("req", req);
		command = new RecomCntCommand();
		command.execute(model);
		
		return "board/recomCntAction";
	}

	@RequestMapping("/portfolioWriteAction.do")
	public String portfolioWriteAction(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);

		command = new PortfolioWriteCommand();
		command.execute(model);

		return "fileupload/portfolioBoard";
	}
	
	@RequestMapping("portfolioView.do")
	public String portfolioView(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);

		command = new PortfolioViewCommand();
		command.execute(model);

		return "fileupload/portfolioView";
	}
	
	@RequestMapping("selectMemberDelete.do")
	public String selectMemberDelete(Model model, HttpServletRequest req){
		System.out.println("회원삭제 실행");
		
		model.addAttribute("req", req);
		
		command = new SelectMemberDeleteCommand();
		command.execute(model);
		
		return "adminMember";
	}
	
	@RequestMapping("selectPostDelete.do")
	public String selectPostDelete(Model model, HttpServletRequest req){
		
		System.out.println("선택 게시물 삭제 실행");
		
		model.addAttribute("req", req);
		
		command = new SelectPostDeleteCommand();
		command.execute(model);
		
		return "adminBoard";
	}
	
	@RequestMapping("memberEdit.do")
	public String memberEdit(Model model, HttpServletRequest req){
		
		model.addAttribute("req", req);
		
		command = new AdminEditCommand();
		command.execute(model);
		
		return "process/memberEdit";
	}
	
	@RequestMapping("gradeEdit.do")
	public String gradeEdit(Model model, HttpServletRequest req){
		
		model.addAttribute("req", req);
		
		command = new GradeEditCommand();
		command.execute(model);
		
		return "adminMember";
	}
	
	@RequestMapping("expEdit.do")
	public String expEdit(Model model, HttpServletRequest req){
		
		model.addAttribute("req", req);
		
		command = new ExpEditCommand();
		command.execute(model);
		
		return "adminMember";
	}
}
