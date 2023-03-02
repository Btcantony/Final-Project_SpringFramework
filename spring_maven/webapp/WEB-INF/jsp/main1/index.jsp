<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="main.java.com.web.dto.MainSwiperImg"%>
<%@ page import="java.util.List"%>
<%@ page import="main.java.com.web.dto.Master"%>
<%@ page import="main.java.com.web.dto.MainCategory"%>
<%@ page import="main.java.com.web.dto.MainJust"%>
<%@ page import="main.java.com.web.dto.MainBestBrand"%>


<%
Master master = (Master) request.getAttribute("master");
int st_num = master.getMainJust().getSt_num();
int ed_num = master.getMainJust().getEd_num();
%>


<!DOCTYPE html>
<html lang="en">

<!------------ head 부분 따로 jsp파일로 빼놓은 부분 -------------->

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>

<!-------------------------------------------------------->

<!-- MAIN CSS -->
<style>
.swiper-slide .img {
	position: relative;
}

.banner .banner_img {
	max-height: 480px;
	width: 100%;
	object-fit: contain;
}



</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">

<!-- MAIN JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>



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
<!------------------------------------------------------------------------>				
 			

				<div class="container" data-v-1e7cdca6 data-v-3007c576>
					<div class="home lg" data-v-1e7cdca6>
						<div class="home_card_list" data-v-35198b53 data-v-1e7cdca6>

							<!---------------------   v   메인스와이퍼  영역--------------------->

							<div data-v-3d1a4f76 data-v-04d03524 data-v-35198b53 class="banner_slide slick-slider slick-initialized banner_slide_light">
								<div class="swiper">
									<div class="swiper-wrapper banner">
										<%
										// java 의 구간
										List<MainSwiperImg> listMainSwiperImg = master.getListMainSwiperImg();
										for (MainSwiperImg mainSwiperImg : listMainSwiperImg) {
											String url = mainSwiperImg.getUrl();
										%>

										<div class="swiper-slide">
											<div class="img">
												<img class="banner_img" src="<%=url%>" />
											</div>
										</div>

										<%
										}
										%>

							<!--------------------------   ^   메인스와이퍼  영역--------------------->


									</div>

									<!-- If we need pagination -->
									<div class="swiper-pagination"></div>

									<!-- If we need navigation buttons -->
									<div class="swiper-button-prev"></div>
									<div class="swiper-button-next"></div>

									<!-- If we need scrollbar -->
									<div class="swiper-scrollbar"></div>
								</div>
							</div>













							<!-- -----------------   v   메인카테고리컨테이너 영역----------------- -->

							<div class="shortcut_collection" data-v-6ecd6fa2="" data-v-35198b53="">
								<div class="shortcut_items_wrap" data-v-6ecd6fa2="">
									<div class="shortcut_items" data-v-6ecd6fa2="" style="font-size: 0">

										<%
										List<MainCategory> listMainCategory = master.getListMainCategory();
										for (MainCategory mainCategory : listMainCategory) {
											String url = mainCategory.getUrl();
											String name = mainCategory.getName();
											String category = mainCategory.getCategory();
										%>
										<div class="shortcut_item" data-v-2bfcd244="" data-v-6ecd6fa2="">
											<div class="shortcut_item_img_wrap" >
												<a href="/main1/category_detail?mainCategory.category=<%=category %>" style="display: block; height: 100px; width: 100%;">
 													<img src="<%=url%>" class="image" data-v-548c90f9="">
												</a>
											</div>
											<p class="shortcut_item_title" data-v-2bfcd244=""><%=name%></p>
										</div>
										<%
										}
										%>
									</div>
								</div>
							</div>


							<!-- -----------------   ^   메인카테고리컨테이너 영역----------------- -->
















