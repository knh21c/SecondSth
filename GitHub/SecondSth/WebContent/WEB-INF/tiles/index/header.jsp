<%@page import="net.SecondSth.VO.member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script>

function login(){
	
	if($("#headerEmail").val() == "")
		alert("이메일을 입력하세요.");
	else if($("#headerPw").val() == "")
		alert("비밀번호를 입력하세요.");
	else{
// 		var form = document.getElementById("loginForm");
// 		form.action = "./login.do";
// 		form.method = "post";
// 		form.submit();
		$.post("./login.do", {email: $("#headerEmail").val(),
			pw: $("#headerPw").val()},
			function(data){
				var success = data.success;
				if(success == true){
					var logined = success;
					var user = data.user;
					nick = data.user.nick;
					
					var loginDiv = document.getElementById("loginDiv");
					loginDiv.removeChild(document.loginForm);
					loginDiv.innerHTML = user.nick + "님 방문을 환영합니다.";
					var meminfo = document.createElement("a");
					meminfo.setAttribute("onclick", "memberInfo()");
					meminfo.innerHTML = "<br><br><br>회원정보";
					
					var logout = document.createElement("a");
					logout.setAttribute("onclick", "logout()");
					logout.innerHTML = "로그아웃";
					
					loginDiv.appendChild(meminfo);
					loginDiv.innerHTML += "&nbsp;&nbsp";
					loginDiv.appendChild(logout);
					history.go(0);
				}else{
					alert(data.message);
					document.loginForm.email.value = "";
					document.loginForm.pw.value = "";
				}
			});
	}
}
function memberInfo(){
	var form = document.createElement("form");
	form.setAttribute("action", "./memberInfo.do");
	form.setAttribute("method", "post");
	form.submit();
}
function logout(){
	$.post("./logout.do", {}, function(data){
		history.go(0);
	});
// 	var form = document.createElement("form");
// 	form.setAttribute("action", "./logout.do");
// 	form.setAttribute("method", "post");
// 	form.submit();
}
function doLogin(event){
	if(event.keyCode == 13)
		login();
}
</script>
<style>
a{
	cursor: pointer;
}
#loginDiv{
	width: 253px;
	height: 74px;
	padding: 10px;
	border: 2px solid;
	border-radius: 25px;
	margin-top: 20px;
	margin-right: 20px;
	float: right;
	opacity: 0.3;
	
	-webkit-transition: box-shadow 0.6s, opacity 0.6s;
	
}
#loginDiv:hover{
	box-shadow: 10px 10px 5px #888888;
	opacity: 0.8;
}
#loginA{
	
}
</style>
</head>
<div id="loginDiv">
  <c:choose>
  <c:when test="${userInfo == null}">
  <form id="loginForm" name="loginForm" method="post">
    <table>
      <tr>
        <td>이메일:</td><td><input type="text" name="email" id="headerEmail" /></td>
      </tr>
      <tr>
        <td>비밀번호:</td><td><input type="password" name="pw" id="headerPw" onkeydown="doLogin(event)" /></td>
      </tr>
      <tr>
        <td id="loginA" colspan="2"><a style="cursor:pointer;" onclick="login()" >로그인</a></td>
      </tr>
    </table>
  </form>
  </c:when>
  <c:otherwise>
    ${userInfo.getNick()}님 방문을 환영합니다.<br><br><br>
    <a onclick="memberInfo()">회원정보</a>&nbsp;&nbsp;<a onclick="logout()">로그아웃</a>
  </c:otherwise>
  </c:choose>
</div>
<h1 id="h1Header">Exchange Secondhand Sth</h1>