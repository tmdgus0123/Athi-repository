package com.kosmo.athi.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionMonitoring implements HttpSessionListener{
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		
		if(event.getSession().isNew()){
			execute(event);
		}
	}
	
	private void execute(HttpSessionEvent event){
		System.out.println("방문자수 카운터 시작");
		
		int total_vcnt = 0;
		
		MonitoringDAO mDao = MonitoringDAO.getInstance();
		List<Date> dateList = new ArrayList<Date>(); // 필요한 날짜부터 현재까지 날짜 리스트
		List<Integer> visitList = new ArrayList<Integer>(); // 필요한 날짜부터 현재까지 방문자수 리스트
		int dateRange = 7; // 일주일
		
		//세션이 생성되면 DB에 추가한다
		mDao.setVisitCount();
		//전체 방문자수
		total_vcnt = mDao.getTotalCount();

		//지정한 범위만큼 날짜와 방문자수를 list에 저장한다
		for(int i=dateRange-1; i>=0; i--) {
			dateList.add(mDao.getSelectDate(i));
			visitList.add(mDao.getSelectCount(i));
		}
		
		//세션에 값 전달
		HttpSession session = event.getSession();
		session.setAttribute("total_vcnt", total_vcnt);
		session.setAttribute("dateList", dateList);
		session.setAttribute("visitList", visitList);
		session.setAttribute("dateRange", dateRange);
		mDao.close();
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		
	}
}
