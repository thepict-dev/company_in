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
	    <div class="subContainer pro">
	        <ul class="tabNav">
	        <!-- class="active" -->
	            <li class="<c:if test="${pictVO.category eq '' || pictVO.category eq null || pictVO.category eq undefined}">active</c:if>"><a href="/project.do">All</a></li>
	            <li class="<c:if test="${pictVO.category eq 'commercial'}">active</c:if>"><a href="/project.do?category=commercial">commercial</a></li>
	            <li class="<c:if test="${pictVO.category eq 'school'}">active</c:if>"><a href="/project.do?category=school">school</a></li>
	            <li class="<c:if test="${pictVO.category eq 'residence'}">active</c:if>"><a href="/project.do?category=residence">residence</a></li>
	            <li class="<c:if test="${pictVO.category eq 'government'}">active</c:if>"><a href="/project.do?category=government">government</a></li>
	            <li class="<c:if test="${pictVO.category eq 'etc'}">active</c:if>"><a href="/project.do?category=etc">ETC</a></li>
	        </ul>
	        <div class="tabContents">
	            <ul class="projectLists pro">
	            	<c:forEach var="board_list" items="${board_list}" varStatus="status">
		                <li>
		                    <a href="/project_view.do?idx=${board_list.idx}">
		                        <span>
		                        	 <img src="${board_list.img_url1}" alt="대표이미지">
	                        	</span>
		                        <p>${board_list.title}</p>
		                    </a>
		                </li>
	                </c:forEach>
	            </ul>
	        </div>
	    </div>
        <%@include file="./include/footer.jsp" %>
    </body>
</html>
