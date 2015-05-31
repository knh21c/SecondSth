<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<style>
.container {width: 960px; margin: 0 auto; overflow: hidden; height:910px;}

.tooltip {
	display:none;
	position:absolute;
	border:1px solid #333;
	background-color:#161616;
	border-radius:5px;
	padding:10px;
	color:#fff;
	font-size:12px Arial;
}
.pagebar {
	text-align:center;
}
.pagebar li {
	display:inline-block;
	border:1px solid black;
	padding:2px 5px;
}
.noticeTable{
	width: 100%;
	align: center;
}
.noticeTable, .noticeTh, .noticeTd {
	border: 1px solid black;
	border-collapse: collapse;
}
.noticeTh, .noticeTd {
	padding: 15px;
	text-align: left;
}
.noticeTh {
	background-color: black;
		color: white;
}
.noticeTr{
	-webkit-transition: background-color 0.8s;
	-moz-transition: background-color 0.8s;
	-o-transition: background-color 0.8s;
	transition: background-color 0.8s;
}
.noticeTr:hover{
	background-color: lightgray;
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
$(document).ready(function() {
    // Tooltip only Text
    $('.noticeTr').hover(function(){
            // Hover over code
            var title = $(this).attr('title');
            $(this).data('tipText', title).removeAttr('title');
            $('<p class="tooltip"></p>')
            .text(title)
            .appendTo('body')
            .fadeIn('slow');
    }, function() {
            // Hover out code
            $(this).attr('title', $(this).data('tipText'));
            $('.tooltip').remove();
    }).mousemove(function(e) {
            var mousex = e.pageX + 20; //Get X coordinates
            var mousey = e.pageY + 10; //Get Y coordinates
            $('.tooltip')
            .css({ top: mousey, left: mousex })
    });
});

window.onload=function(){
	  var popup = "${popup}";
	  if(popup != "")
		  alert(popup);
}
function toInnerView(index){
	document.noticeForm.id.value = index;
	document.noticeForm.submit();
}
function pageswitch(num){
	document.pageSwitchForm.pageNum.value=num;
	document.pageSwitchForm.submit();
}
function searchStart(){
	if(event.keyCode == '13'){
		document.noticeSearch.type.value = document.noticeSearch.searchType.value;
		document.noticeSearch.action="./searchArticle.do";
		document.noticeSearch.submit();
	}
}
function isAdministrator(administrator){
	if(administrator == 1){
		var form = document.createElement("form");
		form.setAttribute("action", "./noticeWrite.do");
		form.setAttribute("method", "post");
		form.submit();
	}else{
		alert("권한이 없습니다.");
	}
}
function toNoticeInnerView(id){
	document.noticeForm.id.value = id;
	document.noticeForm.action = "./toNoticeInnerView.do";
	document.noticeForm.submit();
}
</script>
</head>
<body>
<div class="noticeDiv">
<form name="noticeForm" method="post" action="./inner.do">
  <input type="hidden" name="id" value=""/>
  <table class="noticeTable">
  
    <tr>
      <th class="noticeTh">번호</th>
      <th class="noticeTh">제목</th>
      <th class="noticeTh">작성자</th>
      <th class="noticeTh">작성일</th>
      <th class="noticeTh">조회수</th>
    </tr>
    <c:set var="beginNum" value="${pageNum*10 }" />
    <c:set var="listNum" value="${message.size() }"/>
    <c:forEach var="i" items="${message}" begin="0" end="${message.size() }" step="1" varStatus="status">
    	<c:choose>
    	<c:when test="${(status.index >= beginNum) && (status.index < (beginNum+10))}">
    	<tr class="noticeTr" style="cursor:pointer;" onclick="toNoticeInnerView(${i.getId()})" title="${i.getContent()}">
			<td class="noticeTd">${ listNum-status.index }</td>
			<td class="noticeTd">${ i.getTitle() }</td>
			<td class="noticeTd">${ i.getNick() }</td>
			<td class="noticeTd">${ i.getDate() }</td>
			<td class="noticeTd">${ i.getHit() }</td>
			<c:set var="tmp" value="${message.size()/10 }" />
			<c:set var="pageCnt" value="${tmp+(1-(tmp%1))%1 }" />
		</tr>
		</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
	</c:forEach>
  </table>
  </form>
  <form name="pageSwitchForm" method="post" action="./noticePageswitch.do">
  <input type="hidden" name="pageNum" />
  <div class="pagebar">
    <ul>
    <c:choose>
      <c:when test="${pageCnt > 0 }">
        <c:forEach var="i" begin="0" end="${pageCnt-1 }" step="1" varStatus="status">
  	      <li><a style="cursor:pointer;" onclick="pageswitch(${status.index })">${status.count}</a></li>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <li><a style="cursor:pointer;" onclick="pageswitch(0)">1</a></li>
      </c:otherwise>
    </c:choose>
    </ul>
  </div>
  </form>
  <p>
      <a href="./notice.do"><input class="noticeBtn" type="button" value="List" /></a>
      <input class="noticeBtn" type="button" value="Write" onclick="isAdministrator('${userInfo.getAdministrator()}')" />
  <form name="noticeSearch" method="get">
  <div align="center">
    
    <select name="searchType" id="searchType" ontoggle="selectFunc()">
      <option value="total" >전체</option>
      <option value="subject" >제목</option>
      <option value="author">작성자</option>
      <option value="content">내용</option>
    </select>
    <input type="hidden" name="type" />
    <input type="text" name="key" id="key" onkeydown="searchStart()"/>
  </div>
  </form>
</div>
</body>
</html>