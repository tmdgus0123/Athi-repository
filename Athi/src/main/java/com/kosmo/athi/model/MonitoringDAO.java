package com.kosmo.athi.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public void setVisitCount() throws SQLException{
		
		System.out.println("setTotalCount() 실행");
		
		int retVal = 0;
		
		try{
			String sql = "INSERT INTO visit VALUES(sysdate)";
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(sql);
			retVal = psmt.executeUpdate();
			
			System.out.println(rs);
			
			if(retVal==1){
				conn.commit();
			}
		}
		catch(Exception e){
			conn.rollback();
			e.printStackTrace();
		}
	}
	
	public int getTotalCount() throws SQLException{
		
		System.out.println("getTotalCount() 실행");
		
		int retVal = 0;
		
		try{
			String sql = "SELECT count(*) FROM visit";
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
		
			retVal = rs.getInt(1);
		
			System.out.println(retVal);
			
			if(retVal>0){
				conn.commit();
			}
			
		}
		catch(Exception e){
			conn.rollback();
			e.printStackTrace();
		}
		
		return retVal;
		
	}
	
	public int getTodayCount() throws SQLException{
		
		System.out.println("getTodayCount() 실행");
		
		int retVal = 0;
		
		try{
			String sql = "SELECT count(*) FROM visit WHERE to_date(v_date, 'YYYY-MM-DD') = to_date(sysdate, 'YYYY-MM-DD')";
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			
			retVal = rs.getInt(1);
			
			System.out.println(retVal);
			
			if(retVal>0){
				conn.commit();
			}
		}
		catch(Exception e){
			conn.rollback();
			e.printStackTrace();
		}
		
		return retVal;
	}
}
