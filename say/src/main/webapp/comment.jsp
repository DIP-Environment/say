<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- AJAX_COMMENT 테이블을 이용하여 댓글에 대한 저장/변경/삭제 기능을 제공하고 댓글목록을 검색하려 출력하는 JSP문서 --%>
<%-- => 즉, 하나의 페이지로 모든 기능에대해 비동기식으로 요청 처리 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
h1 {
	text-align: center;
}
.comment_table {
	widows: 500p;
	margin: 0 auto;
	border: 2px solid #cccccc;
	border-collapse: collapse;
}
.title {
	width: 100px;
	padding: 5px 10px;
	text-align: center;
	border: 1px solid #cccccc;
}
.input {
	widows: 400p;
	padding: 5px 10px;
	border: 1px solid #cccccc;
}
.btn {
	text-align: center;
	border: 1px solid #cccccc;
}

#comment_add {
	margin-bottom: 5px;
}

#comment_modify, #comment_remove {
	margin: 10px;
	display: none;
}
#add_message, #modify_message {
	widows: 500p;
	margin: 0 auto;
	margin-bottom: 20px;
	text-align: center;
	color: red;
}

#remove_message {
	padding: 3px;
	text-align: center;
	border: 1px solid #cccccc;
}
.comment {
	width: 550px;
	margin: 0 auto;
	margin-bottom: 5px;
	padding: 3px;
	border: 2px solid #cccccc;
}
.no_comment {
	width: 550px;
	margin: 0 auto;
	padding-bottom: 3px;
	border: 2px solid #cccccc;
	text-align: center;
}
</style>
</head>
<body>
	<h1>AJAX댓글</h1>
	<hr>
	<%-- 댓글 입력 영역 --%>
	<div id="comment_add">
		<table class="comment_table">
			<tr>
				<td class="title">작성자</td>
				<td class="input"><input type="text" id="writer"></td>
			</tr>
			<tr>
				<td class="title">댓글내용</td>
				<td class="input"><textarea rows="3" cols="50" id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="btn"><button type="button" id="add_btn">댓글등록</button></td>
			</tr>
		</table>
		<div id="add_message">&nbsp;</div>
	</div>

	<%-- 댓글 목록 출력 영역 --%>
	<div id="comment_list"></div>
	
	<%-- 댓글 변경 영역 --%>
	<div id="comment_modify">
		<table class="comment_table">
			<tr>
				<td class="title">작성자</td>
				<td class="input"><input type="text" id="modify_writer"></td>
			</tr>
			<tr>
				<td class="title">댓글내용</td>
				<td class="input"><textarea rows="3" cols="50" id="modify_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="btn"><button type="button" id="modify_btn">댓글수정</button>&nbsp;
				<button type="button" id="modify_cancel_btn">수정취소</button></td>
			</tr>
		</table>
		<div id="modify_message">&nbsp;</div>
	</div>

	<%-- 댓글 삭제 영역 --%>
	<div id="comment_remove">
		<div id="remove_message">
			<b>정말로 삭제하꼬니?</b>
			<button type="button" id="remove_btn">댓글삭제</button>
			<button type="button" id="remove_cancel_btn">삭제취소</button>
		</div>
	</div>
	
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
						$("#comment_list").append("<div id='comment_"+this.num+"' class='comment' num='"+this.num+"'><b>["+this.writer+"]</b><br>"+this.content.replace(/\n/g, "<br>")+"<br>("+this.writeDate+")<br><button type='button' onclick='modifyComment("+this.num+");'>수정</button>&nbsp;<button type='button' onclick='removeComment("+this.num+");'>삭제</button></div>");
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
​