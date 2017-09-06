package com.kosmo.athi.command;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.athi.model.BoardDAO;

public class PortfolioWriteCommand implements ICommand {

	@Override
	public void execute(Model model) {

		System.out.println("파일업로드 진행 중");
		// 파일이 저장될 path 설정
		String path = "C:\\Users\\user\\git\\Athi-repository\\Athi\\src\\main\\webapp\\resources\\images";

		Map<String, Object> returnObject = new HashMap<String, Object>();
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
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
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8");// 한글깨짐방지

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
				file.put("fileName", saveFileName);
				file.put("sfile", serverFile);
				resultList.add(file);

			}
			
			returnObject.put("files", resultList);
			returnObject.put("params", mhsr.getParameterMap());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		catch (IllegalStateException e) {
			e.printStackTrace();
		}

		catch (IOException e) {
			e.printStackTrace();
		}

		model.addAttribute("returnObject", returnObject);
		
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		List list = (List)returnObject.get("files");
		Map listMap = (Map)list.get(0);
		String fileName = (String)listMap.get("fileName");
		String language = req.getParameter("language");
		
		BoardDAO dao = new BoardDAO();
		
		dao.portfolioWrite(id, title, content, fileName, language);
		
		dao.close();
	}

	// uuid생성
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
