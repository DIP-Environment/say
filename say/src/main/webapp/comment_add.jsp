<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="reply.dao.*"%>
<%-- 댓글 정보를 전달받아 AJAX_COMMENT테이블에 저장하고 저장결과를 XML텍스트데이터로 응답하는 JSP문서 --%>
<%
	// 비정상적인 요청에대한 처리
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	// 한글 입력값에 대한 처리
	request.setCharacterEncoding("UTF-8");
	
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	int bno=Integer.parseInt(request.getParameter("bno"));
	System.out.println("bno=>" + bno);
	
	AjaxCommentDTO ajaxComment=new AjaxCommentDTO();
	ajaxComment.setWriter(writer);
	ajaxComment.setContent(content);
	ajaxComment.setBno(bno);
	
	// 저장을 실패할 경우를 대비하여 아래같이 rows받아서xml문서에 활용
	int rows=AjaxCommentDAO.getDAO().insertAjaxComment(ajaxComment);
%>
<result>
	<% if (rows>0) { %>
		<code>success</code>
	<% } else { %>
		<code>fail</code>
	<% } %>
</result>