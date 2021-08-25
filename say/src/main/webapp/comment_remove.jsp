<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="reply.dao.*"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 댓글 번호를 전달받아 삭제하고 응답결과를 xml문서로 반환--%>
<%
	if(request.getMethod().equals("GET")){
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	
	int num=Integer.parseInt(request.getParameter("num"));
	
	int rows= AjaxCommentDAO.getDAO().deleteAjaxComment(num);
%>
<result>
	<% if (rows>0) {%>
		<code>success</code>
	<%} else {%>
		<code>fail</code>
	<%}%>
</result>