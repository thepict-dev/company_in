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
	            <li class="active"><a href="#lnk">All</a></li>
	            <li><a href="#lnk">commercial</a></li>
	            <li><a href="#lnk">school</a></li>
	            <li><a href="#lnk">residence</a></li>
	            <li><a href="#lnk">government</a></li>
	            <li><a href="#lnk">ETC</a></li>
	        </ul>
	        <div class="tabContents">
	            <ul class="projectLists pro">
	                <li>
	                    <a href="/project_view.do">
	                        <span><img src="/user_img/project-test.png" alt=""></span>
	                        <p>프로젝트명이 이곳에 들어갑니다</p>
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </div>
        <%@include file="./include/footer.jsp" %>
    </body>
</html>
