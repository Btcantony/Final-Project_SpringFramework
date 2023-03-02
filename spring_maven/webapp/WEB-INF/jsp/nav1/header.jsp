<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="header_top" style="display:;" data-v-5875f283="">
	<div class="top_inner" data-v-5875f283="">
		<ul class="top_list" data-v-5875f283="">
		
			<li class="top_item" data-v-5875f283="">
				<a id="welcome_a" href="" class="top_link" data-v-5875f283=""> </a>
			</li>
			
<!-- 		<li class="top_item" data-v-5875f283="">
				<a id="welcome_b" href="" class="top_link" data-v-5875f283=""> </a>
			</li>
 -->		
			<li class="top_item" data-v-5875f283="">
				<a href="/main1/notice" class="top_link" data-v-5875f283=""> 1:1 문의 게시판 </a>
			</li>
			<li class="top_item" data-v-5875f283="">
				<a href="/login1/mywish" class="top_link" data-v-5875f283=""> 관심상품 </a>
			</li>
			<li class="top_item" data-v-5875f283="">
				<a href="/login1/myprofile" class="top_link" data-v-5875f283=""> 마이페이지 </a>
			</li>
			<li id="btn_login" class="top_item" data-v-5875f283="">
				<a href="/login1/log" class="top_link" data-v-5875f283=""> 로그인 </a>
			</li>
			<li id="btn_logout" class="top_item" data-v-5875f283="" style="display: none;">
				<a href="/login1/logout" class="top_link" data-v-5875f283=""> 로그아웃 </a>
			</li>
		</ul>
	</div>
</div>
<div class="header_main" data-v-5875f283="">
	<div class="main_inner" data-v-5875f283="">
		<h1 data-v-5875f283="">
			<a href="/1" aria-label="홈" class="logo" data-v-5875f283="">
<!--   				<img alt="" src="/resources/_nuxt/img/Youtube.png" id="hwangLogo">
 -->  				<img alt="" src="/resources/_nuxt/img/opensea.png" id="hwangLogo">
  				
			</a>
			<style>
				#hwangLogo {
					width: 180px;
					height: 44px;
					}
			</style>			
		</h1>
		<div class="gnb_area" data-v-5875f283="">
			<nav class="gnb" data-v-5875f283="">
				<ul class="gnb_list" data-v-5875f283="">
					<li class="gnb_item" data-v-5875f283="">
						<a href="/social/trending" class="gnb_link" data-v-5875f283=""> STYLE </a>
					</li>
					<li class="gnb_item" data-v-5875f283="">
						<a href="#" class="gnb_link" data-v-5875f283=""> SHOP </a>
					</li>
					<li class="gnb_item" data-v-5875f283="">
						<a href="/about" target="_blank" class="gnb_link" data-v-5875f283=""> ABOUT </a>
					</li>
				</ul>
			</nav>
			
			<!-- 돋보기 -->
			<div class="search_btn_box" data-v-5875f283>
				<a aria-label="검색" href="/main1/search_product" class="btn_search" data-v-5875f283>
					<img src="/resources/_nuxt/img/org.png" class="nav-search icon sprite-icons" data-v-5875f283>
<!-- 						<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-nav-search" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-nav-search" data-v-5875f283>
						</use>
 -->					</img>
				</a>
			</div>
			
			
		</div>
	</div>
</div>
<script>
$(window).load(function() { 
	$.ajax({
        type : "POST",            // HTTP method type(GET, POST) 형식이다.
        url : "/login1/ajax_isLogin",      // 컨트롤러에서 대기중인 URL 주소이다.
        data : '',            // Json 형식의 데이터이다.
        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
        	var master = $.parseJSON(res);
        	var email = master.join.email;
        	var nick_name = master.join.nick_name;
        	
        	if(master.join == undefined){
        		$('#btn_login').show();
        		$('#btn_my').hide();
        		$('#btn_wish').hide();        		
        	}else{
        		$('#btn_login').hide();
        		$('#btn_logout').show();   
        		$('#div_regist_notice').show();
        		$('#btn_my').show();
        		$('#btn_wish').show(); 
				$('#welcome_a').html(email+ '&nbsp 님 안녕하세요.');
/* 				$('#welcome_b').html(String(name) + '&nbsp 님 안녕하세요.');
 */        	}
        	
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        }
    });
});

$('#btn_logout').click(function(){
	alert('로그아웃 되셨습니다!');
});

</script>
