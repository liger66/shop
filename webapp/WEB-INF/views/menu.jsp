<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="menu">
	<div class="menu-item">
		<a href="${pageContext.request.contextPath }/product/list?category=sports">스포츠</a>
	</div>
	<div class="menu-item">
		<a href="${pageContext.request.contextPath }/product/list?category=top">상의</a>
	</div>
	<div class="menu-item">
		<a href="${pageContext.request.contextPath }/product/list?category=pants">하의</a>	
	</div>
</div>