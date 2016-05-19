<%@page import="com.wt.entity.Book"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>

<link rel="shortcut icon" href="image/favicon.ico" />

<link rel="stylesheet" href="static/css/shopping/style.css" media="all">

<link rel="stylesheet" href="static/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="static/css/shopping/shopping_info.css" media="all">

</head>
<body>

	<jsp:include page="../base/nav_content.jsp"></jsp:include>
	
	<%
		String islogin = "none";
		String info = "none";
		String list = "none";
		String enough = "none";
		String username = (String) session.getAttribute("username");
		
		String notEnough = (String) session.getAttribute("notEnough");


		String w_q = (String) session.getAttribute("w_q");
		String bookname = (String) session.getAttribute("bookname");

 		List<Book> books = (List<Book>)session.getAttribute("books");
		
		if(notEnough != null){
			enough = "block";
		}
		
		if (username == null) {
			islogin = "block";
		} else {
			
		}
		
		if(books != null){
			list = "block";
		}
	%>
	
	<div class="info" class="wrap" style="display: <%=enough%>">
		<h1><%= bookname %> 库存不足，目前仅为 <%= w_q %> 本，请重新核对购物车信息 ~~</h1>
	</div>
	<div class="info" class="wrap" style="display: <%=islogin%>">
		<h1>你现在还未登录，请点击右上方的登录方可查看购物车信息 ~~</h1>
	</div>
	<div class="info" class="wrap" style="display: <%=info%>">
		<h1>你现在还没有购物信息 ~~</h1>
	</div>
	
	<div class="isinfo" class="wrap" style="display: <%=list%>">
		<h1>购买信息如下 ~~</h1>
		<table class="table table-striped">
			<thead>
			    <tr>
			        <th>ID</th>
			        <th>书名</th>
			        <th>数量</th>
			        <th>价格</th>
			    </tr>
		    </thead>
		    <tbody>
		    <s:iterator value="#session.books">
			    <tr>
			        <td>${ book_id }</td>
			        <td>${ book_name }</td>
			        <td class="center">${ quantity }</td>
			        <td class="center">${ price }</td>
			    </tr>
			</s:iterator>
		    </tbody>
		</table>
	</div>

</body>
</html>