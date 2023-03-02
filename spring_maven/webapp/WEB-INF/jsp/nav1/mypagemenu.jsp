<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

					<div data-v-3d7f7af7="">
						<div data-v-3d7f7af7="" class="snb_area">
							<a data-v-3d7f7af7="" href="" class="nuxt-link-active"><h2 data-v-3d7f7af7="" class="snb_main_title">마이 페이지</h2></a>
							<nav data-v-7bcac446="" data-v-3d7f7af7="" class="snb">
								
								<div data-v-7bcac446="" class="snb_list">
									<strong data-v-7bcac446="" class="snb_title">내 정보</strong>
									<ul data-v-4d11470e="" data-v-7bcac446="" class="snb_menu" id="mymenu1">
										
										<li data-v-4d11470e="" class="menu_item" id="my1">
											<a data-v-4d11470e="" href="/login1/myprofile" class="menu_link"> 프로필 정보 </a>
										</li>
										
										<li data-v-4d11470e="" class="menu_item" id="my2">
											<a data-v-4d11470e="" href="/login1/myaddress" class="menu_link"> 주소록 </a>
										</li>
										
										<li data-v-4d11470e="" class="menu_item" id="my3">
											<a data-v-4d11470e="" href="/login1/mypayment" class="menu_link"> 결제 정보 </a>
										</li>
										
										<li data-v-4d11470e="" class="menu_item" id="my4">
											<a data-v-4d11470e="" href="/login1/mypoint" aria-current="page" class="menu_link nuxt-link-exact-active nuxt-link-active"> 포인트 </a>
										</li>
									
									</ul>
								</div>
								
								<div data-v-7bcac446="" class="snb_list">
									<strong data-v-7bcac446="" class="snb_title">쇼핑 정보</strong>
									<ul data-v-4d11470e="" data-v-7bcac446="" class="snb_menu" id="mymenu2">
										<li data-v-4d11470e="" class="menu_item" id="my5">
											<a data-v-4d11470e="" href="/login1/myorderlist" class="menu_link"> 구매 내역 </a>
										</li>
										<li data-v-4d11470e="" class="menu_item" id="my6">
											<a data-v-4d11470e="" href="/login1/mywish" class="menu_link"> 관심 상품 </a>
										</li>
									</ul>
								</div>
								
								
							
							</nav>
						</div>
					</div>
					
					
<script>

$(window).load(function() { 
/* 	// 탭클릭시 현재 탭만 하이라이트 
 	$('.snb_menu .menu_item').click(function(){
 		// CSS 처리
  		$('.snb_menu .menu_item').removeClass('menu_on');
  		$(this).addClass('menu_on');
 	});
 */	
 
 /* 다시.. */
	var myPages = new Array;
	 myPages[0] = "myprofile";
	 myPages[1] = "myaddress";
	 myPages[2] = "mypayment";
	 myPages[3] = "mypoint";
	 myPages[4] = "myorderlist";
	 myPages[5] = "mywish";

	var url = location.href;
	
	for(var i = 0; i < 6; i++) {
		
		if (url.indexOf(myPages[i]) != -1) {
	  		$('.menu_item').removeClass('menu_on');
	  		$('.menu_item').eq(i).addClass('menu_on');
		};
	}
 
});

</script>	
