<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>

<link href="/resources/_nuxt/css/89d8b41.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/aeacc94.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/46f6373.css" rel="stylesheet" />

<!-- Log CSS -->
<link href="/resources/_nuxt/css/0f788f7.css" rel="stylesheet" />
<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>
				
				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<jsp:include page="../nav1/header.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>				
				</div>
				
				<!-- 동기 방식으로 submit 하기 위해 -->
				<form id="frm" name="frm" method="post" action="/main1/update_notice_action" enctype="multipart/form-data" accept-charset="utf-8">				
					<input name="notice.seq" type="hidden" value="<%=request.getAttribute("seq")%>">	
					<div class="container login" data-v-4ec1fe02="" data-v-3007c576="">
						<div class="content lg" data-v-4ec1fe02="">
							<div class="login_area" data-v-4ec1fe02="">
								<h2 class="login_title" data-v-4ec1fe02="">
									<span class="blind" data-v-4ec1fe02="">hwang</span>
								</h2>
								<div class="has_button input_box" data-v-0e527ea4="" data-v-4ec1fe02="">
									<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">제목</h3>
									<div class="input_item" data-v-0e527ea4="">
										<input id="title" name="notice.title" type="text" value="" class="input_txt" data-v-0e527ea4="">									
									</div>								
								</div>
								<div class="has_button input_box" data-v-0e527ea4="" data-v-4ec1fe02="">
									<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">이미지</h3>
									<div class="input_item" data-v-0e527ea4="">
										<img id="img_url" name="notice.img_url" src=""/>									
									</div>								
								</div>
								<div class="has_button input_box" data-v-0e527ea4="" data-v-4ec1fe02="">
									<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">이미지</h3>
									<div class="input_item" data-v-0e527ea4="">
										<input id="file" name="file" type="file" class="input_txt" data-v-0e527ea4="">									
									</div>								
								</div>
								<div class="has_button input_box" data-v-0e527ea4="" data-v-4ec1fe02="">
									<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">설명글</h3>
									<div class="input_item" data-v-0e527ea4="">
										<textarea id="content" name="notice.content" rows="10" class="input_textarea" data-v-0e527ea4="" style="width: 100%;border: 2px solid rgb(213, 194, 194);"></textarea>																	
									</div>								
								</div>
								<div class="login_btn_box" data-v-4ec1fe02="">
									<a href="javascript:$('#frm').submit();" class="btn full solid" data-v-3d1bcc82="" data-v-4ec1fe02=""> 수정하기</a>
								</div>
								<!--  <div class="login_btn_box" data-v-4ec1fe02="">
									<a href="javascript:ajax_upload();" class="btn full solid" data-v-3d1bcc82="" data-v-4ec1fe02=""> 수정하기 비동기</a>
								</div>  -->																	
							</div>
						</div>
					</div>
				</form>				
				<div class="footer lg" data-v-1761bbf0="" data-v-3007c576="">
					<jsp:include page="../nav1/footer.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>					
				</div>			
			</div>
		</div>
	</div>	
</body>

<script>	
	var seq = '<%=request.getAttribute("seq")%>';
	$(window).load(function() { 			
		ajax_notice_detail(seq);			
	});
	
	function ajax_notice_detail(seq){		
		var str = '';
		$.LoadingOverlay("show");
	    $.ajax({
	        type : "POST",
	        url : "/main1/ajax_notice_detail",
	        data : 'notice.seq='+seq,
	        success : function(res){
	    		$.LoadingOverlay("hide");
	        	var master = $.parseJSON(res);
	        	var o = master.notice;
	        	
	        	var content = o.content;
	        	var date = o.date;            		
	        	var email = o.email;            		            	
	        	var title = o.title;
	        	var img_url = o.img_url;
	        	
	        	//검색 
	        	var keyword = o.keyword;
	        	
	        	$('#title').val(title);
	        	$('#content').val(content);
	        	$('#img_url').attr('src',img_url);	        	
	        },
	        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	            alert("통신 실패.")
	        }
	    });
	}
	
	function ajax_upload(){	
		cmm.fileUploadUI('file', successFileFunction);		
	}
	
	function successFileFunction(res){
		if(res == null){// 이미지를 업로드 하지 않았을 경우
			console.log(res);
		}else{// 이미지 있을경우
			var master = $.parseJSON(res);
			var str = '';
			if(master.code == '0000'){ // 업로드 성공
				 $('#img_url').val(master.files.url);			
			}else{
				alert('업로드 실패');
			}	
		}	
						
		// 공지사항 수정 ajax 호출		
		$.ajax({
            type : "POST",
            url : "/main1/ajax_update_notice_action",
            data : $('#frm').serialize(),
            success : function(res){
            	window.location = '/main/notice';
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	}
</script>
</html>