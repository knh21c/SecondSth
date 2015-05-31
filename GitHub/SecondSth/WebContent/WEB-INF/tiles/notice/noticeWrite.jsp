<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<style>
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
<script>
var imgs=[0, 0, 0, 0, 0];
var fileCnt = 1;
  window.onload=function(){
	  document.noticeWriteForm.subject.focus();
  }
  function cancel(){
	  document.noticeWriteForm.action="./notice.do";
	  document.noticeWriteForm.submit();
  }
  function insertArticle(){
	  if(document.noticeWriteForm.nick.value == ""){
			alert("권한이 없습니다.")
			var form = document.createElement("form");
			form.setAttribute("action", "./notice.do");
			form.setAttribute("method", "post");
			form.submit();
	  }else{
		if(document.noticeWriteForm.title.value==""){
			alert("제목을 입력하세요.");
			return false;
		}else if(document.noticeWriteForm.content.value == ""){
			alert("본문을 입력하세요.");
			return false;
		}else{
			document.noticeWriteForm.action = "./noticeWriteExe.do";
			document.noticeWriteForm.submit();
			return true;
		}
	  }
  }
  function findNum(fileObj){
	  var name=fileObj.name;
	  var num=name.substring(5, 6);
	  var intNum = parseInt(num);
	  return intNum;
  }
  function lastUpLoadImg(fileObj){
	  var num = findNum(fileObj);
	  if(imgs[num] == 0){
	      addTag(fileCnt-1);
		  alert("이미지는 5개 까지 등록 가능합니다.");
		  imgs[num]++;
	  }
  }
  function uploadImg(fileObj){
	  var num = findNum(fileObj);
	  if(fileCnt < 4 ){
		  var inputImg = document.createElement("input");
		  var parent = document.getElementById("uploadDiv");
		  inputImg.setAttribute("type", "file");
		  inputImg.setAttribute("name", "image" + fileCnt);
		  inputImg.setAttribute("style", "display:block;");
		  inputImg.setAttribute("onchange", "uploadImg(this)");
		  if(imgs[num] == 0){
			  parent.appendChild(inputImg);
			  addTag(fileCnt-1);
			  fileCnt++;
			  imgs[num]++;
		  }
	  }else if(fileCnt == 4){
		  var inputImg = document.createElement("input");
		  var parent = document.getElementById("uploadDiv");
		  inputImg.setAttribute("type", "file");
		  inputImg.setAttribute("name", "image" + fileCnt);
		  inputImg.setAttribute("style", "display:block;");
		  inputImg.setAttribute("onchange", "lastUpLoadImg(this)");
		  if(imgs[num] == 0){
			  parent.appendChild(inputImg);
			  addTag(fileCnt-1);
			  fileCnt++;
			  imgs[num]++;
		  }
	  }
  }
  function addTag(cnt){
	  var content = document.getElementById("noticeContent");
	  var str = content.value;
	  if(str.indexOf('<image' + cnt + '>'))
		  content.value += "<image"+ cnt + ">" + "\r\n";
  }
  
</script>
</head>
<body>
  <form id="inputform" name="noticeWriteForm" method="post">
    <fieldset>
      <legend>Write a New Article</legend>
      <input type="hidden" value="${userInfo.getEmail() }" name="email" />
      제목: <input type="text" id="noticeTitle" name="title" />
      작성자: <input type="text" id="noticeAuthor" name="nick" value="${userInfo.getNick() }" readonly="readonly"/>
      <br><br>
      <textarea id="noticeContent" name="content" rows="10" cols="100"></textarea>
      <br><br>
      <input class="noticeBtn" type="button" value="취소" onclick="cancel()"/>
      <input class="noticeBtn" type="button" value="작성 완료" onclick="return insertArticle()"/>
      <p>
    </fieldset>
  </form>
</body>
</html>