<!-- 
							<div class="shortcut_item" data-v-2bfcd244="" data-v-6ecd6fa2="">
								<div class="shortcut_item_img_wrap" data-v-2bfcd244="">
									<picture class="picture shortcut_item_img_bg" style="background-color:#192436;" data-v-548c90f9="" data-v-2bfcd244="">
									<source type="image/webp" srcset="https://kream-phinf.pstatic.net/MjAyMjA3MDRfNDcg/MDAxNjU2OTEyMjM0MTI0.YTljSIa2hvYJ0vgolCLHRAYzGUjaVrqaJS0-GI41d3Ag.NaN4j7SUCo5tmPT2EnwpDxp5pCk1hCDjEC7a4C1bfOIg.JPEG/a_53a6bb7b4e0544babfe82632cf1ac093.jpg?type=m_webp" data-v-548c90f9="">
									<source srcset="https://kream-phinf.pstatic.net/MjAyMjA3MDRfNDcg/MDAxNjU2OTEyMjM0MTI0.YTljSIa2hvYJ0vgolCLHRAYzGUjaVrqaJS0-GI41d3Ag.NaN4j7SUCo5tmPT2EnwpDxp5pCk1hCDjEC7a4C1bfOIg.JPEG/a_53a6bb7b4e0544babfe82632cf1ac093.jpg?type=m" data-v-548c90f9="">
									<img src="https://kream-phinf.pstatic.net/MjAyMjA3MDRfNDcg/MDAxNjU2OTEyMjM0MTI0.YTljSIa2hvYJ0vgolCLHRAYzGUjaVrqaJS0-GI41d3Ag.NaN4j7SUCo5tmPT2EnwpDxp5pCk1hCDjEC7a4C1bfOIg.JPEG/a_53a6bb7b4e0544babfe82632cf1ac093.jpg?type=m" class="image" data-v-548c90f9=""></picture>
								</div>
								<p class="shortcut_item_title" data-v-2bfcd244="">NEW!</p>
							</div>

 -->



							<!-- -----------------   v   메인저스트  영역----------------- -->

							<div class="home_products" data-v-35198b53="">
								<div class="product_title lg" data-v-b71614ae="">
									<div class="title" data-v-b71614ae="">Just Dropped - NFT</div>
									<div class="sub_title" data-v-b71614ae="">Hot Items</div>
								</div>
								<div class="product_list_wrap lg" data-v-fb223474="">
									<div class="product_list list_first" data-v-fb223474="" style="font-size: 0">

										<%
										List<MainJust> listMainJust = master.getListMainJust();
										for (MainJust mainJust : listMainJust) {
											int seq = mainJust.getSeq();
											String brand = mainJust.getBrand();
											String name = mainJust.getName();
											int price = mainJust.getPrice();
											String url = mainJust.getUrl();
										%>

										<div class="product_item" data-v-7a7b0197="" data-v-fb223474="" style="">
											<div class="thumb_box" data-v-7a7b0197="">
												<a href="/main1/product_detail?mainJust.seq=<%=seq %>" class="item_inner" data-v-7a7b0197="">
													<div class="product" style="background-color:#ebf0f5;" data-v-75e33658="" data-v-7a7b0197="">
														<picture class="picture product_img" data-v-548c90f9="" data-v-75e33658="">															
															<img src="<%=url %>" class="image" data-v-548c90f9=""/>
														</picture>
													</div>
												</a>												
													
 		
											</div>
											<div class="info_box" data-v-7a7b0197="">
												<div class="brand" data-v-7a7b0197="">
													<p class="brand-text" data-v-7a7b0197="">
														<%=brand%>
													</p>
												</div>
												<p class="name" data-v-7a7b0197="">
													<%=name%>
												</p>
												<div class="price" data-v-7a7b0197="">
													<div class="amount lg" data-v-7a7b0197="">
														<em class="num" data-v-7a7b0197=""> <%=price%>
														</em> <span class="won lg" data-v-7a7b0197="">&nbsp;Coin</span>
													</div>
												</div>
											</div>
										</div>
										<%
										}
										%>
									</div>

									<!-- 아래 더보기 href="#" => href="javascript:" 변경 하여 TOP 가는 액션 방지-->
									<div class="btn_product" data-v-fb223474="">
										<a href="javascript:" class="btn outlinegrey medium" data-v-3d1bcc82="" data-v-fb223474=""> 더보기 </a>
									</div>


								</div>
							</div>



							<!-- -----------------   ^   메인저스트  영역----------------- -->



							<div class="shortcut_collection" data-v-6ecd6fa2="" data-v-35198b53="">
								<div class="product_title lg" data-v-b71614ae="" data-v-6ecd6fa2="">
									<div class="title" data-v-b71614ae="">Brand Focus</div>
									<div class="sub_title" data-v-b71614ae="">추천 브랜드</div>
								</div>
								
								<div class="shortcut_items_wrap" data-v-6ecd6fa2="">
									<div id="brands" class="shortcut_items" data-v-6ecd6fa2="" style="font-size: 0">
									
