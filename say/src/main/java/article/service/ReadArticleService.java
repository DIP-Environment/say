package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import article.model.ArticleContent;
import article.model.ArticleData;
import jdbc.connection.ConnectionProvider;

public class ReadArticleService {
	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public ArticleData getArticle(int articleNum, boolean increaseReadCount) throws SQLException, ParseException {
		try(Connection conn = ConnectionProvider.getConnection()){
			Article article = articleDao.selectById(conn, articleNum);
			if(article == null) {
				throw new ArticleNotFoundException();
			}
			ArticleContent content = contentDao.selectById(conn, articleNum);
			if(content == null) {
				throw new ArticleContentNotFoundException();
			}
//			if(increaseReadCount) {
//				articleDao.increaseReadCount(conn, articleNum);
//			}
			return new ArticleData(article, content);
		}catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	}
}
