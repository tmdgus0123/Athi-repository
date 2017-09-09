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
		
		int total_vcnt = 0;
		
		MonitoringDAO mDao = MonitoringDAO.getInstance();
		
		try {
			//세션이 생성되면 DB에 sysdate를 추가한다
			mDao.setVisitCount();
			
			total_vcnt = mDao.getTotalCount();
			
			HttpSession session = event.getSession();
			
			session.setAttribute("total_vcnt", total_vcnt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mDao.close();
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		
	}
}
