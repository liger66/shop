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
	function del(id){
		if(confirm('정말로 삭제하시겠습니까?')){
			location.href = "${pageContext.request.contextPath}/cart/delete?id="+id;
		}
		
	}
</script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1 class="title text-center">장바구니</h1>
			<jsp:include page="../menu.jsp"/>
		</div>
		<div class="content_view">
			<table class="view">
				<tr>
					<th>상품명</th>
					<th>수량</th>
					<th>단가</th>
					<th>금액</th>
					<th>비고</th>
				</tr>
				<c:forEach var="cvo" items="${cartList }">
					<tr>
						<td>
							<a href="${pageContext.request.contextPath }/product/view?id=${cvo.pvo.id}">${cvo.pvo.model }</a>
						</td>
						<td>
							<form action="${pageContext.request.contextPath }/cart/update" method="post">
							    <input type="hidden" name="id" value="${cvo.id }" />
								<input type="text" name="count" value="${cvo.count }" style="width:20px"/>
								<button type="submit">수정</button>
							</form>
						</td>
						<td>
							<f:formatNumber pattern="###,###">
								${cvo.pvo.price * (1 - cvo.pvo.retail_pct)}
							</f:formatNumber>원
						</td>
						<td>
							<f:formatNumber pattern="###,###">
								${cvo.count * cvo.pvo.price * (1 - cvo.pvo.retail_pct)}
							</f:formatNumber>원
						</td>
						<td>
							<button type="button" onclick="del(${cvo.id})">삭제</button>
						</td>
					</tr>
					
				</c:forEach>
				<tr>
					<td colspan="3" style="text-align: right">
						합계
					</td>
					<td>
						<f:formatNumber pattern="###,###">
							${totalPrice }
						</f:formatNumber>
					</td>
					<td>
						<button type="button">구매하기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>