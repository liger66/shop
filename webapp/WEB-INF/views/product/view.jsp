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
<script>
	function cart(){
		location.href = 
			"${pageContext.request.contextPath}/cart/list?u_id=flynn"
	}
	
	function addToCart(p_id){
		$.ajax({
			url:"${pageContext.request.contextPath}/cart/insert",
			data:{p_id:p_id,u_id:"flynn"},
			success:function(data){
				if(data == 'y'){
					alert("장바구니에 담았습니다.");
				}else if(data == 'n'){
					alert("이미 동일한 제품이 장바구니에 존재합니다.");
				}
				
				if(confirm("장바구니로 이동하시겠습니까?")){
					cart();
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1 class="title text-center">제품 상세보기</h1>
			<jsp:include page="../menu.jsp"/>
		</div>
		<div class="content_view">
			<table class="view">
				<tr>
					<th>카테고리</th>
					<td>${pvo.category }</td>
				</tr>
				<tr>
					<th>모델명</th>
					<td>${pvo.model }</td>
				</tr>
				<tr>
					<th>제조사</th>
					<td>${pvo.manufacturer }</td>
				</tr>
				<tr>
					<th>제품가격</th>
					<td>
						<f:formatNumber pattern="###,###" 
					    value="${pvo.price * (1-pvo.retail_pct)}"/>원 
					</td>
				</tr>
				<tr>
					<th colspan="2">제품설명</th>
				</tr>
				<tr>
					<td colspan="2">${pvo.content }</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button"
						        onclick="addToCart(${pvo.id});">장바구니에 담기</button>
						<button type="button"
						        onclick="cart();">장바구니 확인</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
<img src="${pageContext.request.contextPath }${pvo.image_l }" alt="" />
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>