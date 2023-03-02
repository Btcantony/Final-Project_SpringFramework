<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<!------------ head 부분 따로 jsp파일로 빼놓은 부분 -------------->

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>

<!-------------------------------------------------------->

<!-- Login & Join CSS -->
<link href="/resources/_nuxt/css/0f788f7.css" rel="stylesheet" />

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
									<input id="email" type="text" placeholder="success@gmail.com" autocomplete="off" class="input_txt" data-v-0e527ea4="">									
								</div>
								<p class="input_error email" data-v-0e527ea4="" data-v-4ec1fe02="" style="color: red;">이메일 주소를 정확히 입력해주세요.</p>
							</div>
							<div class="input_box has_button" data-v-0e527ea4="" data-v-4ec1fe02="">
								<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">비밀번호</h3>
								<div class="input_item" data-v-0e527ea4="">
									<input id="password" type="password" placeholder="" autocomplete="off" class="input_txt" data-v-0e527ea4="">
								</div>
								<p class="input_error" data-v-0e527ea4="" data-v-4ec1fe02=""> 영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자) </p>
							</div>
							<div class="input_box has_button" data-v-0e527ea4="" data-v-4ec1fe02="">
								<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">비밀번호 확인</h3>
								<div class="input_item" data-v-0e527ea4="">
									<input id="passwordConfirm" type="password" placeholder="" autocomplete="off" class="input_txt" data-v-0e527ea4="">
								</div>
								<p class="input_error password" data-v-0e527ea4="" data-v-4ec1fe02="" style="color: red;"> 비밀번호가 일치하지 않습니다. </p>
							</div>
							
							<div class="input_box has_button" data-v-0e527ea4="" data-v-4ec1fe02="">
								<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">전화번호</h3>
								<div class="input_item" data-v-0e527ea4="">
									<input id="phone_num" type="text" placeholder="010-0000-0000" autocomplete="off" class="input_txt" data-v-0e527ea4="">
								</div>
								<p class="input_error phon_num" data-v-0e527ea4="" data-v-4ec1fe02="" style="color: red;"> 전화번호 형식과 일치하지 않습니다. </p>
							</div>
							
							
							
<!-- 		닉네임을 그냥 email의 @ 앞 부분만으로 자동으로 지정하고자 비활성					
							<div class="input_box has_button" data-v-0e527ea4="" data-v-4ec1fe02="">
								<h3 class="input_title" data-v-0e527ea4="" data-v-4ec1fe02="">닉네임</h3>
								<div class="input_item" data-v-0e527ea4="">
									<input id="nick_name" type="text" placeholder="정훈" autocomplete="off" class="input_txt" data-v-0e527ea4="">
								</div>
								<p class="input_error nick_name" data-v-0e527ea4="" data-v-4ec1fe02="" style="color: red;">  ..... </p>
							</div>
					
 -->							
							
							
							<div class="login_btn_box" data-v-4ec1fe02="">
								<a href="#" class="btn full solid" data-v-3d1bcc82="" data-v-4ec1fe02=""> 회원가입 </a>
							</div>
							
							
<!-- 	회원가입 진행중인 페이지에 이메일가입, 찾기 보이기 싫어서 뺌. 
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
 -->							
							
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
	
	// @랑 . 있는지 확인해서 경고문 띄울 지 말 지 여부
	$('#email').keyup(function(){
		if(!CheckEmail($('#email').val())){
			// 이메일 형식이 아님
			$('.input_error.email').show();
		}else{
			$('.input_error.email').hide();
		}
	});
	
	// 비밀번호와 비밀번호 확인이 같지않다면 경고문 띄우고 아니면 냅둠
	$('#passwordConfirm').keyup(function() {
		if(CheckPassword() == 1 ) {
			$('.input_error.password').show();
		} else {
			$('.input_error.password').hide();
		}
	});
	
	
	// 회원가입완료 버튼 누르는 동작에서부터 실행되는 비동기 통신
	$('.login_btn_box').click(function(){
		// 비동기 회원가입 유효성 체크
		if( $('.input_error.email').is(':visible') || $('.input_error.password').is(':visible') ){				
			return;
		}
		
		// 기존에 있는 유저인지 새 맴버인지 확인을 위해, 유저가 박스에 입력한 이메일과 비밀번호를 json타입으로 담아서 보낸다. db에 없는 인간이면 회원으로 insert 됨..
		var email = $('#email').val();
		var password = $('#password').val();
		var phone_num = $('#phone_num').val();
		var x = email.split("@");
		var nick_name = x[0];
		$.ajax({
               type : "POST",            // HTTP method type(GET, POST) 형식이다. 참고로, 회원가입을 했다면 db에 회원정보를 추가했고 그것을 페이지에서 반영하려면 POST방식이 맞다.
               url : "/login1/ajax_join",      // 컨트롤러에서 대기중인 URL 주소이다. 여기에 적는 url형식으로 송신.
               data : 'join.email='+email+'&join.password='+password+'&join.phone_num='+phone_num+'&join.nick_name='+nick_name,   // Json 형식의 데이터이다.
               success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.    
               	var master = $.parseJSON(res);  
            	if(master.join.user_count == 1){
              	   alert('가입된 계정입니다!');
            		} else {
            		$.LoadingOverlay("show");
        	  		alert('회원 가입이 정상 처리 되었습니다.');
        			$.LoadingOverlay("hide");
               		window.location = '/login1/log';
            		}
               },
               error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                   alert("통신 실패.")    // 나중에 이미 회원인 사람도 식별해서 회원가입을 했었다고 알려야됨 ******
               }
           });
	})
});
	
// 이메일 정규식  키보드 keyup일 때에 호출할 함수 미리 작성. 
function CheckEmail(str)
{                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            
          return false;         
     }                            
     else {                       
          return true;         
     }                            
}


// 비밀번호 일치여부 함수  얘 역시 비밀번호 확인란에 작성할 때마다(keyup) 확인하는 함수 미리 작성.
function CheckPassword() {
	var pw1 = $('#password').val();
	var pw2 = $('#passwordConfirm').val();
	
	if (pw1 !== pw2) {
		return 1
	} else {
		
	}
	
}
</script>

</html>