<!-- 										<div class="shortcut_item" data-v-2bfcd244="" data-v-6ecd6fa2="">
											<div class="shortcut_item_img_wrap" data-v-2bfcd244="">
												<picture class="picture shortcut_item_img_bg" style="background-color:#f4f4f4;" data-v-548c90f9="" data-v-2bfcd244="">
												<source type="image/webp" srcset="https://kream-phinf.pstatic.net/MjAyMjA3MTVfMTU2/MDAxNjU3ODczNDA3NzU2.38xSKiJ3LWONaUhqGFkqFeaiddKtA0s_ra4GSCtVibQg.6iAl1__6vcHdLf-QdP2QdhxXKaNL2jfkpDUPmV2iNvkg.JPEG/a_85be6d7f4823462a94d543938cf19040.jpg?type=m_webp" data-v-548c90f9="">
												<source srcset="https://kream-phinf.pstatic.net/MjAyMjA3MTVfMTU2/MDAxNjU3ODczNDA3NzU2.38xSKiJ3LWONaUhqGFkqFeaiddKtA0s_ra4GSCtVibQg.6iAl1__6vcHdLf-QdP2QdhxXKaNL2jfkpDUPmV2iNvkg.JPEG/a_85be6d7f4823462a94d543938cf19040.jpg?type=m" data-v-548c90f9="">
												<img src="https://kream-phinf.pstatic.net/MjAyMjA3MTVfMTU2/MDAxNjU3ODczNDA3NzU2.38xSKiJ3LWONaUhqGFkqFeaiddKtA0s_ra4GSCtVibQg.6iAl1__6vcHdLf-QdP2QdhxXKaNL2jfkpDUPmV2iNvkg.JPEG/a_85be6d7f4823462a94d543938cf19040.jpg?type=m" class="image" data-v-548c90f9=""></picture>
											</div>
											<p class="shortcut_item_title" data-v-2bfcd244="">샤넬</p>
										</div>
 -->										
									</div>
								</div>
								
							</div>
							<br>
							<br>
							<br>
							<br>
							<br>
<%-- 							<!-- -----------------   v   메인카테고리컨테이너 영역----------------- -->
							<div class="product_title lg" data-v-b71614ae="">
								<div class="title" data-v-b71614ae="">Category Test</div>
								<div class="sub_title" data-v-b71614ae="">Hot Items</div>
							</div>
							
							<div class="shortcut_collection" data-v-6ecd6fa2="" data-v-35198b53="">
								<div class="shortcut_items_wrap" data-v-6ecd6fa2="">
									<div class="shortcut_items" data-v-6ecd6fa2="" style="font-size: 0">

										<%
										List<MainCategory> xyz = master.getListMainCategory();
										for (MainCategory mainCategory : xyz) {
											String url = mainCategory.getUrl();
											String name = mainCategory.getName();
										%>
										<div class="shortcut_item" data-v-2bfcd244="" data-v-6ecd6fa2="">
											<div class="shortcut_item_img_wrap" data-v-2bfcd244="">
												<img src="<%=url%>" class="image" data-v-548c90f9="">
											</div>
											<p class="shortcut_item_title" data-v-2bfcd244=""><%=name%></p>
										</div>
										<%
										}
										%>
									</div>
								</div>
							</div>


							<!-- -----------------   ^   메인카테고리컨테이너 영역----------------- --> --%>
							
							
							
							
							
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
// 페이징 처리(서버에서 넘겨주는 페이징 처리 정보)
// st_num 검색 시작되는 번호
// ed_num 검색 시작되는 번호에서 부터 몇개 개수, 변수명이 좀 잘못된것 같음(paging_count 가 맞을듯 Pass)
var st_num = <%=st_num%>;
var ed_num = <%=ed_num%>;

$(window).load(function() { 	
	// Swiper 초기화
	init_swiper();
	
	// 더보기 클릭이벤트 구현
	init_add_just();
	
	// 추천 브랜드 비동기 처리
	init_ajax_brand();
	
	// 자동으로 스와이퍼 작동
	setInterval();
	
});

