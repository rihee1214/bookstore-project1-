<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String gNameList[]={"소설","시/에세이","경제/경영","자기계발","인문","역사/문화","종교","정치/사회","예술/대중문화",
			"과학","기술/공학","컴퓨터/IT","어린이","청소년","외국어","잡지","만화"};
	request.setAttribute("gNameList",gNameList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header.jsp"></c:import>
<style>
#searchingform {
	width: 85%
}

#searchbar {
	width: 35%
}

#searchselectbar {
	width: 13%
}
</style>
</head>
<body>
	<c:import url="../template/body.jsp"></c:import>
	
	
	<div class="container">
	<h2>장르 > </h2>
		<select class="genreSelect" name="genreSelect">
		<c:forEach items="${gNameList}" var="gNameList">
				<option>${gNameList}</option>
		</c:forEach>
		</select>
	
		<h2 id="boardsp">${pager.boardsp}</h2>
		<table class="table">
			<thead class="thead-dark">
				<c:forEach items="${list}" var="dto">
					<tr class="likeBookButton">
						<td class="imgalign"><img alt="${dto.bookImg}"
							src="${pageContext.request.contextPath}/resources/uploaded/bookList/${dto.bookImg}">
						</td>
						<td>
							<a href="./bookListSelect?isbn=${dto.isbn}" class="bookselect">${dto.bookName}</a><br>
							<div class="author">
								<span class="name"><a>${dto.author}</a></span>지음 <span
									class="line">|</span> <span class="name" title="출판사"><a>${dto.bookPub}</a></span>
								<span class="line">|</span> <span class="name" title="출간일"><a>${dto.bookPubDate}</a> 출간</span>
							</div> <br>
							<span class="sell_price" title="판매가"><strong>${dto.price*90/100}</strong>원</span>
							<span class="dc_rate">[<strong>10</strong>% 할인]</span>
							<span class="line">|</span>
							<span class="earn_point"><strong>${dto.price*5/100}</strong>P 적립 [ <strong>5</strong> % 적립]</span><br>
							${dto.bookContent}...
							<a href="./bookListSelect?isbn=${dto.isbn}" class=bookselectclick>[더보기]</a><br>
							<div class="review">평점 : <em>${dto.bookScore}</em></div>
							
							
							
						</td>
						
						<td class="fornextline">
							<input type="hidden" readonly="readonly" name="isbn" value="${dto.isbn}">
							<input type="hidden" readonly="readonly" name="id" value="${member.id}"> 
								<select class="custom-select-sm" name="bookcount">								
								<option selected="selected" value="1">1</option>
								<c:forEach begin="2" end="10" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
						</select><br>
							<button class="getCart btn-sm btn-info">장바구니</button> <br>
							<button class="getPurchase btn-sm btn-primary">구매하기</button>
						</td>
					</tr>
				</c:forEach>

				
			</tbody>
		</table>
		<c:if test="${listsize ne 0}">
			<ul class="pagination justify-content-center" id="pagerList">
				<li class="page-item" id="prebutton"><button class="page-link">Previous</button></li>
				<c:forEach begin="${pager.startBlock}" end="${pager.endBlock}" var="i">
					<li class="page-item"><button class="page-link pagesetting"
							value="${i}">${i}</button></li>
				</c:forEach>
				<li class="page-item" id="nextbutton"><button class="page-link">Next</button></li>
			</ul>
		</c:if>
	</div>





	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>