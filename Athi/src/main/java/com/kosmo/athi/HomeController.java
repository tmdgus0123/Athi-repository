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
import com.kosmo.athi.command.AdminMemberCommand;
import com.kosmo.athi.command.BoardCommand;
import com.kosmo.athi.command.ICommand;
import com.kosmo.athi.command.MyPageCommand;
import com.kosmo.athi.command.SearchCommand;
import com.kosmo.athi.command.SignUpCommand;
import com.kosmo.athi.command.ViewCommand;
import com.kosmo.athi.command.WriteCommand;
import com.kosmo.athi.command.editMemberCommand;
import com.kosmo.athi.command.memberDeleteCommand;
import com.kosmo.athi.command.memberModifyCommand;
import com.kosmo.athi.command.modeCommand;
import com.kosmo.athi.command.modifyInfoCommand;
import com.kosmo.athi.command.rankListCommand;
import com.kosmo.athi.command.ReplyActionCommand;
import com.kosmo.athi.command.ReplyCommand;
import com.kosmo.athi.model.Constant;
import com.kosmo.athi.model.MemberDAO;

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

		command = new rankListCommand();
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

	@RequestMapping("/QnADesign.do")
	public String QnADesign(HttpServletRequest req, Model model) {
		System.out.println("QnADesign() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "QnADesign";
	}

	@RequestMapping("/QnADevelop.do")
	public String QnADL(HttpServletRequest req, Model model) {
		System.out.println("QnADL() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "QnADevelop";
	}

	@RequestMapping("/QnAProgram.do")
	public String QnAProgram(HttpServletRequest req, Model model) {
		System.out.println("QnAProgram() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "QnAProgram";
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

	@RequestMapping("/tipDevelop.do")
	public String tipDL(HttpServletRequest req, Model model) {
		System.out.println("tipDL() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "tipDevelop";
	}

	@RequestMapping("/tipDesign.do")
	public String tipDesign(HttpServletRequest req, Model model) {
		System.out.println("tipDesign() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "tipDesign";
	}

	@RequestMapping("/tipProgram.do")
	public String tipProgram(HttpServletRequest req, Model model) {
		System.out.println("tipProgram() 메소드 실행");

		model.addAttribute("req", req);
		command = new BoardCommand();
		command.execute(model);

		return "tipProgram";
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
		command = new editMemberCommand();
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

	@RequestMapping("modifyAction.do")
	public String modifyAction(HttpServletResponse response, HttpServletRequest req, Model model) {

		System.out.println("modifyAction() 메소드 실행");

		model.addAttribute("req", req);

		command = new memberModifyCommand();
		command.execute(model);

		Map<String, Object> map = model.asMap();
		int ret = (Integer) map.get("modeValue");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (ret == 1) {
			out.println("<script>alert('정보수정이 완료되었습니다.');</script>");
		} else {
			out.println("<script>alert('정보수정을 실패하였습니다.');</script>");
		}
		out.flush();

		return "redirect:home";
	}

	@RequestMapping("deleteAction.do")
	public String deleteAction(HttpServletResponse response, HttpServletRequest req, HttpSession session, Model model) {

		System.out.println("deleteAction() 메소드 실행");

		model.addAttribute("req", req);

		command = new memberDeleteCommand();
		command.execute(model);

		Map<String, Object> map = model.asMap();
		int ret = (Integer) map.get("modeValue");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (ret == 1) {
			out.println("<script>alert('그동안 이용해주셔서 감사합니다.'); self.close();</script>");
			session.invalidate();
		} else {
			out.println("<script>alert('회원탈퇴에 실패하였습니다!'); self.close();</script>");
		}
		out.flush();

		return "redirect:home";
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

	@RequestMapping("/board/pModifyAction.do")
	public String pModifyAction(HttpServletRequest req, Model model) {

		model.addAttribute("req", req);

		command = new modeCommand();
		command.execute(model);

		return "redirect:/" + req.getParameter("boardName") + ".do";
	}

	@RequestMapping("/board/modify.do")
	public String modify(HttpServletRequest req, Model model) {

		model.addAttribute("req", req);

		command = new modifyInfoCommand();
		command.execute(model);

		return "board/modify";
	}

	@RequestMapping("/editAction.do")
	public String editAction(HttpServletRequest req, Model model) {

		model.addAttribute("req", req);

		command = new modeCommand();
		command.execute(model);

		return "redirect:/" + req.getParameter("boardName") + ".do";
	}

	@RequestMapping("/displayPortfolio.do")
	public String displayPortfolio(Model model) {

		System.out.println("displayPortfolio() 메소드 실행");
		return "displayPortfolio";
	}

	@RequestMapping("/portfolioWrite.do")
	public String portfolioWrite() {

		return "fileupload/portfolioWrite";
	}

	@RequestMapping("/portfolioWriteAction.do")
	public String uploadAction(HttpServletRequest req, Model model) {
		System.out.println("파일업로드 진행중");
		// 파일이 저장될 path 설정
		String path = "C:\\05Git\\athi\\src\\main\\webapp\\resources\\upload";
		Map returnObject = new HashMap();

		try {
			// MultipartHttpServletRequest 생성
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			Iterator iter = mhsr.getFileNames();
			MultipartFile mfile = null;
			String fieldName = "";
			List resultList = new ArrayList();

			// 디렉토리가 없다면 생성
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}

			// 값이 나올때까지
			while (iter.hasNext()) {

				fieldName = (String) iter.next();

				// 내용을 가져와서
				mfile = mhsr.getFile(fieldName);
				String origName;
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8");// 한글깨짐
																								// 방지

				// 파일명이 없다면
				if ("".equals(origName)) {
					continue;
				}

				// 파일 명 변경(uuid로 암호화)
				String ext = origName.substring(origName.lastIndexOf('.'));

				// 확장자
				String saveFileName = getUuid() + ext;

				// 설정한 path에 파일저장
				File serverFile = new File(path + File.separator + saveFileName);
				mfile.transferTo(serverFile);
				Map file = new HashMap();
				file.put("origName", origName);
				file.put("sfile", serverFile);
				resultList.add(file);
			}
			returnObject.put("files", resultList);
			returnObject.put("params", mhsr.getParameterMap());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		model.addAttribute("returnObject", returnObject);
		return "fileupload/portfolioWriteAction";
	}

	// uuid생성
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
