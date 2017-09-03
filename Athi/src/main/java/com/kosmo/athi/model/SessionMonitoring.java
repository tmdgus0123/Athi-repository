package com.kosmo.athi.model;

import java.sql.SQLException;

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
		
		int today_vcnt = 0;
		int total_vcnt = 0;
		
		System.out.println(event.getSession().isNew());
		
		MonitoringDAO mDao = MonitoringDAO.getInstance();
		
		try {
			mDao.setVisitCount();
			
			total_vcnt = mDao.getTotalCount();
			today_vcnt = mDao.getTodayCount();
			
			HttpSession session = event.getSession();
			
			session.setAttribute("totalCnt", total_vcnt);
			session.setAttribute("todayCnt", today_vcnt);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		
	}
}
