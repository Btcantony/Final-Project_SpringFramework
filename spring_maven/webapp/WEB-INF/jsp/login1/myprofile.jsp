<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>
<link href="/resources/_nuxt/css/fc8ba0e.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/cbbd74c.css" rel="stylesheet" />

<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>
				
				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<jsp:include page="../nav1/header.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>				
				</div>
				
				<div class="container my lg" data-v-3d7f7af7>


					<jsp:include page="../nav1/mypagemenu.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>				





					<div data-v-7fba8f8c="" data-v-3d7f7af7="" class="content_area">
						<div data-v-7fba8f8c="" class="my_profile">
							<div data-v-88eb18f6="" data-v-7fba8f8c="" class="content_title border">
								<div data-v-88eb18f6="" class="title">
									<h3 data-v-88eb18f6="">프로필 정보</h3>
									<!---->
								</div>
								<!---->
							</div>
							<div data-v-6dea036d="" data-v-7fba8f8c="" class="user_profile">
								<div data-v-6dea036d="" class="profile_thumb">
									<img data-v-6dea036d="" src="http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg" alt="사용자 이미지" class="thumb_img" id="img_url" >
								</div>
								<div data-v-6dea036d="" class="profile_detail">
									<strong data-v-6dea036d="" class="name" id="nick_name1">tonyhoon.hwang</strong>
									<div data-v-6dea036d="" class="profile_btn_box">
										<a data-v-3d1bcc82="" data-v-6dea036d="" href="#" class="btn outlinegrey small"> 이미지 변경 </a><a data-v-3d1bcc82="" data-v-6dea036d="" href="#" class="btn outlinegrey small"> 삭제 </a>
									</div>
								</div>
							</div>
							<input data-v-7fba8f8c="" type="file" accept="image/jpeg,image/png" hidden="hidden">
							<canvas data-v-7fba8f8c="" width="1000" height="1000" style="display: none;"></canvas>
							<div data-v-7fba8f8c="" class="profile_info">
								<div data-v-7fba8f8c="" class="profile_group">
									<h4 data-v-7fba8f8c="" class="group_title">로그인 정보</h4>
									<div data-v-7fba8f8c="" class="unit">
										<h5 data-v-7fba8f8c="" class="title">이메일 주소</h5>
										<p data-v-7fba8f8c="" class="desc email" id="email">t************g@gmail.com</p>
										<!-- 이메일 변경하기 -->
										<button data-v-3d1bcc82="" data-v-7fba8f8c="" type="button" class="btn btn_modify outlinegrey small">변경</button>
									
									</div>
									<div data-v-7fba8f8c="" class="modify" style="display: none;">
										<div data-v-6c561060="" data-v-7fba8f8c="" class="input_box has_error">
											<h6 data-v-7fba8f8c="" data-v-6c561060="" class="input_title">이메일 주소 변경</h6>
											<div data-v-6c561060="" class="input_item">
												<input data-v-6c561060="" type="email" autocomplete="off" class="input_txt text_fill" placeholder="t************g@gmail.com">
											</div>
											<p data-v-7fba8f8c="" data-v-6c561060="" class="input_error">이미 사용 중인 이메일입니다.</p>
										</div>
										<div data-v-7fba8f8c="" class="modify_btn_box">
											<button data-v-3d1bcc82="" data-v-7fba8f8c="" type="button" class="btn outlinegrey medium" slot="button">취소</button>
											<button data-v-3d1bcc82="" data-v-7fba8f8c="" type="button" class="btn solid medium disabled" slot="button" disabled="disabled">인증 메일 발송</button>
										</div>
									</div>
									<div data-v-7fba8f8c="" class="unit">
										<h5 data-v-7fba8f8c="" class="title">비밀번호</h5>
										<p data-v-7fba8f8c="" class="desc password">●●●●●●●●●</p>
										<button data-v-3d1bcc82="" data-v-7fba8f8c="" type="button" class="btn btn_modify outlinegrey small">변경</button>
									</div>
									<div data-v-7fba8f8c="" class="modify" style="display: none;">
										<h5 data-v-7fba8f8c="" class="title">비밀번호 변경</h5>
										<div data-v-6c561060="" data-v-7fba8f8c="" class="input_box">
											<h6 data-v-7fba8f8c="" data-v-6c561060="" class="input_title">이전 비밀번호</h6>
											<div data-v-6c561060="" class="input_item">
												<input data-v-6c561060="" type="password" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="input_txt text_fill">
											</div>
											<p data-v-7fba8f8c="" data-v-6c561060="" class="input_error">영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)</p>
										</div>
										<div data-v-6c561060="" data-v-7fba8f8c="" class="input_box">
											<h6 data-v-7fba8f8c="" data-v-6c561060="" class="input_title">새 비밀번호</h6>
											<div data-v-6c561060="" class="input_item">
												<input data-v-6c561060="" type="password" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="input_txt">
											</div>
											<p data-v-7fba8f8c="" data-v-6c561060="" class="input_error">영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)</p>
										</div>
										<div data-v-7fba8f8c="" class="modify_btn_box">
											<button data-v-3d1bcc82="" data-v-7fba8f8c="" type="button" class="btn outlinegrey medium" slot="button">취소</button>
											<button data-v-3d1bcc82="" data-v-7fba8f8c="" disabled="disabled" type="button" class="btn solid medium disabled" slot="button">저장</button>
										</div>
									</div>
								</div>
								<div data-v-7fba8f8c="" class="profile_group">
									<h4 data-v-7fba8f8c="" class="group_title">개인 정보</h4>
									<div data-v-7fba8f8c="" class="unit">
										<h5 data-v-7fba8f8c="" class="title">이름</h5>
										<p data-v-7fba8f8c="" class="desc" id="nick_name2" >tonyhoon.hwang</p>
										<!-- 닉네임 변경하기 -->
										<button data-v-3d1bcc82="" data-v-7fba8f8c="" type="button" class="btn btn_modify outlinegrey small">변경</button>
									</div>
									<div data-v-7fba8f8c="" class="modify name" style="display: none;">
										<h5 data-v-7fba8f8c="" class="title">이름</h5>
										<div data-v-6c561060="" data-v-7fba8f8c="" class="input_box">
											<h6 data-v-7fba8f8c="" data-v-6c561060="" class="input_title">새로운 이름</h6>
											<div data-v-6c561060="" class="input_item">
												<input data-v-6c561060="" type="text" placeholder="고객님의 이름" autocomplete="off" class="input_txt">
											</div>
											<p data-v-7fba8f8c="" data-v-6c561060="" class="input_error">올바른 이름을 입력해주세요. (2-50자)</p>
										</div>
										<div data-v-7fba8f8c="" class="modify_btn_box">
											<button data-v-3d1bcc82="" data-v-7fba8f8c="" type="button" class="btn outlinegrey medium" slot="button">취소</button>
											<button data-v-3d1bcc82="" data-v-7fba8f8c="" disabled="disabled" type="button" class="btn solid medium disabled" slot="button">저장</button>
										</div>
									</div>
									<div data-v-7fba8f8c="" class="unit">
										<h5 data-v-7fba8f8c="" class="title">휴대폰 번호</h5>
										<p data-v-7fba8f8c="" class="desc" id="phone_num" >010-2***-*159</p>
										<button data-v-3d1bcc82="" data-v-7fba8f8c="" type="button" class="btn btn_modify outlinegrey small">변경</button>
									</div>