function init_swiper(){
	const swiper = new Swiper('.swiper', {
		// Optional parameters
		direction : 'horizontal',
		loop : true,			
		// If we need pagination
		pagination : {
			el : '.swiper-pagination',
		},

		// Navigation arrows
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},

		// And if we need scrollbar
		scrollbar : {
			el : '.swiper-scrollbar',
		},
	}); 
}


function init_add_just(){
	$('.btn_product').click(function(){	
		// 클릭할때 마다 전역변수인 st_num을 4개씩 증가 시키면 될것 같음
		// 그리고 아래 data 부분에서 파라미터로 서버에 전달 하면 끝
		st_num += 4;
        $.ajax({
            type : "GET",            // HTTP method type(GET, POST) 형식이다.
            url : "/main1/ajax_just",      // 컨트롤러에서 대기중인 URL 주소이다.
            data : 'mainJust.st_num='+st_num,            // Json 형식의 데이터이다.
            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
            	var master = $.parseJSON(res);
            	var listMainJust = master.listMainJust;
            	var str = '';
            	for (var i = 0; i < listMainJust.length; i++) {
            		var ob = listMainJust[i];
            		var brand = ob.brand;              			
            		var name = ob.name;
            		var price = ob.price;               			
            		var url = ob.url;
            		var seq = ob.seq;
            		
            		str+='<div class="product_item" data-v-7a7b0197="" data-v-fb223474="" style="">';
            		str+='	<div class="thumb_box" data-v-7a7b0197="">';
            		str+='		<a href="/main1/product_detail?mainJust.seq='+seq+'"  data-v-7a7b0197="">';
            		str+='			<div class="product" style="background-color:#ebf0f5;" data-v-75e33658="" data-v-7a7b0197="">';
            		str+='				<picture class="picture product_img" data-v-548c90f9="" data-v-75e33658="">';															
            		str+='					<img src="'+url+'" class="image" data-v-548c90f9=""/>';
            		str+='				</picture>';
            		str+='			</div>';
            		str+='		</a>';												
            		str+='	</div>';
            		str+='	<div class="info_box" data-v-7a7b0197="">';
            		str+='		<div class="brand" data-v-7a7b0197="">';
            		str+='			<p class="brand-text" data-v-7a7b0197=""> '+brand+' </p>';
            		str+='		</div>';
            		str+='		<p class="name" data-v-7a7b0197="">';
            		str+='			'+name;
            		str+='		</p>';
            		str+='		<div class="price" data-v-7a7b0197="">';
            		str+='			<div class="amount lg" data-v-7a7b0197="">';
            		str+='				<em class="num" data-v-7a7b0197=""> '+price+' </em>';
            		str+='				<span class="won lg" data-v-7a7b0197="">&nbsp; Coin</span>';
            		str+='			</div>';													
            		str+='		</div>';
            		str+='	</div>';
            		str+='</div>';					
				}
            	
            	$('.product_list.list_first').append(str);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	});
}


function init_ajax_brand(){
	$.ajax({
        type : "GET",            
        url : "/main1/init_ajax_brand",
        data : '',
        success : function(res){
        	var master = $.parseJSON(res);
        	var listMainBestBrand = master.listMainBestBrand;
        	var str = '';
        	for (var i = 0; i < listMainBestBrand.length; i++) {
        		var ob = listMainBestBrand[i];
        		var brand = ob.name;
        		var url = ob.url;
        		
        		str+='<div class="shortcut_item" data-v-2bfcd244="" data-v-6ecd6fa2="">';
        		str+='	<div class="shortcut_item_img_wrap" data-v-2bfcd244="">';
        		str+='		<picture class="picture shortcut_item_img_bg" style="background-color:#f4f4f4;" data-v-548c90f9="" data-v-2bfcd244="">';												
        		str+='			<img src="'+url+'" class="image" data-v-548c90f9="">';
        		str+='		 </picture>';
        		str+='	</div>';
        		str+='	<p class="shortcut_item_title" data-v-2bfcd244="">'+brand+'</p>';        		
        		str+='</div>';			
        	}
        	$('#brands').html(str);
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        }
    });
}

function sliderClick(){
	$('.swiper-button-next').click()
}

setInterval(function() { 
  sliderClick(); 
}, 2000);


</script>
</html>
