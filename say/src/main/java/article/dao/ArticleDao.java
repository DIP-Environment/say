package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import article.model.Writer;
import jdbc.JdbcUtil;

public class ArticleDao {
	public Article insert(Connection conn, Article article) throws SQLException{
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//< ----------------  mariaDB  ----------------------->
			pstmt = conn.prepareStatement("insert into say_article "
					+ "(writer_id, writer_name, title, regdate, moddate) "
					+ "values(?,?,?,?,?)");
			pstmt.setString(1, article.getWriter().getId()); //작성자 아이디
			pstmt.setString(2, article.getWriter().getName()); //작성자 이름
			pstmt.setString(3, article.getTitle()); //글제목
			pstmt.setTimestamp(4, toTimestamp(article.getRegDate()));
			pstmt.setTimestamp(5, toTimestamp(article.getModifiedDate()));
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from say_article"); //마지막 글번호를 rs에 담는다.
				if(rs.next()) {
					Integer newNum = rs.getInt(1); //글번호를 newNum에 담는다.
					return new Article(newNum,
							article.getWriter(),
							article.getTitle(),
							article.getRegDate(),
							article.getModifiedDate());
				}
			}
			return null;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}

	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
	
	public int selectCount(Connection conn) throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from say_article");
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Article> select(Connection conn, int startRow, int size) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//< ----------------  mariaDB  ----------------------->
		try {
			pstmt = conn.prepareStatement("select * from say_article "
					+ "order by article_no desc limit ?,?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Article> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(rs.getInt("article_no"),
				new Writer(
						rs.getString("writer_id"),
						rs.getString("writer_name")),
				rs.getString("title"),
				toDate(rs.getTimestamp("regdate")),
				toDate(rs.getTimestamp("moddate")));
	}

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}
	
	public Article selectById(Connection conn, int no) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from say_article where article_no = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			Article article = null;
			if(rs.next()) {
				article = convertArticle(rs);
			}
			return article;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
//	public void increaseReadCount(Connection conn, int no) throws SQLException{
//		try(PreparedStatement pstmt = 
//				conn.prepareStatement(
//						"update say_article set read_cnt = read_cnt + 1 "
//						+ "where article_no = ?")) {
//				pstmt.setInt(1, no);
//				pstmt.executeUpdate();
//		}
//	}
	
	public int update(Connection conn, int no, String title) throws SQLException{
		//< ----------------  mariaDB  ----------------------->
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update say_article set title=?, moddate=now() "
				+ "where article_no=?")){
			pstmt.setString(1, title);
			pstmt.setInt(2, no);
			return pstmt.executeUpdate();
		}
		

	}
	
	public int delete(Connection conn, int no) throws SQLException{
		try (PreparedStatement pstmt = conn.prepareStatement(
				"delete from say_article where article_no=?")){
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		}
	}
}
