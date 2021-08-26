<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@page import="reply.utility.Utility"%>
<%@page import="reply.dao.*"%>
<%@page import="java.util.List"%>
<%
	//전체검색
	List<AjaxCommentDTO> ajaxCommentList=AjaxCommentDAO.getDAO().selectAjaxCommentList();
%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Comment">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>say_detail</title>
    <link rel="stylesheet" href="css/nicepage.css" media="screen">
	<link rel="stylesheet" href="css/say_detail.css" media="screen">
    <script class="u-script" type="text/javascript" src="js/jquery-1.9.1.min.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="js/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 3.23.8, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/envLogo.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="say_detail">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body"><header class="u-clearfix u-header u-header" id="sec-c967"><div class="u-clearfix u-sheet u-sheet-1">
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px; font-weight: 700; text-transform: uppercase;">
            <a class="u-button-style u-custom-active-border-color u-custom-border u-custom-border-color u-custom-borders u-custom-hover-border-color u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg><use xlink:href="#menu-hamburger"></use></svg>
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;"><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</symbol>
</defs></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-nav u-spacing-30 u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-border-2 u-border-active-palette-1-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-button-style u-nav-link u-text-active-palette-1-base u-text-grey-90 u-text-hover-grey-90" href="say_list.html" style="padding: 10px 0px;">Say</a>
</li><li class="u-nav-item"><a class="u-border-2 u-border-active-palette-1-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-button-style u-nav-link u-text-active-palette-1-base u-text-grey-90 u-text-hover-grey-90" href="tip.html" style="padding: 10px 0px;">Tip</a>
</li><li class="u-nav-item"><a class="u-border-2 u-border-active-palette-1-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-button-style u-nav-link u-text-active-palette-1-base u-text-grey-90 u-text-hover-grey-90" style="padding: 10px 0px;">Talk</a>
</li></ul>
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="say_list.html" style="padding: 10px 0px;">Say</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="tip.html" style="padding: 10px 0px;">Tip</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" style="padding: 10px 0px;">Talk</a>
</li></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
        <a href="https://nicepage.com" class="u-image u-logo u-image-1" data-image-width="200" data-image-height="94">
          <img src="images/envLogo.png" class="u-logo-image u-logo-image-1">
        </a><span class="u-icon u-icon-circle u-text-palette-1-base u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 128 128" style=""><use xlink:href="#svg-4049"></use></svg><svg class="u-svg-content" viewBox="0 0 128 128" id="svg-4049"><path d="m64 17.43a46.754 46.754 0 0 0 -27.4 84.638l.043.03.008.006a46.775 46.775 0 0 0 54.692 0l.046-.032a46.754 46.754 0 0 0 -27.389-84.642zm-24.62 82.305v-3.025a22.766 22.766 0 0 1 22.77-22.78h1.735.115s.076 0 .115 0h1.735a22.766 22.766 0 0 1 22.77 22.78v3.025a43.233 43.233 0 0 1 -49.24 0zm24.735-29.3h-.23a15.518 15.518 0 0 1 -15.454-15.5c0-.4.017-.806.051-1.214a15.571 15.571 0 0 1 31.037.012c.033.4.05.8.05 1.2a15.518 15.518 0 0 1 -15.454 15.5zm28.005 26.586v-.311a26.261 26.261 0 0 0 -18.82-25.199 18.966 18.966 0 0 0 9.766-16.58c0-.5-.021-1-.062-1.484a19.07 19.07 0 0 0 -38.013-.012c-.042.491-.063.994-.063 1.5a18.959 18.959 0 0 0 9.772 16.576 26.26 26.26 0 0 0 -18.82 25.199v.311a43.25 43.25 0 1 1 56.24 0z"></path></svg></span>
      </div></header>
    <section class="u-align-center u-clearfix u-image u-shading u-section-1" src="" data-image-width="1280" data-image-height="851" id="sec-e4b2">
      <div class="u-align-left u-clearfix u-sheet u-sheet-1">
        <h3 class="u-text u-text-1">DE​TAIL</h3>
        <h4 class="u-text u-text-default u-text-2">Home &gt; Say &gt; Detail</h4>
      </div>
    </section>
    <section class="u-clearfix u-section-2" id="sec-aec7">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="fr-view u-align-center u-clearfix u-rich-text u-text u-text-1">
       <!--  title -->
          <h1 style="text-align: center;"><c:out value=" ${articleData.article.title }"/></h1>
          <p style="text-align: center;">
            <br>
          </p>
          <!-- content -->
          <p style="text-align: center;">
            <span style="line-height: 2.0;"><u:pre value="${articleData.content }"/></span>
          </p>
        </div>
  		<!-- date -->
        <p class="u-align-right u-text u-text-2">${articleData.article.regDate }</p>
		<c:if test="${authUser.id == articleData.article.writer.id }">
			<a href="articleModify.do?no=${articleData.article.number }" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-1">수정</a>
			<a href="articleDelete.do?no=${articleData.article.number }" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-1">삭제</a>
		</c:if>
		<c:set var="pageNo" value="${empty param.pageNo ? '1': param.pageNo }"/>
		<a href="articleList.do?pageNo=${pageNo }" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-1">목록</a>
        <!-- <a href="https://nicepage.com/c/architecture-building-website-templates" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-1">삭제</a>
        <a href="https://nicepage.com/c/architecture-building-website-templates" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-2">수정</a> -->
      </div>
    </section>
   <!-- 댓글 write -->
   <section class="u-align-center u-border-2 u-border-palette-3-base u-clearfix u-palette-3-light-3 u-section-3" id="sec-13f6">
      <div class="u-clearfix u-sheet u-sheet-1">
      	<!-- title -->
        <h2 class="u-subtitle u-text u-text-default u-text-1">Comment<span style="font-weight: 700;"></span>
        </h2>
        <div class="u-form u-form-1">
        <!-- //form 시작 -->
          <form action="#" method="POST" class="u-clearfix u-form-spacing-15 u-form-vertical u-inner-form" style="padding: 15px;" source="email" name="form">
            <input type="hidden" id="siteId" name="siteId" value="618634">
            <input type="hidden" id="pageId" name="pageId" value="623010">
            <div class="u-form-group u-form-message u-form-group-1">
           	<!-- 입력란 -->
              <label for="message-6797" class="u-form-control-hidden u-label">Address</label>
              <textarea placeholder="Enter your message" rows="4" cols="50" id="content" name="message" class="u-border-1 u-border-grey-30 u-input u-input-rectangle" required=""></textarea>
            </div>
            <div class="u-align-right u-form-group u-form-submit u-form-group-2">
            <!-- 등록버튼 -->
              <!-- <a href="#" class="u-btn u-btn-submit u-button-style">등록</a>
              <input type="submit" value="submit" class="u-form-control-hidden"> -->
              <button type="button" id="add_btn" class="u-btn u-btn-submit u-button-style">댓글등록</button>
            </div>
            <div class="u-form-send-message u-form-send-success">Thank you! Your message has been sent.</div>
            <div class="u-form-send-error u-form-send-message">Unable to send your message. Please fix errors then try again.</div>
            <input type="hidden" value="" name="recaptchaResponse">
          </form>
        </div>
      </div>
    </section>
    <!-- <section class="u-align-center u-border-2 u-border-palette-3-base u-clearfix u-palette-3-light-3 u-section-3" id="sec-13f6">
      <div class="u-clearfix u-sheet u-sheet-1">
      	title
        <h2 class="u-subtitle u-text u-text-default u-text-1">Comment<span style="font-weight: 700;"></span>
        </h2>
        <div class="u-form u-form-1">
        //form 시작
          <form action="#" method="POST" class="u-clearfix u-form-spacing-15 u-form-vertical u-inner-form" style="padding: 15px;" source="email" name="form">
            <input type="hidden" id="siteId" name="siteId" value="618634">
            <input type="hidden" id="pageId" name="pageId" value="623010">
            <div class="u-form-group u-form-message u-form-group-1">
           	입력란
              <label for="message-6797" class="u-form-control-hidden u-label">Address</label>
              <textarea placeholder="Enter your message" rows="4" cols="50" id="message-6797" name="message" class="u-border-1 u-border-grey-30 u-input u-input-rectangle" required=""></textarea>
            </div>
            <div class="u-align-right u-form-group u-form-submit u-form-group-2">
            등록버튼
              <a href="#" class="u-btn u-btn-submit u-button-style">등록</a>
              <input type="submit" value="submit" class="u-form-control-hidden">
              <button type="button" id="add_btn" class="u-btn u-btn-submit u-button-style">댓글등록</button>
            </div>
            <div class="u-form-send-message u-form-send-success">Thank you! Your message has been sent.</div>
            <div class="u-form-send-error u-form-send-message">Unable to send your message. Please fix errors then try again.</div>
            <input type="hidden" value="" name="recaptchaResponse">
          </form>
        </div>
      </div>
    </section> -->
    <!-- 댓글 read -->
    <%-- 댓글 목록 출력 영역 --%>
	<div id="comment_list"></div>
	
    <!-- <section class="u-clearfix u-palette-3-light-3 u-section-4" id="sec-9954">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h3 class="u-text u-text-1">작성자이름</h3>
        <p class="u-text u-text-2">2021.08.01 am 10:00</p>
        <p class="u-text u-text-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim 
