<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


<!-- head 부분 따로 jsp파일로 빼놓은 부분 -->

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>

<!------------------------------------->
<!-- Log CSS -->
<link href="/resources/_nuxt/css/0f788f7.css" rel="stylesheet" />

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>
			
<!-------------   jsp include 로 header.jsp 연결 (공통부분 발라내기)  ---------->
				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<jsp:include page="../nav1/header.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>	
				</div>
<!-- -----------------------------------------------------------------	-->				
								
				
				<div class="container login" data-v-4ec1fe02="" data-v-3007c576="">
					<div class="content lg" data-v-4ec1fe02="">
						<div class="login_area" data-v-4ec1fe02="">
							<h2 class="login_title" data-v-4ec1fe02="">
								<span class="blind" data-v-4ec1fe02="">KREAM</span>
							</h2>
							<div class="has_button input_box" data-v-0e527ea4="" data-v-4ec1fe02="">
								<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">이메일 주소</h3>
								<div class="input_item" data-v-0e527ea4="">
									<input id="email" type="text" placeholder="예) nftMarket@gmail.com" autocomplete="off" class="input_txt" data-v-0e527ea4="" value="neooper@naver.com">									
								</div>
								<p class="input_error" data-v-0e527ea4="" data-v-4ec1fe02="">이메일 주소를 정확히 입력해주세요.</p>
							</div>
							<div class="input_box has_button" data-v-0e527ea4="" data-v-4ec1fe02="">
								<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">비밀번호</h3>
								<div class="input_item" data-v-0e527ea4="">
									<input id="password" type="password" placeholder="" autocomplete="off" class="input_txt" data-v-0e527ea4="" value="">
								</div>
								<p class="input_error" data-v-0e527ea4="" data-v-4ec1fe02=""> 영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자) </p>
							</div>
							<div class="login_btn_box" data-v-4ec1fe02="">
								<a href="#" class="btn full solid" data-v-3d1bcc82="" data-v-4ec1fe02=""> 로그인 </a>
							</div>
							
							<div class="social_login" data-v-4ec1fe02="">
								<button type="button" class="btn btn_login_naver full outline login_btn_box_kakao" data-v-3d1bcc82="" data-v-4ec1fe02="">
									<a href="javascript:kakaoLogin();">
										<img src="https://yaimg.yanolja.com/joy/sunny/static/images/img-login-kakao-52.svg" class="logo-social icon sprite-icons" data-v-4ec1fe02="" alt="카카오계정 로그인">
										</img> Kakao로 로그인
									</a> 
								</button>
								
								<button type="button" class="btn btn_login_naver full outline" data-v-3d1bcc82="" data-v-4ec1fe02="">
									<a id="naverIdLogin_loginButton" href="javascript:void(0)">
										<img src="https://yaimg.yanolja.com/joy/sunny/static/images/img-login-naver-52.svg" class="logo-social icon sprite-icons" data-v-4ec1fe02="">
										</img> Naver로 로그인 
									</a>
								</button>
								
							</div>
							
							<!-- 진욱님이랑 첫작업 카카오로그인버튼
							<div class="login_btn_box_kakao" data-v-4ec1fe02="">
								<a href="javascript:kakaoLogin();">
									<img src="../../../resources/_nuxt/img/kakaoLogin.png" alt="카카오계정 로그인" style=""/>
								</a>
							</div>
							-->
							
							<!--   애플로그인 크림에서 퍼온것
							<button type="button" class="btn btn_login_apple full outline" data-v-3d1bcc82="" data-v-4ec1fe02=""><svg xmlns="http://www.w3.org/2000/svg" class="logo-social icon sprite-icons" data-v-4ec1fe02=""><use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-logo-apple" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-logo-apple" data-v-4ec1fe02=""></use></svg> Apple로 로그인 </button>
							-->
							<ul class="look_box" data-v-4ec1fe02="">
								<li class="look_list" data-v-4ec1fe02="">
									<a href="/login1/join" class="look_link" data-v-4ec1fe02=""> 이메일 가입 </a>
								</li>
								<li class="look_list" data-v-4ec1fe02="">
									<a href="/login/find_email" class="look_link" data-v-4ec1fe02=""> 이메일 찾기 </a>
								</li>
								<li class="look_list" data-v-4ec1fe02="">
									<a href="/login/find_password" class="look_link" data-v-4ec1fe02=""> 비밀번호 찾기 </a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
<!------------------------------------- 공통 footer 영역  -------------------------------------------------->
				<div class="footer lg" data-v-1761bbf0="" data-v-3007c576="">
					<jsp:include page="../nav1/footer.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>					
				</div>	
<!-------------------------------------------------------------------------------------------------------->
			
			
			</div>
		</div>
	</div>	
</body>

<script>	

$(window).load(function() { 
	$('.login_btn_box').click(function(){
		ajax_login();								
	});
});

function ajax_login(){
	// 유효성 완료 회원가입
	var email = $('#email').val();
	var password = $('#password').val();
	// email, password  NULL 인 것 잡아야함.(22.08.11)
	
	$.LoadingOverlay("show");
	$.ajax({
        type : "POST",            // HTTP method type(GET, POST) 형식이다.
        url : "/login1/ajax_login",      // 컨트롤러에서 대기중인 URL 주소이다.
        data : 'join.email='+email+'&join.password='+password,            // Json 형식의 데이터이다.
        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
        	var master = $.parseJSON(res);  
        	if(master.join.user_count == 1){
        		alert('로그인이 정상 처리 되었습니다.');
         		window.location = '/1';
         	}else{
        		alert('아이디 비번을 확인 해 주세요');
        	} 
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        }
    });
		$.LoadingOverlay("hide");
}

</script>

<script>
	// 자바스크립트 key (황정훈)
    window.Kakao.init('29ba616a70c6390f183cd5c1f3194b9c');

    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_image,account_email,profile_nickname', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
            success: function(response) {
                console.log(response) // 로그인 성공하면 받아오는 데이터
                window.Kakao.API.request({ // 사용자 정보 가져오기 
                    url: '/v2/user/me',
                    success: (res) => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account);
                        //kakao_account.profile.profile_image_url <= 저장하고 싶은 이미지 주소
                        // kakao_account.email
                        checkKakaoLogin(kakao_account.email, kakao_account.profile.profile_image_url, kakao_account.profile.profile_nickname);                        
                    }
                });
                // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
            },
            fail: function(error) {
                console.log(error);
            }
        });
    }
    
    
    function checkKakaoLogin(email, profile_image_url, profile_nickname){
    	// 비회원 이면 강제 회원 가입
    	$.ajax({
            type : "POST",            // HTTP method type(GET, POST) 형식이다.
            url : "/login/ajax_checkKakaoLogin",      // 컨트롤러에서 대기중인 URL 주소이다.
            data : 'join.email='+email+'&join.image_url='+profile_image_url +'&join.nick_name='+profile_nickname,            // Json 형식의 데이터이다.
            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.            	
            	// 로그인 처리
            	$('#email').val(email);
                $('#password').val('');
            	ajax_login();
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });    	
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</script>

</html>