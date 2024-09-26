<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String url = request.getRequestURL().toString();
	pageContext.setAttribute("url", url);
	
%>

<c:set var="about" value="${fn:indexOf(url, 'about')}"/>
<c:set var="project" value="${fn:indexOf(url, 'project')}"/>
<c:set var="partners" value="${fn:indexOf(url, 'partners')}"/>

<header>
    <div class="headerInner">
        <h1><a href="/"><img src="/user_img/logo.png" alt=""></a></h1>
        <ul class="nav">
            <li <c:if test="${about ne -1}">class="active"</c:if>><a href="/about.do">About</a></li>
            <li <c:if test="${project ne -1}">class="active"</c:if>><a href="/project.do">Project</a></li>
            <li <c:if test="${partners ne -1}">class="active"</c:if>><a href="/partners.do">Partners</a></li>
            <li><a href="#lnk" target="_blank" title="새창이동">@in_i.d</a></li>
        </ul>
        <button type="button" class="mb">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                <mask id="mask0_75_554" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
                <rect width="24" height="24" fill="#D9D9D9"/>
                </mask>
                <g mask="url(#mask0_75_554)">
                <path d="M3.5 17.6345V16.1347H20.5V17.6345H3.5ZM3.5 12.75V11.25H20.5V12.75H3.5ZM3.5 7.86523V6.36548H20.5V7.86523H3.5Z" fill="#1C1B1F"/>
                </g>
            </svg>
        </button>
    </div>
    <div class="mbNavContainer">
        <button type="button"><img src="/user_img/close.png" alt=""></button>
        <ul class="mbNav">
            <li><a href="/about.do">About</a></li>
            <li><a href="/project.do">Project</a></li>
            <li><a href="/partners.do">Partners</a></li>
            <li><a href="#lnk" target="_blank" title="새창이동">@in_i.d</a></li>
        </ul>
    </div>
</header>