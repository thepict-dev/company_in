<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../admin/header.jsp">
	<c:param name="pageTitle" value="프로젝트 리스트"/>
</c:import>
<body class="sb-nav-fixed">
	<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
		<%@include file="./navigation.jsp"%>
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<%@include file="./gnb.jsp"%>
			</div>
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">프로젝트 등록</h2>
					<div class="contents-box" style="position:relative">
						<div class="card">
							<div class="card-body">
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">카테고리</label>
										<div class="input-box">
											<select id="category" name="category" style="width:250px;">
												<option value="school" <c:if test="${pictVO.category eq 'school'}">selected</c:if> >school</option>
		                    					<option value="commercial" <c:if test="${pictVO.category eq 'commercial'}">selected</c:if> >commercial</option>
		                    					<option value="residence" <c:if test="${pictVO.category eq 'residence'}">selected</c:if> >residence</option>
		                    					<option value="government" <c:if test="${pictVO.category eq 'government'}">selected</c:if> >government</option>
		                    					<option value="etc" <c:if test="${pictVO.category eq 'etc'}">selected</c:if> >etc</option>
											</select>
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">프로젝트명</label>
										<div class="input-box">
											<input type="text" id="title" name="title" value="${pictVO.title}" class="input opt-max-width-500">
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">면적</label>
										<div class="input-box">
											<input type="text" id="area" name="area" value="${pictVO.area}" class="input opt-max-width-300">
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">타입</label>
										<div class="input-box">
											<input type="text" id="type" name="type" value="${pictVO.type}" class="input opt-max-width-300">
										</div>
									</div>
								</div>
								
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">주소</label>
										<div class="input-box">
											<input type="text" id="address" name="address" value="${pictVO.address}" class="input opt-max-width-500">
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">설명</label>
										<textarea name="text" id="text" cols="30" rows="10" class="txt" style="width:100%;">${pictVO.text}</textarea>
				                         <!-- 에디터 설정 -->
										<script type="text/javascript">
											var oEditors = [];
											nhn.husky.EZCreator.createInIFrame({
												oAppRef: oEditors,
												elPlaceHolder: "text", //textarea에서 지정한 id와 일치해야 합니다.
												sSkinURI: "/js/SmartEditor2Skin.html",
												fCreator: "createSEditor2"
											});
										</script>
									</div>
								</div>
								<div class="write-item" id="file_div">
									<label for="title" class="title">썸네일*</label>
									<div class="input-box">
										<input style="margin-bottom:15px" type="file" id="attach_file1" name="attach_file1" value="${pictVO.img_url1}" class="input opt-max-width-600">
										<div class="select_img_thumb1" id="select_img_thumb1">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file2" name="attach_file2" value="${pictVO.img_url2}" class="input opt-max-width-600">
										<div class="select_img_thumb2" id="select_img_thumb2">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file3" name="attach_file3" value="${pictVO.img_url3}" class="input opt-max-width-600">
										<div class="select_img_thumb3" id="select_img_thumb3">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file4" name="attach_file4" value="${pictVO.img_url4}" class="input opt-max-width-600">
										<div class="select_img_thumb4" id="select_img_thumb4">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file5" name="attach_file5" value="${pictVO.img_url5}" class="input opt-max-width-600">
										<div class="select_img_thumb5" id="select_img_thumb5">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file6" name="attach_file6" value="${pictVO.img_url6}" class="input opt-max-width-600">
										<div class="select_img_thumb6" id="select_img_thumb6">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file7" name="attach_file7" value="${pictVO.img_url7}" class="input opt-max-width-600">
										<div class="select_img_thumb7" id="select_img_thumb7">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file8" name="attach_file8" value="${pictVO.img_url8}" class="input opt-max-width-600">
										<div class="select_img_thumb8" id="select_img_thumb8">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file9" name="attach_file9" value="${pictVO.img_url9}" class="input opt-max-width-600">
										<div class="select_img_thumb9" id="select_img_thumb9">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file10" name="attach_file10" value="${pictVO.img_url10}" class="input opt-max-width-600">
										<div class="select_img_thumb10" id="select_img_thumb10">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file11" name="attach_file11" value="${pictVO.img_url11}" class="input opt-max-width-600">
										<div class="select_img_thumb11" id="select_img_thumb11">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file12" name="attach_file12" value="${pictVO.img_url12}" class="input opt-max-width-600">
										<div class="select_img_thumb12" id="select_img_thumb12">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file13" name="attach_file13" value="${pictVO.img_url13}" class="input opt-max-width-600">
										<div class="select_img_thumb13" id="select_img_thumb13">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file14" name="attach_file14" value="${pictVO.img_url14}" class="input opt-max-width-600">
										<div class="select_img_thumb14" id="select_img_thumb14">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>
										
										<input style="margin-bottom:15px" type="file" id="attach_file15" name="attach_file15" value="${pictVO.img_url15}" class="input opt-max-width-600">
										<div class="select_img_thumb15" id="select_img_thumb15">
										    <img src="" style="width:200px; margin-bottom:15px;"/>
										</div>

				            			
									</div>
								</div>
								
								<div class="btn-box">
									<c:if test="${pictVO.saveType eq 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">등록</button>
									</c:if>
									<c:if test="${pictVO.saveType ne 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">수정</button>
									</c:if>
						        	<button type="button" onclick="javascript:popup_list();" class="btn-basic btn-common btn-sm">목록보기</button>    
					            </div>
							</div>
						</div>
						
		            </div>
		            
				</main>
			</div>
		</div>
		<input type='hidden' name="saveType" id="saveType" value='${pictVO.saveType}' /> 
		<input type='hidden' name="idx" id="idx" value='${pictVO.idx}' /> 
		<input type="hidden" name="fairpath_id" id="fairpath_id" value="${pictVO.fairpath_id}">
	</form>

	<script>
		$( document ).ready(function() {
			var img_url1 = '${pictVO.img_url1}';
			if (img_url1) {
			    $('#select_img_thumb1').show();
			    $(".select_img_thumb1 img").attr("src", img_url1).width(200);
			} else {
			    $('#select_img_thumb1').hide();
			}

			var img_url2 = '${pictVO.img_url2}';
			if (img_url2) {
			    $('#select_img_thumb2').show();
			    $(".select_img_thumb2 img").attr("src", img_url2).width(200);
			} else {
			    $('#select_img_thumb2').hide();
			}

			var img_url3 = '${pictVO.img_url3}';
			if (img_url3) {
			    $('#select_img_thumb3').show();
			    $(".select_img_thumb3 img").attr("src", img_url3).width(200);
			} else {
			    $('#select_img_thumb3').hide();
			}

			var img_url4 = '${pictVO.img_url4}';
			if (img_url4) {
			    $('#select_img_thumb4').show();
			    $(".select_img_thumb4 img").attr("src", img_url4).width(200);
			} else {
			    $('#select_img_thumb4').hide();
			}

			var img_url5 = '${pictVO.img_url5}';
			if (img_url5) {
			    $('#select_img_thumb5').show();
			    $(".select_img_thumb5 img").attr("src", img_url5).width(200);
			} else {
			    $('#select_img_thumb5').hide();
			}

			var img_url6 = '${pictVO.img_url6}';
			if (img_url6) {
			    $('#select_img_thumb6').show();
			    $(".select_img_thumb6 img").attr("src", img_url6).width(200);
			} else {
			    $('#select_img_thumb6').hide();
			}

			var img_url7 = '${pictVO.img_url7}';
			if (img_url7) {
			    $('#select_img_thumb7').show();
			    $(".select_img_thumb7 img").attr("src", img_url7).width(200);
			} else {
			    $('#select_img_thumb7').hide();
			}

			var img_url8 = '${pictVO.img_url8}';
			if (img_url8) {
			    $('#select_img_thumb8').show();
			    $(".select_img_thumb8 img").attr("src", img_url8).width(200);
			} else {
			    $('#select_img_thumb8').hide();
			}

			var img_url9 = '${pictVO.img_url9}';
			if (img_url9) {
			    $('#select_img_thumb9').show();
			    $(".select_img_thumb9 img").attr("src", img_url9).width(200);
			} else {
			    $('#select_img_thumb9').hide();
			}

			var img_url10 = '${pictVO.img_url10}';
			if (img_url10) {
			    $('#select_img_thumb10').show();
			    $(".select_img_thumb10 img").attr("src", img_url10).width(200);
			} else {
			    $('#select_img_thumb10').hide();
			}

			var img_url11 = '${pictVO.img_url11}';
			if (img_url11) {
			    $('#select_img_thumb11').show();
			    $(".select_img_thumb11 img").attr("src", img_url11).width(200);
			} else {
			    $('#select_img_thumb11').hide();
			}

			var img_url12 = '${pictVO.img_url12}';
			if (img_url12) {
			    $('#select_img_thumb12').show();
			    $(".select_img_thumb12 img").attr("src", img_url12).width(200);
			} else {
			    $('#select_img_thumb12').hide();
			}

			var img_url13 = '${pictVO.img_url13}';
			if (img_url13) {
			    $('#select_img_thumb13').show();
			    $(".select_img_thumb13 img").attr("src", img_url13).width(200);
			} else {
			    $('#select_img_thumb13').hide();
			}

			var img_url14 = '${pictVO.img_url14}';
			if (img_url14) {
			    $('#select_img_thumb14').show();
			    $(".select_img_thumb14 img").attr("src", img_url14).width(200);
			} else {
			    $('#select_img_thumb14').hide();
			}

			var img_url15 = '${pictVO.img_url15}';
			if (img_url15) {
			    $('#select_img_thumb15').show();
			    $(".select_img_thumb15 img").attr("src", img_url15).width(200);
			} else {
			    $('#select_img_thumb15').hide();
			}

		});
		$('#attach_file1').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file1').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb1').show();
		            $(".select_img_thumb1 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb1 img").attr("src", "");
		    }
		});

		$('#attach_file2').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file2').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb2').show();
		            $(".select_img_thumb2 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb2 img").attr("src", "");
		    }
		});

		$('#attach_file3').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file3').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb3').show();
		            $(".select_img_thumb3 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb3 img").attr("src", "");
		    }
		});

		$('#attach_file4').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file4').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb4').show();
		            $(".select_img_thumb4 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb4 img").attr("src", "");
		    }
		});

		$('#attach_file5').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file5').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb5').show();
		            $(".select_img_thumb5 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb5 img").attr("src", "");
		    }
		});

		$('#attach_file6').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file6').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb6').show();
		            $(".select_img_thumb6 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb6 img").attr("src", "");
		    }
		});

		$('#attach_file7').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file7').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb7').show();
		            $(".select_img_thumb7 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb7 img").attr("src", "");
		    }
		});

		$('#attach_file8').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file8').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb8').show();
		            $(".select_img_thumb8 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb8 img").attr("src", "");
		    }
		});

		$('#attach_file9').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file9').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb9').show();
		            $(".select_img_thumb9 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb9 img").attr("src", "");
		    }
		});

		$('#attach_file10').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file10').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb10').show();
		            $(".select_img_thumb10 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb10 img").attr("src", "");
		    }
		});

		$('#attach_file11').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file11').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb11').show();
		            $(".select_img_thumb11 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb11 img").attr("src", "");
		    }
		});

		$('#attach_file12').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file12').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb12').show();
		            $(".select_img_thumb12 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb12 img").attr("src", "");
		    }
		});

		$('#attach_file13').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file13').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb13').show();
		            $(".select_img_thumb13 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb13 img").attr("src", "");
		    }
		});

		$('#attach_file14').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file14').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb14').show();
		            $(".select_img_thumb14 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb14 img").attr("src", "");
		    }
		});

		$('#attach_file15').change(function() {
		    if (this.files && this.files[0]) {
		        if (this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image') {
		            alert('이미지 파일만 첨부할 수 있습니다.');
		            $('#attach_file15').val("");
		            return false;
		        }
		        var reader = new FileReader();
		        reader.onload = function(data) {
		            $('#select_img_thumb15').show();
		            $(".select_img_thumb15 img").attr("src", data.target.result).width(200);
		        }
		        reader.readAsDataURL(this.files[0]);
		    } else {
		        $(".select_img_thumb15 img").attr("src", "");
		    }
		});

		function board_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/admin/project_delete.do");
				$("#register").submit();
			}
			
		}
		function board_list() {
			location.href = "/admin/project_list.do";
		}
		function button1_click() {
			var title = $('#title').val();
			var category = $('#category').val();
			
			var saveType = $('#saveType').val();
			
			if (category == "" || category == undefined) {
				window.alert("카테고리를 선택해주세요.");
				$('#category').focus();
				return false;
			}
			if (title == "" || title == undefined) {
				window.alert("프로젝트명을 입력해주세요.");
				$('#title').focus();
				return false;
			}


			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}
			oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
			if (confirm(text)) {
				$("#register").attr("action", "/admin/project_save.do");
				$("#register").submit();
			}
		}
		
	</script>

	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>

</body>
</html>