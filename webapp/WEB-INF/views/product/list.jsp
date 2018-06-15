<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
      href="${pageContext.request.contextPath }/css/shop.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1 class="title text-center">인크레파스 쇼핑몰</h1>
			<jsp:include page="../menu.jsp"/>
			<div class="add">
				<button class="add_btn" type="button"
			        onclick="location.href='${pageContext.request.contextPath}/product/insert'">상품등록</button>
			</div>
		</div>
		<div class="content">
			<c:forEach var="pvo" items="${productList}">
			<div class="item">
				<img src="/image/small/${pvo.image_s }" alt="" />
				<span class="price">
					<f:formatNumber pattern="###,###" 
		               value="${pvo.price*(1-pvo.retail_pct)}"/>원
				</span>
				<span class="model">${pvo.model }</span>
				<button type="button" 
				        onclick="location.href='${pageContext.request.contextPath}/product/view?id=${pvo.id}'">상세보기</button>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>