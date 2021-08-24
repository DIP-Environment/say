package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteArticleService {
	
	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public void delete(DeleteRequest delReq) throws SQLException{
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Article article = articleDao.selectById(conn, delReq.getArticleNumber()); //글번호
			if(article == null) { //글을 못 가지고 오면
				throw new ArticleNotFoundException();
			}
			if(!canModify(delReq.getUserId(), article)) { //인증 권한이 되는지?
				throw new PermissionDeniedException();
			}
			articleDao.delete(conn, delReq.getArticleNumber()); //db내용
			contentDao.delete(conn, delReq.getArticleNumber());
			conn.commit();
		}catch (SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(ex);
		}catch (PermissionDeniedException ex) {
			JdbcUtil.rollback(conn);
		}finally {
			JdbcUtil.close(conn);
		}
	}

	private boolean canModify(String deleteUserId, Article article) {
		return article.getWriter().getId().equals(deleteUserId);
	}
}