veniam, quis nostrud exercitation <a href="" class="u-border-2 u-border-black u-border-hover-palette-1-base u-btn u-button-style u-none u-text-body-color u-btn-1">ullamco laboris</a> nisi ut aliquip ex ea 
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate 
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint 
occaecat cupidatat non proident, sunt in culpa qui officia deserunt 
mollit anim id est laborum. 
        </p>
      </div>
    </section> -->
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-4164"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Sample text. Click to select the text box. Click again or double click to start editing the text.</p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/css-templates" target="_blank">
        <span>CSS Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="https://nicepage.com/html-website-builder" target="_blank">
        <span>HTML Builder</span>
      </a>. 
    </section>
    
   <!-- Ajax -->
   <script type="text/javascript">
	// [문서가 실행되자마자 목록을 출력하기위해 가장먼저 호출]
	loadComment();
	
	// 댓글목록을 제공하는 JSP문서를 요청하여 응답받아 출력하는 함수
	function loadComment() {
		$.ajax({
			type: "GET",
			url: "comment_list.jsp",
			dataType: "xml",
			success: function(xmlDoc) {
				// 코드확인
				var code=$(xmlDoc).find("code").text();
				if (code=="success") { 
					// data를 배열로 저장 >> 이때 꼮꼮 JSON객체로 변환처리해줘야함미덩 [object객체로 인식!]
					var commentArray=JSON.parse($(xmlDoc).find("data").text());
					
					// 댓글 출력목록의 초기화
					$("#comment_list").children().remove();
					
					// 반복지시자 이용하여 출력 >> [object객체로 인식!하니까 $넣어서 접근하는고얌]
					$(commentArray).each(function() {
						// 수정을 위해 각각의 div에 고유값인 id를 부여 >> 이때 num활용
						// 삭제를 위해 num부여 >> 이때도 num활용
						$("#comment_list").append("<section class='u-clearfix u-palette-3-light-3 u-section-4' id='sec-9954'><div id='comment_"+this.num+"' class='u-clearfix u-sheet u-sheet-1' num='"+this.num+"'><br><h3 class='u-text u-text-1'>"+this.writer+"</h3><br><p class='u-text u-text-2'>"+this.writeDate+"</p><br><p class='u-text u-text-3'>"+this.content.replace(/\n/g, "<br>")+"</p><br><button class='u-btn u-btn-submit u-button-style' id='replyDeleteBtn' type='button' onclick='removeComment("+this.num+");'>삭제</button>&nbsp;<button class='u-btn u-btn-submit u-button-style' id='replyModifyBtn' type='button' onclick='modifyComment("+this.num+");'>수정</button></div></div></section>");
						});
				} else { 
					var message=$(xmlDoc).find("message").text();
					$("#comment_list").html("<div class='no_comment'>"+message+"</div>");
				}
			},
			error: function(xhr) {
				alert("ERROR CODE : "+xhr.status);
			}
		});
	}
	
	// [댓글등록] 클릭시 호출될 이벤트핸들러 함수 등록
	$("#add_btn").click(function() {
		// 입력값 유효성검사
		var writer=$("#writer").val();
		if(writer=="") {
			$("#add_message").html("작성자를 입력하세용!");
			$("#writer").focus();
			return;
		}
		var content=$("#content").val();
		if(content=="") {
			$("#add_message").html("내용도 입력하세용!");
			$("#content").focus();
			return;
		}
		
		// 입력태그 초기화
		$("#writer").val("");
		$("#content").val("");
		$("#add_message").html("");
		
		// ajax기능으로 요청 및 응답처리
		$.ajax({
			type: "POST",
			url: "comment_add.jsp",
			data: "writer="+writer+"&content="+content,     // QueryString형태로 전달
			dataType: "xml",
			success: function(xmlDoc) {
				var code=$(xmlDoc).find("code").text();
				if(code=="success") {
					loadComment();
				}
			},
			error: function(xhr) {
				alert("ERROR CODE : "+xhr.status);
			}
		});
	});
	
	// 댓글변경 영역을 초기화하는 함수
	function initModify() {
		$("#modify_writer").val("");
		$("#modify_content").val("");
		$("#modify_message").html("&nbsp;");
	}

	// 댓글보기의 [수정] 버튼클릭시 호출되는 이벤트핸들러함수 호출
	function modifyComment(num) {
		initModify();
		// 댓글 삭제영역을 숨김 및 안전한 곳으로 이동
		$("#comment_remove").hide().appendTo(document.documentElement);
		// 댓글 수정영역을 출력 및 해당 댓글의 자식영역으로 이동
		// appendTo(target) : 이동할때 사용하는 메소드
		$("#comment_modify").show().appendTo("#comment_"+num);
		// 댓글 변경영역의 입력태그에 댓글 정보를 출력
		// => 댓글 정보를 검색하여 제공하는 JSP문서를 요청하여 결과를 제공
		$.ajax({
			type: "GET",
			url: "comment_get.jsp",
			data: {"num":num},
			dataType: "xml",
			success: function(xmlDoc) {
				var code=$(xmlDoc).find("code").text();
				if (code=="success") {
					var comment=JSON.parse($(xmlDoc).find("data").text());
					$("#modify_writer").val(comment.writer);
					$("#modify_content").val(comment.content);
				} else {
					// 댓글 변경영역을 RootElement영역의 자식으로 숨김처리 >> 절대 삭제되지않을 안전한 영역으로 이동
					$("#comment_modify").hide().appendTo(document.documentElement);
					$("#add_message").html("댓글이 존재하지 않습니다.");
				}
			},
			error: function(xhr) {
				alert("ERROR CODE : "+xhr.status);
			}
		});
	}
	
	// 댓글수정영역의 [댓글수정] 버튼을 누른 경우 호출될 이벤트핸들러 등록
	// => 변경값을 전달받아 댓글을 변경하는 JSP문서를 요청하여 응답결과 처리 
	$("#modify_btn").click(function() {
		// 댓글변경영역의 부모의 것을 가져와라 라는 뜻 : 엘리먼트의 속성 이용
		var num=$("#comment_modify").parent().attr("num");
		var writer=$("#modify_writer").val();
		if(writer=="") {
			$("#modify_message").html("변경할 작성자를 입력해 주세요.");
			$("#modify_writer").focus();
			return;
		}
		var content=$("#modify_content").val();
		if(content=="") {
			$("#modify_message").html("변경 댓글내용을 입력해 주세요.");
			$("#modify_content").focus();
			return;
		}
		initModify();
		
		// 댓글을 변경하는 JSP문서를 AJAX기능으로 요청하여 응답결과 처리
		$.ajax({
			type: "POST",
			url: "comment_modify.jsp",
			data: {"num":num, "writer":writer, "content":content},
			dataType: "xml",
			success: function(xmlDoc) {
				var code=$(xmlDoc).find("code").text();
				if(code=="success") {
					$("#comment_modify").hide().appendTo(document.documentElement);
					loadComment();
				} else {
					$("#modify_message").html("댓글을 변경하지 못했습니다.");
				}
			}, 
			error: function(xhr) {
				alert("ERROR CODE : "+xhr.status);
			}
		});
		
	});
	
	// 댓글수정영역의 [수정취소] 버튼을 누른 경우 호출될 이벤트핸들러 등록
	$("#modify_cancel_btn").click(function() {
		initModify();
		$("#comment_modify").hide().appendTo(document.documentElement);
	});
	
	// 댓글의 [삭제]버튼 클릭시 호출될 이벤트핸들러 등록
	function removeComment(num) {
		$("#comment_modify").hide().appendTo(document.documentElement);
		$("#comment_remove").show().appendTo("#comment_"+num);
	}
	
	// 댓글삭제영역의 [삭제취소] 버튼을 누른 경우 호출될 이벤트핸들러 등록
	$("#remove_cancel_btn").click(function() {
		$("#comment_remove").hide().appendTo(document.documentElement);
	});
	
	// 댓글삭제영역의 [댓글삭제] 버튼을 누른 경우 호출될 이벤트핸들러 등록
	$("#remove_btn").click(function() {
		var num=$("#comment_remove").parent().attr("num");
		$.ajax({
			type: "POST",
			url: "comment_remove.jsp",
			data: {"num":num},
			dataype: "xml",
			success: function(xmlDoc) {
				var code=$(xmlDoc).find("code").text();
				if(code=="success") {
					$("#comment_remove").hide().appendTo(document.documentElement);
					loadComment();
				}
			},
			error: function(xhr) {
				alert("ERROR CODE : "+xhr.status);
			}
		});
	});
	</script>
  </body>
</html>
					