package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import article.dao.ArticleDao;
import article.model.Article;
import jdbc.connection.ConnectionProvider;

public class ListArticleService {
	
	private ArticleDao articleDao = new ArticleDao();
	private int size = 10;
	
	public ArticlePage getArticlePage(int pageNum) throws SQLException, ParseException {
		try(Connection conn = ConnectionProvider.getConnection()) {
			int total = articleDao.selectCount(conn);
			List<Article> content = articleDao.select(conn, (pageNum - 1) * size, size);
			return new ArticlePage(total, pageNum, size, content);
		}catch (SQLException ex) {
			throw new RuntimeException();
		}
	}
}
