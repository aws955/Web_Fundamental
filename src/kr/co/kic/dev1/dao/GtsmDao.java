package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.kic.dev1.dto.GtsmDto;
import kr.co.kic.dev1.util.ConnLocator;

public class GtsmDao {
	
	private static GtsmDao single;
	private GtsmDao() {}
	public static GtsmDao getInstance() {
		if (single == null) {
			single = new GtsmDao();
		}
		return single;
	}
	
	public ArrayList<GtsmDto> select(int start,int length){
		ArrayList<GtsmDto> list = new ArrayList<GtsmDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT gtsm_seq, gtsm_name, gtsm_email, DATE_FORMAT(gtsm_regdate,'%Y/%m/%d') ");
			sql.append("FROM gtsm ");
			sql.append("ORDER BY gtsm_seq DESC ");
			sql.append("LIMIT ?,? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, length);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				index = 1;
				int seq = rs.getInt(index++);
				String name = rs.getString(index++);
				String email = rs.getString(index++);
				String regdate = rs.getString(index++);
				list.add(new GtsmDto(seq,name,email,regdate));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	
	public int getRows() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) ");
			sql.append("FROM gtsm ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				index = 1;
				count = rs.getInt(index++);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return count;
	}
	
	public boolean insert(GtsmDto g) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO gtsm(gtsm_seq, gtsm_name, gtsm_email, gtsm_pwd, gtsm_regdate) ");
			sql.append("VALUES (NULL,?,?,PASSWORD(?),NOW()) ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(index++, g.getName());
			pstmt.setString(index++, g.getEmail());
			pstmt.setString(index++, g.getPwd());
			
			pstmt.executeUpdate();
			
			isSuccess = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	public boolean isCheckEmail(String email) {
		boolean isExisted = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT gtsm_email ");
			sql.append("FROM gtsm ");
			sql.append("WHERE gtsm_email=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isExisted = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return isExisted;
	}
	
	public GtsmDto select(int seq) {
		GtsmDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;

		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT gtsm_name, gtsm_email, DATE_FORMAT(gtsm_regdate,'%Y/%m/%d') ");
			sql.append("FROM gtsm ");
			sql.append("WHERE gtsm_seq=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, seq);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				index = 1;
				String name = rs.getString(index++);
				String email = rs.getString(index++);
				String regdate = rs.getString(index++);
				obj = new GtsmDto(seq,name,email,regdate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return obj;
	}
	
	public boolean update(GtsmDto g) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE gtsm ");
			sql.append("SET gtsm_name =?, gtsm_email = ? , gtsm_regdate=NOW() ");
			sql.append("WHERE gtsm_seq = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(index++,g.getName());
			pstmt.setString(index++, g.getEmail());
			pstmt.setInt(index++,g.getSeq());
			
			pstmt.executeUpdate();
			
			isSuccess = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	public boolean delete(int seq) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM gtsm ");
			sql.append("WHERE gtsm_seq =? ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(index++,seq);
			
			pstmt.executeUpdate();
			
			isSuccess = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	public GtsmDto isMember(GtsmDto g) {
		GtsmDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;

		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT gtsm_seq, gtsm_name, gtsm_email, DATE_FORMAT(gtsm_regdate,'%Y/%m/%d') ");
			sql.append("FROM gtsm ");
			sql.append("WHERE gtsm_email = ? AND gtsm_pwd = PASSWORD(?); ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++, g.getEmail());
			pstmt.setString(index++, g.getPwd());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				index = 1;
				int seq = rs.getInt(index++);
				String name = rs.getString(index++);
				String email = rs.getString(index++);
				String regdate = rs.getString(index++);
				obj = new GtsmDto(seq,name,email,regdate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return obj;
	}
}
