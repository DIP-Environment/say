package reply.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.connection.ConnectionProvider;

public class AjaxCommentDAO {
	private static AjaxCommentDAO dao;
	
	public AjaxCommentDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		dao = new AjaxCommentDAO();
	}
	
	public static AjaxCommentDAO getDAO(){
		return dao;
	}
	
	public int insertAjaxComment(AjaxCommentDTO ajaxComment) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			String sql = "INSERT INTO ajax_comment(writer,content,write_date) VALUES(?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ajaxComment.getWriter());
			pstmt.setString(2, ajaxComment.getContent());
			
			rows = pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[ERROR] insertAjaxComment() 메소드의 SQL 오류 >>" + e.getMessage());
		}finally {
			pstmt.close();
			conn.close();
		}
		return rows;
	}
	
	public int updateAjaxComment(AjaxCommentDTO ajaxComment) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			String sql = "UPDATE ajax_comment set writer=?, content=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ajaxComment.getWriter());
			pstmt.setString(2, ajaxComment.getContent());
			pstmt.setInt(3, ajaxComment.getNum());
			
			rows = pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[ERROR] updateAjaxComment() 메소드의 SQL 오류 >>" + e.getMessage());
		}finally {
			pstmt.close();
			conn.close();
		}
		return rows;
	}
	
	public int deleteAjaxComment(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			String sql = "DELETE FROM ajax_comment where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rows = pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[ERROR] deleteAjaxComment() 메소드의 SQL 오류 >>" + e.getMessage());
		}finally {
			pstmt.close();
			conn.close();
		}
		return rows;
	}
	
	public AjaxCommentDTO selectAjaxComment(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AjaxCommentDTO ajaxComment = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM AJAX_COMMENT WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ajaxComment = new AjaxCommentDTO();
				ajaxComment.setNum(rs.getInt("num"));
				ajaxComment.setWriter(rs.getString("writer"));
				ajaxComment.setContent(rs.getString("content"));
				ajaxComment.setWriteDate(rs.getString("write_date"));
			}
		}catch (SQLException e) {
			System.out.println("[ERROR] selectAjaxComment() 메소드의 SQL 오류 >>" + e.getMessage());
		}finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return ajaxComment;
	}
	
	public List<AjaxCommentDTO> selectAjaxCommentList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AjaxCommentDTO> ajaxCommentList = new ArrayList<AjaxCommentDTO>();
		
		try {
			conn = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM AJAX_COMMENT ORDER BY NUM DESC";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AjaxCommentDTO ajaxComment = new AjaxCommentDTO();
				ajaxComment.setNum(rs.getInt("num"));
				ajaxComment.setWriter(rs.getString("writer"));
				ajaxComment.setContent(rs.getString("content"));
				ajaxComment.setWriteDate(rs.getString("write_date"));
				ajaxCommentList.add(ajaxComment);
			}
		}catch (SQLException e) {
			System.out.println("[ERROR] selectAjaxCommentList() 메소드의 SQL 오류 >>" + e.getMessage());
		}finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return ajaxCommentList;
	}
}
