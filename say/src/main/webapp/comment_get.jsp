<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="reply.utility.Utility"%>
<%@page import="reply.dao.*"%>
<%-- 댓글번호를 전달받아 AJAX_COMMENT 테이블에 저장된 해당 댓글을 검색하여 XML텍스트데이터로 전달하는 JSP 문서 --%>
<%
	if(request.getParameter("num")==null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	int num=Integer.parseInt(request.getParameter("num"));
	
	AjaxCommentDTO ajaxComment=AjaxCommentDAO.getDAO().selectAjaxComment(num);
%>
<result>
	<% if(ajaxComment!=null) { %>
	<code>success</code>
	<data><![CDATA[
		{"num":<%=ajaxComment.getNum()%>
		,"writer":"<%=Utility.toJSON(ajaxComment.getWriter())%>"
		,"content":"<%=Utility.toJSON(ajaxComment.getContent())%>"
		,"writeDate":"<%=ajaxComment.getWriteDate().substring(0,19)%>"}
	]]>
	</data>
	<% } else { %>
	<code>empty</code>
	<% } %>	
</result>