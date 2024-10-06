<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../admin/header.jsp">
    	<c:param name="pageTitle" value="프로젝트 리스트"/>
    </c:import>
    <style type="text/css">
		.paginations{
		    display: flex;
   			justify-content: center;
		    column-gap: 5px;
		    width: 100%;
		    max-width: 513px;
		    margin: 0 auto;
		    padding: 25px 0 30px 0;
		}
		.paginations li{
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    width: 32px;
		    height: 32px;
		    border-radius: 8px;
		    border: 1px solid #F1F1F1;
		    font-size: 13px;
		    font-weight: 600;
		    font-family: var(--fn-open);
		}
		.paginations li.cut{
		    border: 0;
		}
		.paginations li a{
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    width: 100%;
		    height: 100%;
		    color: #333;
		    border-radius: 8px;
		    text-decoration: none;
		}
		.paginations li.active a{
		    color: #fff;
		    background-color: #0575E6;
		}
	</style>
    <body class="sb-nav-fixed">
        <%@include file="./navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="./gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">프로젝트 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
							    <div class="search-form">
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box" style="max-width:700px">
							    		<div style="position : relative">
								    		<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="이름 혹은 연락처로 검색하세요." autocomplete="off" onkeypress="if(event.keyCode == 13){search();}" style="margin-left:50px">
								    		<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    		</div>
							    		<select id="category" name="category" style="width:250px; margin-left:65px" class="input opt-max-width-500">
											<option value="" <c:if test="${pictVO.category eq '' || pictVO.category eq null || pictVO.category eq undefined}">selected</c:if>>전체</option>
											<option value="school" <c:if test="${pictVO.category eq 'school'}">selected</c:if>>school</option>
											<option value="commercial" <c:if test="${pictVO.category eq 'commercial'}">selected</c:if>>commercial</option>
											<option value="residence" <c:if test="${pictVO.category eq 'residence'}">selected</c:if>>residence</option>
											<option value="government" <c:if test="${pictVO.category eq 'government'}">selected</c:if>>government</option>
											<option value="etc" <c:if test="${pictVO.category eq 'etc'}">selected</c:if>>etc</option>
										</select>
								    	
							    	</form>
							    </div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:20%;">
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:20%;">
							        		<col style="width:20%;">
							        		<col style="width:10%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
							                    <th>카테고리</th>
							                    <th>프로젝트</th>
							                    <th>면적</th>
							                    <th>타입</th>
							                    <th>주소</th>
							                    <th>등록일</th>
							                    <th>삭제</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
							                    	
						                    		<c:if test="${pictVO.pageNumber eq 1}">
														<td>${board_cnt - status.index}</td>					
													</c:if>
													<c:if test="${pictVO.pageNumber ne 1}">
														<td>${board_cnt - (status.index +  ((pictVO.pageNumber - 1) * 20))}</td>
													</c:if>
													<td>
							                    		<c:if test="${resultList.category eq 'school'}">school</c:if>
							                    		<c:if test="${resultList.category eq 'commercial'}">commercial</c:if>
							                    		<c:if test="${resultList.category eq 'residence'}">residence</c:if>
							                    		<c:if test="${resultList.category eq 'government'}">government</c:if>
							                    		<c:if test="${resultList.category eq 'etc'}">etc</c:if>
						                    		</td>
							                    	<td class="opt-tl"><a href="javascript:void(0);" onclick="board_mod('${resultList.idx}');" class="link">${resultList.title}</a></td>
							                    	<td>${resultList.area}</td>
							                    	<td>${resultList.type}</td>
						                    		<td>${resultList.address}</td>
							                    	<td>${resultList.reg_date}</td>
							                    	<td>
							                    		<button type="button" onclick="javascript:user_delete('${resultList.idx}')" class="btn-basic btn-fill btn-sm">삭제</button>
									            	</td>
								                </tr>
							                </c:forEach>
							            </tbody>
						            </table>
				            	</div>
				            </div>
				            <ul class="paginations">
								<c:if test="${pictVO.pageNumber ne 1}">
									<li><a href="/admin/project_list.do?search_text=${pictVO.search_text}&category=${pictVO.category}&pageNumber=1"><img src="/img/First.png" alt=""></a></li>
									<li><a href="/admin/project_list.do?search_text=${pictVO.search_text}&category=${pictVO.category}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img src="/img/Prev.png" alt=""></a></li>
								</c:if>	
							
								<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
									<c:if test="${i eq pictVO.pageNumber}">
										<li class="active"><a href="/project_list.do?search_text=${pictVO.search_text}&category=${pictVO.category}&pageNumber=${i}" >${i}</a></li>
									</c:if>
									<c:if test="${i ne pictVO.pageNumber}">
										<li><a href="/admin/project_list.do?search_text=${pictVO.search_text}&category=${pictVO.category}&pageNumber=${i}" >${i}</a></li>
									</c:if>
								</c:forEach>	
						
								<c:if test="${pictVO.lastPage ne pictVO.pageNumber}">
									<li><a href="/admin/project_list.do?search_text=${pictVO.search_text}&category=${pictVO.category}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img src="/img/Next.png" alt=""></a></li>
									<li><a href="/admin/project_list.do?search_text=${pictVO.search_text}&category=${pictVO.category}&pageNumber=${pictVO.lastPage}"><img src="/img/Last.png" alt=""></a></li>
								</c:if>
							</ul>
			            </div>
		            </div>
				</main>
			</div>
			<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
				<input type="hidden" name="idx" id="idx" value="" />
			</form>
		</div>
		<script>
			function user_delete(idx) {
				if (confirm("삭제 하시겠습니까?")) {
					$('#idx').val(idx)
					$("#register").attr("action", "/admin/project_delete.do");
					$("#register").submit();
				}
			}
			$('#category').on('change', function() {
				$("#search_fm").attr("action", "/admin/project_list.do");
				$("#search_fm").submit();
	        });
			function board_mod(idx){
				location.href= "/admin/project_register.do?idx="+idx;
			}		
			function board_insert(){
				location.href= "/admin/project_register.do";
			}		
			function search(){
				$("#search_fm").attr("action", "/admin/project_list.do");
				$("#search_fm").submit();
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>