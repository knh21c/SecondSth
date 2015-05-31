<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
var commentSize = '${comments.size()}';
  window.onload=function(){
	  var popup = "${popup}";
	  if(popup != "")
		  alert(popup);
	  
  }
  function addComment(){
	  var nick = '${userInfo.getNick()}';
	  if(document.getElementById("noticeComment").value == "")
		  alert("코멘트를 작성하세요");
	  else if(nick == "")
		  alert("코멘트를 작성하기 위해서는\n로그인이 필요합니다.")
	  else{
		  
		  $.post("./addNoticeComment.do", 
				  {id: '${message.getId()}',
			  comment: $("#noticeComment").val(),
			  nick: '${userInfo.getNick()}'}, function(data){
				  commentSize++;
				  var command = "<tr class='noticeTr'><td class='noticeTd'>" + commentSize + "</td><td class='noticeTd'>" + data.comment.nick + "</td><td class='noticeTd'>" +
				  data.comment.comment + "</td><td class='noticeTd'>" + data.comment.date + "</td></tr>";
				  document.getElementById("commentTable").innerHTML += command;
			  });
		  document.getElementById("noticeComment").value = "";
	  }
  }
  function toIndex(){
	  document.bottomForm.action="./notice.do";
	  document.bottomForm.submit();
  }
  function editFunc(){
	  var administrator = "${userInfo.getAdministrator()}";
	  if(administrator == 1){
		  document.getElementById("contentTd").innerHTML = 
			  '<textarea name="content" id="innerContent" rows="10" cols="100">${message.getContent()}</textarea><br><br>'
			   + '<input type="button" onclick="editCancel()" value="취소" class="noticeBtn"/>&nbsp;&nbsp;'
			   + '<input type="button" onclick="editDo()" value="수정" class="noticeBtn" />';
		  
	  }else{
		  alert("권한이 없습니다.");
	  }
  }
  function delFunc(administrator){
	  if(administrator == 1){
		  if(confirm("정말 삭제하시겠습니까?")){
			  document.bottomForm.id.value="${ message.getId() }";
			  document.bottomForm.action="./delNoticeArticle.do";
			  document.bottomForm.submit();
		  }
	  }else{
		  alert("권한이 없습니다.");
	  }
  }
  function editCancel(){
	  document.getElementById("contentTd").innerHTML = '${message.getContent()}';
  }
  function editDo(){
	  if(confirm("수정 완료 하시겠습니까?")){
		  document.bottomForm.id.value="${ message.getId() }";
		  $.post("./editNoticeArticle.do",
				  {id: $("#innerId").val(), content: $("#innerContent").val()},
				  function(data){
					 document.getElementById("contentTd").innerHTML = data.noticeBoard.content;;
				  });
	  }
  }
</script>
<style>
.noticeTable, .noticeTh, .noticeTd {
/* 	border: 1px solid black; */
	border-collapse: collapse;
}
.noticeTable{
	width: 100%;
	align: center;
}
.noticeTh, .noticeTd {
	padding: 15px;
	text-align: left;
}
.noticeTh {
	background-color: black;
		color: white;
}
.noticeBtn {
	opacity: 0.6;
	
	-webkit-transition: opacity 0.3s;
	-moz-transition: opacity 0.3s;
	-o-transition: opacity 0.3s;
	transition: opacity 0.3s;
}
.noticeBtn:hover {
	opacity: 0.9
}
</style>
</head>
<body>

<fieldset>
  <legend>Content of Article</legend>
  <form id="bottomForm" name="bottomForm" method="post">
  	<table id="innerNoticeTable" class="noticeTable">
  	  <tr class="noticeTr">
  	    <th class="noticeTh" align="left">제목</th>
  	    <th class="noticeTh" align="center">${ message.getTitle() }</th>
  	    <th class="noticeTh" align="left">작성자</th>
  	    <th class="noticeTh" align="center">${ message.getNick() }</th>
  	  </tr>
  	  <tr class="noticeTr">
        <td id="contentTd" class="noticeTd" colspan="4">${message.getContent() }</td>
      </tr>
      <tr class="noticeTr">
        <td class="noticeTd"></td>
      </tr>
    </table>
      <input type="hidden" id="innerId" name="id" />
      <input class="noticeBtn" type="button" name="deleteBtn" value="삭제" onclick="delFunc('${userInfo.getAdministrator()}')"/>
      <input class="noticeBtn" type="button" name="editBtn" value="수정" onclick="editFunc()"/>
      <input class="noticeBtn" type="button" name="listBtn" value="돌아가기" onclick="toIndex()"/>
</form>
</fieldset>
	<table class="noticeTable" id="commentTable">
	  <tr class="noticeTr">
	    <td class="noticeTd">번호</td>
	    <td class="noticeTd">작성자</td>
	    <td class="noticeTd">내용</td>
	    <td class="noticeTd">작성일</td>
	  </tr>
	  <c:forEach var="i" items="${comments}" begin="0" end="${comments.size() }" step="1" varStatus="status">
	    <tr class="noticeTr">
	      <td class="noticeTd">${status.count}</td>
	      <td class="noticeTd">${i.getNick() }</td>
	      <td class="noticeTd">${i.getComment() }</td>
	      <td class="noticeTd">${i.getDate() }</td>
	    </tr>
	  </c:forEach>
	</table>
	<table>
	<tr>
	  <td colspan="2">댓글:</td>
	</tr>
	<tr>
	  <td><textarea id="noticeComment" name="comment" rows="3" cols="80"></textarea></td>
	  <td>&nbsp;&nbsp;&nbsp;<input class="noticeBtn" type="button" id="insertComment" name="insertComment" value="등록" onclick="addComment()" /></td>
	</tr>
	
	</table>
</html>