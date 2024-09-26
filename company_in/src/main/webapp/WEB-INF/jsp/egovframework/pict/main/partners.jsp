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
	    <div class="subContainer about pa">
	        <div class="subTitles pa">
	            <p><span>주식회사 인은</span></p>
	            <p><span>다양한 사업군의 기업들과</span></p>
	            <p><span>협력관계를 맺고 있습니다</span></p>
	        </div>
	        <ul class="subParContainer">
	            <li>
	                <a href="#lnk" target="_blank" title="새창이동"><img src="/user_img/pa1.png" alt=""></a>
	            </li>
	            <li>
	                <a href="#lnk" target="_blank" title="새창이동"><img src="/user_img/pa2.png" alt=""></a>
	            </li>
	            <li>
	                <a href="#lnk" target="_blank" title="새창이동"><img src="/user_img/pa3.png" alt=""></a>
	            </li>
	            <li>
	                <a href="#lnk" target="_blank" title="새창이동"><img src="/user_img/pa4.png" alt=""></a>
	            </li>
	        </ul>
	    </div>
        <%@include file="./include/footer.jsp" %>
    </body>
</html>
