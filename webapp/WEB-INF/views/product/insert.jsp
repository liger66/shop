<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
      href="${pageContext.request.contextPath }/css/shop.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function check(form){
		if(form.category.value == ""){
			alert("카테고리를 선택해 주세요.");
			return;
		}
		
		if(!/^[a-z가-힣]{3,30}$/.test(form.model.value)){
			alert("모델명을 입력해 주세요.");
			form.model.focus();
			return;
		}
		
		if(!/^[a-z\s]{3,30}$/.test(form.manufacturer.value)){
			alert("제조사를 입력해 주세요.");
			form.manufacturer.focus();
			return;
		}
		
		if(!/^[1-9][0-9]{1,9}$/.test(form.price.value)){
			alert("가격을 입력해 주세요.");
			form.price.focus();
			return;
		}
		
		//0 또는 0.01 ~ 0.99
		if(!/^0(\.[0-9]?[1-9])?$/.test(form.retail_pct.value)){
			alert("할인율을 입력해 주세요.");
			form.retail_pct.focus();
			return;
		}
		
		if(form.image_l_file.value == ""){
			alert("큰사진을 등록해 주세요.");
			return;
		}
		
		if(form.image_s_file.value == ""){
			alert("작은사진을 등록해 주세요.");
			return;
		}
		
		if(form.content.value == ""){
			alert("제품설명을 입력해 주세요.");
			form.content.focus();
			return;
		}
		
		form.submit();
	}
</script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1 class="title text-center">제품 등록</h1>
		</div>
		<div class="content_insert">
			<form action="${pageContext.request.contextPath }/product/insert"
			      method="post" enctype="multipart/form-data">
				<table class="insert">
					<tr>
						<th>카테고리</th>
						<td>
							<select name="category">
								<option value="">::선택::</option>
								<option value="sports">스포츠</option>
								<option value="top">상의</option>
								<option value="pants">하의</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>모델명</th>
						<td>
							<input type="text" name="model" />
						</td>
					</tr>
					<tr>
						<th>제조사</th>
						<td>
							<input type="text" name="manufacturer" />
						</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>
							<input type="text" name="price" />
						</td>
					</tr>
					<tr>
						<th>할인율</th>
						<td>
							<input type="text" name="retail_pct" />
						</td>
					</tr>
					<tr>
						<th>큰사진</th>
						<td>
							<input type="file" name="image_l_file" />
						</td>
					</tr>
					<tr>
						<th>작은사진</th>
						<td>
							<input type="file" name="image_s_file" />
						</td>
					</tr>
					<tr>
						<td colspan="2">제품설명</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="content" id="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button"
							onclick="check(this.form)">등록</button>
							<button type="button"
onclick="location.href='${pageContext.request.contextPath}/product/list'">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>