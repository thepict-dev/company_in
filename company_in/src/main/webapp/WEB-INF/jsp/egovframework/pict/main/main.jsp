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
	    <main>
	        <div class="mainInner">
	            <ul class="projectLists">
	            	<c:forEach var="board_list" items="${board_list}" varStatus="status">
		                <li>
		                    <a href="/project_view.do?idx=${board_list.idx}">
		                        <span>
		                        	<!-- 
		                        	<img src="/user_img/project-test.png" alt="">
		                        	 -->
		                        	 <img src="${board_list.img_url1}" alt="대표이미지">
	                        	</span>
		                        <p>${board_list.title}</p>
		                    </a>
		                </li>
	                </c:forEach>
	            </ul>
	        </div>
	    </main>
        <%@include file="./include/footer.jsp" %>
    </body>
</html>
