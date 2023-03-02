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




<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="./summerNote/summernote-lite.js"></script>
<script src="./summerNote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./summerNote/summernote-lite.css">
<!--  -->




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
				
				
 				
				<form id="frm" name="frm" method="post" action="/main1/submit_notice" enctype="multipart/form-data" accept-charset="utf-8">				
					<div class="container login" data-v-4ec1fe02="" data-v-3007c576="">
						<div class="content lg" data-v-4ec1fe02="">
							<div class="login_area" data-v-4ec1fe02="">
								<h2 class="login_title" data-v-4ec1fe02="">
									<span class="blind" data-v-4ec1fe02="">KREAM</span>
								</h2>
								<div class="has_button input_box" data-v-0e527ea4="" data-v-4ec1fe02="">
									<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">제목</h3>
									<div class="input_item" data-v-0e527ea4="">
										<input name="title" type="text" placeholder="제목을 입력하세요" class="input_txt" data-v-0e527ea4="">									
									</div>								
								</div>
								<div class="has_button input_box" data-v-0e527ea4="" data-v-4ec1fe02="">
									<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">이미지</h3>
									<div class="input_item" data-v-0e527ea4="">
										<input name="file" type="file" placeholder="이미지" class="input_txt" data-v-0e527ea4="">									
									</div>								
								</div>
								<div class="has_button input_box" data-v-0e527ea4="" data-v-4ec1fe02="">
									<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">내용</h3>
									<div class="input_item" data-v-0e527ea4="">
										<textarea name="content" rows="10" class="input_textarea" data-v-0e527ea4="" style="width: 400px;border: 2px solid;"></textarea>																	
									</div>								
								</div>
								
								
								
								
								<div class="login_btn_box" data-v-4ec1fe02="">
									<a href="javascript:$('#frm').submit();" class="btn full solid" data-v-3d1bcc82="" data-v-4ec1fe02=""> 공지사항 등록 </a>
								</div>																			
							</div>
						</div>
					</div>
				</form>	
				
				 
				
<!-- 							
				<form id="frm" name="frm" method="post" action="/main1/submit_notice" enctype="multipart/form-data" accept-charset="utf-8">
				
					<div class="container">
					  <textarea class="summernote" name="editordata"></textarea>    
					</div>				
				
				</form>				
 -->							
<!-- <script>
$('.summernote').summernote({
	  height: 450,
	  lang: "ko-KR"
	});
</script>
 -->							
							
							
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
	$(window).load(function() { 						
		//ajax_notice();			
	});
	
	function ajax_notice(){		
		var str = '';
        $.ajax({
            type : "POST",
            url : "/main1/ajax_notice",
            data : 'notice.st_num=0&notice.ed_num=10',
            success : function(res){
            	var master = $.parseJSON(res);
            	for (var i = 0; i < master.listNotice.length; i++) {
            		var noticeItem = master.listNotice[i];
            		var content = noticeItem.content;
            		var date = noticeItem.date;
            		var title = noticeItem.title;
            		
            		str+='<li data-v-0067a928="">';
            		str+='	<div data-v-0067a928="" class="dropdown">';
            		str+='		<div data-v-0067a928="" class="dropdown_head">';
            		str+='			<div data-v-0067a928="" class="title_box">';
            		str+='				<p data-v-0067a928="" class="title">'+title+'</p>';
            		str+='			</div>';
            		str+='		</div>';
            		str+='	</div>';
            		str+='</li>';
				}
            	
            	$('.dropdown_list').html(str);
            	
            	$('.dropdown_list').click(function(){
					alert(1);            		
            	});
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	}
</script>




</html>