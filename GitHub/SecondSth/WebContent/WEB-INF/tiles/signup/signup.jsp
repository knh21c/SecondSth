<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
function checkPw(){
	var eng = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	var num = "0123456789";
	var sKey = "~!@#$%^&*()_-+=|{}[]<>,./?";
	var element = document.getElementById("exPw");
	var input = document.getElementById("signUpPw");
	var str = input.value;
	if(!containsChars(str, sKey)){
		if(containsChars(str, num) && containsChars(str, eng)){
			if(str.length >= 8){
				element.style.color = "#1975FF";
			}else{
				element.style.color = "#FF4747";	
			}
		}else{
			element.style.color = "#FF4747";
		}
	}else{
		element.style.color = "#FF4747";
	}
}
// 있으면 true 없으면 false
function containsChars(input, chars)
{
    for (var inx = 0; inx < input.length; inx++) 
    {
        if (chars.indexOf(input.charAt(inx)) != -1)
        {
        	return true;
        }
    }
    return false;
}
function cancel(){
	document.signUpForm.action="./home.do";
	document.signUpForm.submit();
}
function checkKey(event){
	var keyID = event.keyCode;
	if( keyId == 9 || ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ){
		return;
	}else{
		return false;
	}
}
function inputCheck(){
	var email = document.getElementById("signUpEmail");
	var nick = document.getElementById("signUpNick");
	var phone = document.getElementById("signUpPhone");
	var pw = document.getElementById("signUpPw");
	var exPw = document.getElementById("exPw");
	var style = window.getComputedStyle(exPw);
	var color = style.getPropertyValue('color');
	
	if(email.value == "" || nick.value == "" || phone.value == "" || pw.value == ""){
		alert("모든 폼을 채워주십시오");
		return false;
	}else if(email.hasAttribute("readonly") && nick.hasAttribute("readonly")){
		if(color == "rgb(25, 117, 255)")
			return true;
		else{
			alert("영문/숫자 조합 8자이상의 비밀번호를 입력해주십시오.");
			return false;
		}
	}else{
		alert("중복검사를 해주십시오.");
		return false;
	}
}
function signUp(){
	if(inputCheck()){
		if($("#signUpPw").val() == $("#signUpRePw").val()){
			document.signUpForm.action="./signUpExe.do";
			document.signUpForm.submit();
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			var element1 = document.getElementById("signUpPw");
			var element2 = document.getElementById("signUpRePw");
			
			element1.value = "";
			element2.value = "";
		}
	}
}
function emailCheck(){
	if(document.signUpForm.email.value == "")
		alert("이메일을 입력해 주세요");
	else{
		$.post("./emailCheck.do", {email: $("#signUpEmail").val()}, function(data){
			var list = data.list;
			if(list.length == 1){
				alert("이미 존재하는 이메일 입니다.");
				document.signUpForm.email.focus();
				document.signUpForm.email.select();
			}else{
				alert("사용할 수 있는 이메일 입니다.");
				var element = document.getElementById("signUpEmail");
				element.setAttribute("readonly", "readonly");
				document.signUpForm.nick.focus();
			}
		});
	}
}
function nickCheck(){
	if(document.signUpForm.nick.value == "")
		alert("닉네임을 입력해 주세요");
	else{
		$.post("./nickCheck.do", {nick: $("#signUpNick").val()}, function(data){
			var list = data.list;
			if(list.length == 1){
				alert("이미 존재하는 닉네임 입니다.");
				document.signUpForm.nick.focus();
				document.signUpForm.nick.select();
			}else{
				alert("사용할 수 있는 닉네임 입니다.");
				var element = document.getElementById("signUpNick");
				element.setAttribute("readonly", "readonly");
				document.signUpForm.phone.focus();
			}
		});
	}
}
function doSignUp(event){
	if(event.keyCode == 13)
		signUp();
}
</script>
<style>
#exphone {
  color: #CCC;
}
#exPw{
  color: #FF4747;
}
.signupDiv {
  margin-top: 30px;
  margin-bottom: 30px; 
}
.btnA{
  margin: 20px;
  padding-left: 5px;
  padding-right: 5px;
  padding-top: 2px;
  padding-bottom: 2px;
  border: 1px solid;
  border-radius: 5px;
}
.signUpTable{
	padding: 0;
	margin-bottom: 40px;
}
.signUpTable tr td:first-child {
	background: -webkit-linear-gradient( to right, #DEDECE, #FFFFFF );
/* 	background: #DEDECE; */
}
.signUpTd{
	padding: 10px;
	margin: 0;
}
.signUpTable, .signUpTd{
	border: 0;
}
</style>
</head>
<body>
  <form name="signUpForm" method="post">
    <table class="signUpTable">
      <tr class="signUpTr">
        <td class="signUpTd">이메일</td>
        <td class="signUpTd"><input type="text" id="signUpEmail" name="email" /></td>
        <td class="signUpTd"><a style="cursor:pointer;" onclick="emailCheck()">중복검사</a></td>
      </tr>
      <tr class="signUpTr">
        <td class="signUpTd">닉네임</td>
        <td class="signUpTd"><input type="text" id="signUpNick" name="nick" /></td>
        <td class="signUpTd"><a style="cursor:pointer;" onclick="nickCheck()">중복검사</a></td>
      </tr>
      <tr class="signUpTr">
        <td class="signUpTd">전화번호</td>
        <td class="signUpTd"><input type="text" onkeydown="return checkKey(event)" id="signUpPhone" name="phone" /></td>
        <td class="signUpTd"><a id="exphone"> ex) 01011112222</a></td>
      </tr>
      <tr class="signUpTr">
        <td class="signUpTd">비밀번호</td>
        <td class="signUpTd"><input type="password" id="signUpPw" name="pw" onkeyup="checkPw()" /></td>
        <td class="signUpTd"><a id="exPw">  영문/숫자 조합 8자이상</a></td>
      </tr>
      <tr class="signUpTr">
        <td class="signUpTd">비밀번호 확인</td>
        <td class="signUpTd"><input type="password" id="signUpRePw" name="rePw" onkeydown="doSignUp(event)" /></td>
      </tr>
    </table>
    <a class="btnA" style="cursor:pointer;" onclick="cancel()">취소</a>
    <a class="btnA" style="cursor:pointer;" onclick="signUp()">가입</a>
  </form>
</body>
</html>