<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="net.SecondSth.VO.member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<style>
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
window.onload=function(){
	  var email = "${userInfo.getEmail()}";
	  if(email == ""){
		  location.replace("./home.do");
	  }
}
</script>
</head>
<body>
  <form>
  <table>
    <tr>
      <td>이메일</td>
      <td><input type="text" value="${userInfo.getEmail() }" readonly="readonly"/></td>
    </tr>
    <tr>
      <td>닉네임</td>
      <td><input type="text" value="${userInfo.getNick() }" name="nick" /></td>
    </tr>
    <tr>
      <td>전화번호</td>
      <td><input type="text" value="${userInfo.getPhone() }" name="phone" /></td>
    </tr>
  </table>
  </form>
</body>
</html>