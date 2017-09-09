package com.kosmo.athi.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MonitoringDAO {
	
	private static MonitoringDAO mDao;
	private static Connection conn;
	private static PreparedStatement psmt;
	private static ResultSet rs;
	
	private MonitoringDAO(){DBConnection();}
	public static MonitoringDAO getInstance(){
		if(mDao==null){
			mDao = new MonitoringDAO();
		}
		return mDao;
	}
	
	private void DBConnection(){
		
		try{
			Context ctx = new InitialContext();
			DataSource source = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
			conn = source.getConnection();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void setVisitCount() {
		System.out.println("setVisitCount() 실행");
		
		try{
			String sql = "INSERT INTO visit VALUES (sysdate)";
			
			psmt = conn.prepareStatement(sql);
			psmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int getTotalCount() {
		System.out.println("getTotalCount() 실행");
		int retVal = 0;
		
		try{
			String sql = "SELECT count(*) FROM visit";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
		
			retVal = rs.getInt(1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return retVal;
	}
	
	//이전 날짜 가져오기
	public Date getSelectDate(int num) {
		Date date = null;
		try {
			String sql = "SELECT sysdate - "+ num +" FROM DUAL";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			
			date = rs.getDate(1);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return date;
	}
	
	//이전 날짜 방문자수 가져오기
	public int getSelectCount(int num) {
		System.out.println("getSelectCount() 실행");
		int retVal = 0;
		
		try{
			String sql = "SELECT count(*) FROM visit WHERE "
					+ " to_date(v_date, 'YYYY/MM/DD') = to_date(sysdate - "+ num +", 'YYYY/MM/DD')";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			
			retVal = rs.getInt(1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return retVal;
	}
	
	public void close() {
		try {
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