<!-- 									<div data-v-7fba8f8c="" class="unit">
										<h5 data-v-7fba8f8c="" class="title">신발 사이즈</h5>
										<p data-v-7fba8f8c="" class="desc">260</p>
										<button data-v-3d1bcc82="" data-v-7fba8f8c="" type="button" class="btn btn_modify outlinegrey small">변경</button>
									</div>
 -->									
								</div>
								<div data-v-7fba8f8c="" class="profile_group">
									
								</div>
								<a data-v-7fba8f8c="" href="/my/withdrawal" class="btn_withdrawal">회원 탈퇴</a>
							</div>
						</div>
					</div>


				</div>				
				
				
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
/*  	makeBoldClick();	
 */	ajax_myprofile();
});


function ajax_myprofile(){
	// 나의 정보를 가지고 온다
	$.ajax({
        type : "POST",
        url : "/login1/ajax_myprofile", 
        data : '',
        success : function(res){
        	var master = $.parseJSON(res);
        	var myprof = master.join;
        	
        	var email = myprof.email; 
        	var image_url = myprof.image_url;             		
        	var nick_name = myprof.nick_name;             		            	
        	var phone_num = myprof.phone_num; 
        	
        	$('#email').text(email);
        	$('.thumb_img').attr('src',image_url);   		
        	$('#nick_name1').text(nick_name + " 님");
        	$('#nick_name2').text(nick_name);
        	$('#phone_num').text(phone_num);
     		        		
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        }
    });		
		
}





/* function makeBoldClick(){
makeBold();
}

function makeBold(){
$('#my1').addClass('menu_on');
$('#my2').removeClass('menu_on');
$('#my3').removeClass('menu_on');
$('#my4').removeClass('menu_on');
}
 */

</script>
</html>