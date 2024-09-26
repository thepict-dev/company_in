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
	        	<c:if test="${pictVO.img_url1 ne null && pictVO.img_url1 ne undefined && pictVO.img_url1 ne ''}">
	            	<li><img src="${pictVO.img_url1}" alt=""></li>
            	</c:if>
            	<c:if test="${pictVO.img_url2 ne null && pictVO.img_url2 ne undefined && pictVO.img_url2 ne ''}">
	            	<li><img src="${pictVO.img_url2}" alt=""></li>
            	</c:if>
            	<c:if test="${pictVO.img_url3 ne null && pictVO.img_url3 ne undefined && pictVO.img_url3 ne ''}">
	            	<li><img src="${pictVO.img_url3}" alt=""></li>
            	</c:if>
            	<c:if test="${pictVO.img_url4 ne null && pictVO.img_url4 ne undefined && pictVO.img_url4 ne ''}">
	            	<li><img src="${pictVO.img_url4}" alt=""></li>
            	</c:if>
            	<c:if test="${pictVO.img_url5 ne null && pictVO.img_url5 ne undefined && pictVO.img_url5 ne ''}">
	            	<li><img src="${pictVO.img_url5}" alt=""></li>
            	</c:if>
	        </ul>
	        <div class="textsContainer">
	            <div class="textsTitles">
	                <p class="category">${pictVO.category}</p>
	                <div class="titles">
	                    <h2>${pictVO.title}</h2>
	                    <button type="button" id="shareLink"><img src="/user_img/share.png" alt=""></button>
	                </div>
	            </div>
	            <ul class="infos">
	                <li>
	                    <span>Area</span>
	                    <p>${pictVO.area}</p>
	                </li>
	                <li>
	                    <span>Type</span>
	                    <p>${pictVO.type }</p>
	                </li>
	                <li>
	                    <span>Address</span>
	                    <p>${pictVO.address}</p>
	                </li>
	            </ul>
	            <p class="infoDesc">
	                ${pictVO.text}
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
