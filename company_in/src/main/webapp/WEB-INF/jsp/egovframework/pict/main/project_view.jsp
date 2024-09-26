<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="./include/head.jsp">
    	<c:param name="pageTitle" value="주식회사인"/>
    </c:import>
    <body>
        <%@include file="./include/header.jsp" %>
	    <div class="subContainer view">
	        <ul class="imgsContainer">
	            <li><img src="/user_img/test1.png" alt=""></li>
	            <li><img src="/user_img/test2.png" alt=""></li>
	            <li><img src="/user_img/test3.png" alt=""></li>
	            <li><img src="/user_img/test4.png" alt=""></li>
	            <li><img src="/user_img/test5.png" alt=""></li>
	        </ul>
	        <div class="textsContainer">
	            <div class="textsTitles">
	                <p class="category">Commercial</p>
	                <div class="titles">
	                    <h2>프로젝트명이 이곳에 들어갑니다</h2>
	                    <button type="button" id="shareLink"><img src="/user_img/share.png" alt=""></button>
	                </div>
	            </div>
	            <ul class="infos">
	                <li>
	                    <span>Area</span>
	                    <p>136M² (41PY)</p>
	                </li>
	                <li>
	                    <span>Type</span>
	                    <p>상업공간</p>
	                </li>
	                <li>
	                    <span>Address</span>
	                    <p>Chuncheon</p>
	                </li>
	            </ul>
	            <p class="infoDesc">
	                주식회사인은 최근 서울 성수동에 위치한 유명 카페, '그린브리즈'의 리노베이션 프로젝트를 성공적으로 완료했습니다. 그린브리즈는 도시의 번잡함 속에서 자연과 조화를 이루는 힐링 공간으로 자리잡고자 했으며, 우리는 이 목표를 실현하기 위해 기존 공간을 완전히 새롭게 탈바꿈시켰습니다. 이번 프로젝트는 자연 친화적 요소를 최대한 활용해 도시 속에서도 자연을 느낄 수 있는 공간을 조성하는 데 초점을 맞췄습니다.
	            </p>
	        </div>
	    </div>
        <%@include file="./include/footer.jsp" %>
        <script>
	        var shareLink = document.getElementById('shareLink');
	
	        shareLink.addEventListener('click', function(e) {
	            e.preventDefault();
	           
	            var currentURL = window.location.href;
	           
	            navigator.clipboard.writeText(currentURL).then(function() {
	                alert('URL이 클립보드에 복사되었습니다.');
	            });
	        });
        </script>
    </body>
</html>
