<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="reply.dao.*"%>
<%-- 댓글정보를 전달받아 JAJX_COMMENT테이블에 저장하고 저장결과응 XML텍스트뎅터로 응답하는 JSP문서 --%>
<%
	if(request.getMethod().equals("GET")){
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	
	AjaxCommentDTO ajaxComment=new AjaxCommentDTO();
	ajaxComment.setNum(num);
	ajaxComment.setWriter(writer);
	ajaxComment.setContent(content);

	// 혹시모를 저장실패에대하여 저장행의 개수를 받아 저장하고 아래에서 처리
	int rows=AjaxCommentDAO.getDAO().updateAjaxComment(ajaxComment);
%>
<result>
	<% if (rows>0) {%>
		<code>success</code>
	<%}else {%>
		<code>fail</code>
	<%}%>

</result>