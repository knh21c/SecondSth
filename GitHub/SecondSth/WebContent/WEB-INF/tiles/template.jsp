<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
var nick;
var administrator;
</script>
 <style>
 	::-moz-selection { /* Code for Firefox */
	    color: white;
	    background: black;
	}
	
	::selection {
	    color: white;
	    background: black;
	}
	a:link {
		color:#000000;
		background-color:transparent;
		text-decoration:none;
	}
	a:visted {
		color:#000000;
	    background-color:transparent;
	    text-decoration:none;
	}
	a:hover {
	    color:#ff0000;
	    background-color:transparent;
	    text-decoration:underline;
	}
	a:active {
	    color:#ff0000;
	    background-color:transparent;
	    text-decoration:underline;
	}
	#container{
		padding: 0;
		margin: 0;
	}
 	body {
 		margin: 0;
 		background-color: #fefefe;
 		font-size:14px;
		font-family:"Open Sans", serif;
 	}
 	#headerDiv {
 		border: 0;
 		padding: 0;
 		margin: 0;
 		background: #CCC;
 	}
 	#h1Header{
 		padding: 100px;
 		padding-left: 0;
 		background: #CCC;
 		margin: 0;
 		font-size: 5em;
 		text-align: left;
 		color: white;
 	}
 	#menu{
 		margin: 0;
 		padding: 0;
 		width: auto;
 		height: 40px;
 		background: black;
 	}
	#menu ul {
		height: 40px;
		list-style-type: none;
		padding: 0;
		margin-top: 0;
		width: 100%;
		margin-left: auto;
		margin-right: auto;
	}
	#menu ul li:first-child{
		border-left: 1px solid #ccc;
	}
 	#menu ul li{ 
 		float: left;
 		text-align: center;
 		border-right: 1px solide #ccc;
 		margin-left: auto;
		margin-right: auto;
	}
	#menu ul li a{
		background-color: black;
		opacity: 0.9;
		color: white;
 		padding: 10px 20px;
		text-decoration: none;
		display: block;
		
		-webkit-transition: opacity 0.3s ease-out;
		-moz-transition: opacity 0.3s ease-out;
		transition: opacity 0.3s ease-out;
	}
	#menu ul li a:hover{
		opacity: 0.4;
	}
	#menu ul li ul{
		list-style: none;
		margin: 0;
		padding: 0;
 		position: absolute;
 		visibility: hidden; 
 		opacity: 0;
		
		-webkit-transition: opacity 0.4s ease-out;
		-moz-transition: opacity 0.4s ease-out;
		-o-transition: opacity 0.4s ease-out;
		transition: opacity 0.4s ease-out;
	}
	#menu ul li ul li{
		border: none;
		border-bottom: 1px solid #ccc;
		clear: both;
		margin-top: -35px;
		
		-webkit-transition: all 0.3s;
		-moz-transition: all 0.3s;
		-o-transition: all 0.3s;
		transition: all 0.3s;
	}
	#menu ul li:hover ul li a{
		color:#CCC;
		
		-webkit-transition: all 0.3s;
		-moz-transition: all 0.3s;
		-o-transition: all 0.3s;
		transition: all 0.3s;
	}
	#menu ul li:hover ul{
		visibility: visible;
		opacity: 0.9;
	}
	#menu ul li:hover ul li{
		margin-top: 0;
		color: white;
	}
	#menu ul li:hover ul li a:hover{
		color:white;
	}
	#bodyDiv{
		margin-top: 50px;
	}
</style>
  <title><tiles:getAsString name="title" /></title>
  <tiles:insertAttribute name="meta" />
</head>
<body>
<div id="container">
  <div id="headerDiv">
    <tiles:insertAttribute name="header" />
  </div>
  <tiles:insertAttribute name="menu" />
  <div id="bodyDiv">
    <tiles:insertAttribute name="body" />
  </div>
  <div id="footerDiv">
    <tiles:insertAttribute name="footer" />
  </div>
</div>
</body>
</html>