package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.kic.dev1.dto.MemberDto;
import kr.co.kic.dev1.util.ConnLocator;

public class MemberDao {
	private static MemberDao single;
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		if(single == null) {
			single = new MemberDao();
		}
		return single;
	}
	
	public boolean insert(MemberDto m) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO member(m_id,m_email,m_pwd) ");
			sql.append("VALUES(?,?,PASSWORD(?))");
			
			pstmt = con.prepareStatement(sql.toString());
			
			int index = 1;
			pstmt.setString(index++, m.getId());
			pstmt.setString(index++, m.getEmail());
			pstmt.setString(index, m.getPassword());
			
			pstmt.executeUpdate();
			
			isSuccess = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				// con 객체를 종료하는 것이 아니라
				// Connection Pool에 Connection 객체를 반납하는 것이다.
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
}
