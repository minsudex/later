<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="resources/css/style.css"/>
<link rel="stylesheet"
	href="resources/css/bestBoard.css"/>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style type="text/css">
.wrap {
	display: flex;
	flex-direction: column;
	height: 100%;
}

.hotpick {
	display: flex;
	justify-content: center;
	align-items: center;
}

.hotpick-color {
	color: red;
	font-size: 35px;
}

.coming-soon {
	background-color: #000000;
	color: #fff;
	font-size: 20px;
	line-height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.fa-star {
	color: red;
}

.nav-link {
	font-size: 20px;
}
</style>
<script>
            let m = "${msg}";
            if(m != ""){
                alert(m);
            }
            
    </script>
</head>
<body>
	<div class="wrap">
		<c:if test="${empty mLogInInfo and empty cLogInInfo}">
			<jsp:include page="header.jsp" />
		</c:if>
		<c:if test="${!empty mLogInInfo}">
			<jsp:include page="mHeader.jsp" />
		</c:if>
		<c:if test="${!empty cLogInInfo}">
			<jsp:include page="cHeader.jsp" />
		</c:if>
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">맛집</a></li>
				<li class="nav-item"><a class="nav-link" href="#">숙소</a></li>
				<li class="nav-item"><a class="nav-link" href="#">가전</a></li>
				<li class="nav-item"><a class="nav-link" href="#">뷰티</a></li>
				<li class="nav-item"><a class="nav-link" href="#">기타</a></li>
				<li class="nav-item"><a class="nav-link" href="review">리뷰</a></li>
			</ul>
		</nav>
		<div>
			<hr color="orange">
		</div>
		<div class="hotpick">
			<i class="fa fa-star fa-2x" aria-hidden="true"></i>
			<div class="hotpick-color">HOT PICK</div>
		</div>
		<div class="hotpick">신청 폭발!핫 픽은 뭐가 있을지 둘러보세요!</div>
		<div>
			<hr color="gray">
		</div>
		
		<!-- 업체 리스트 (2024-02-26) -->
		<div class="board">
		 <c:if test="${empty bList}">
				등록된 모집글이 없습니다.
			</c:if>
			<c:if test="${!empty bList}">
				<c:forEach var="bitem" items="${bList}" begin="0" end="4" step="1">
					<div class="board-item">
					<!-- 업체 이미지 (2024-02-26) -->
					<div class="board-image">
						<a href="detail?boardId=${bitem.boardId}">
							<c:if test="${empty bitem.boardFile}">
								<img src="resources/images/no_image.jpg"
									class="poster-pre">
							</c:if>
							<c:if test="${!empty bitem.boardFile}">
								<img src="resources/upload/${bitem.boardFile}"
									class="poster-pre">
							</c:if>
						</a>
						</div>
						<!-- 업체 이름 (2024-02-26) -->
						<div class="board-name">
							<a href="detail?boardId=${bitem.boardId}">
								${bitem.companyName}
							</a>
						</div>
						<!-- 제공유형&가격 (2024-02-27) -->
						<div class="provideType-price">
						<!-- 제공유형 (2024-02-27) -->
							<div class="board-provideType">
								${bitem.provideType}
							</div>
						<!-- 등록된 가격 (2024-02-26) -->
							<div class="board-price">
								${bitem.price}
						    </div>							
						</div>						
						<!-- 모집 인원 (2024-02-26) -->
						<div class="board-personnel">모집인원  / ${bitem.personnel}</div>
					</div>
				</c:forEach>
			</c:if> 
			</div>
		<div class="coming-soon">
			<i class="fa fa-hourglass-start" aria-hidden="true"></i> COMING SOON
		</div>
		<p>Some example text. Some example text. Some example text. Some
				example text. Some example text.</p>
			<p>Some example text. Some example text. Some example text. Some
				example text. Some example text.</p>
			<p>Some example text. Some example text. Some example text. Some
				example text. Some example text.</p>
			<p>Some example text. Some example text. Some example text. Some
				example text. Some example text.</p>
		<div>
			<hr color="gray">
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
