<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>
<link href="/resources/_nuxt/css/979f3ae.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/734fa9a.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/b3c2f22.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/d3a96a9.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/ed926a7.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/efe06bc.css" rel="stylesheet" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<!-- <script src="/resources/_nuxt/js/common.js"></script>
 -->
<!-- MAIN CSS -->
<style>
.swiper-container {
	padding:30px 0;
	border:3px solid silver;
	border-radius:7px;
	box-shadow:0 0 20px #ccc inset;
	width: 530px;
	height: 500px;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	box-shadow:0 0 3px #555;
	width: 100%;
}

.banner_alert_content {
width: 530px;
}

.column_box{
	width:530px;
}


/* max 너비가 1200일때~ */
@media (max-width: 1150px) {
  .column.is_fixed {
    width: 100%;
  }
  
  .column[data-v-44d29853]:first-child {
  	padding: 0;
  }
  
  .column_box {
  	width: 100%;
  }
  
  .column[data-v-44d29853]:nth-child(2) {
  	float: none;
  	width: auto;
  	margin-right: 20px;
  }
  
  .banner_alert[data-v-32b7052e] {
  	margin-bottom: 20px;
  	margin-right: 25px;
  	margin-left: 25px;
  	
  	
  }
  
  .content[data-v-44d29853] {
  	padding: 0;
  }
}



</style>
<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>
				
				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<jsp:include page="../nav1/header.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>				
				</div>
				
				<div class="container detail lg" data-v-44d29853="" data-v-3007c576="">
					<div class="content" data-v-44d29853="">
						<h2 class="blind" data-v-44d29853="">상품 상세</h2>
						<div class="column_bind" data-v-44d29853="">
							<div class="column is_fixed" data-v-44d29853="">
								<div class="spread" data-v-44d29853=""></div>
								<div class="column_box" data-v-44d29853="">
									<div class="detail_banner_area lg" data-v-505b03f6="" data-v-44d29853="" style="width:100%">
										<!-- 클래스명은 변경하면 안 됨 -->
										<div class="swiper-container">
											<div class="swiper-wrapper">
				
											</div>
										
											<!-- 네비게이션 -->
											<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
											<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
										
											<!-- 페이징 -->
											<div class="swiper-pagination"></div>
										</div>																				
									</div>
									<div class="banner_alert lg" data-v-32b7052e="" data-v-44d29853="">
										<a href="https://kream.co.kr/api/app/pages/0401_notice.html" class="alert_wrap" data-v-32b7052e="">
											<div class="banner_alert_content" data-v-32b7052e="">
												<p class="alert_title" data-v-32b7052e="">
													<span class="care_mark" data-v-32b7052e="">주의</span>
													<span class="alert_text" data-v-32b7052e="">판매 거래 주의사항</span>
												</p>
												<p class="alert_subtext" data-v-32b7052e="">반드시 보유한 상품만 판매하세요.</p>
											</div>
											<div class="ico_arrow" style="display:;" data-v-32b7052e="">
												<svg xmlns="http://www.w3.org/2000/svg" class="ico-arr-type icon sprite-icons" data-v-32b7052e="">
													<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-arr-type" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-arr-type" data-v-32b7052e=""></use>
												</svg>
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="column" data-v-44d29853="">
								<div class="column_box" data-v-5622d1e8="" data-v-44d29853="">
									<div class="column_top" data-v-5622d1e8="">
										<div class="detail_main_title lg" data-v-22fed681="" data-v-5622d1e8="">
											<div class="main_title_box" data-v-22fed681="">
												<a href="#" class="brand" data-v-22fed681="">  </a>
												<p class="title" id="title" data-v-22fed681=""></p>
												<p class="sub_title" data-v-22fed681=""></p>
											</div>
										</div>
										<div class="product_figure_wrap lg" data-v-5622d1e8="">
											<div class="detail_price" data-v-5943a237="" data-v-5622d1e8="">
												<div class="title" data-v-5943a237="">
													<span class="title_txt" data-v-5943a237="">Coin 거래가</span>
												</div>
												<div class="price" data-v-5943a237="">
													<div class="amount" data-v-5943a237="">
														<span id="price_recent" class="num" data-v-5943a237=""></span>
														<span class="won" data-v-5943a237="">&nbsp Coin</span>
													</div>
												</div>
											</div>
										</div>
										<div class="btn_wrap" data-v-5622d1e8="">
											<div class="division_btn_box lg" data-v-23bbaa82="" data-v-5622d1e8="">
												<a href="javascript:window.location='/main1/buy'" class="btn_division buy" data-v-23bbaa82="">
													<strong class="title" data-v-23bbaa82="">구매</strong>
													<div class="price" data-v-23bbaa82="">
														<span class="amount" data-v-23bbaa82="">
															<em id="price_buy" class="num" data-v-23bbaa82=""></em>
															<span class="won" data-v-23bbaa82="">원</span>
														</span>
														<span class="desc" data-v-23bbaa82="">즉시 구매가</span>
													</div>
												</a>
												<a href="#" class="btn_division sell" data-v-23bbaa82="">
													<strong class="title" data-v-23bbaa82="">판매</strong>
													<div class="price" data-v-23bbaa82="">
														<span class="amount" data-v-23bbaa82="">
															<em id="price_sale" class="num" data-v-23bbaa82=""></em>
															<span class="won" data-v-23bbaa82="">원</span>
														</span>
														<span class="desc" data-v-23bbaa82="">즉시 판매가</span>
													</div>
												</a>
											</div>
											<a id="aSave" href="javascript:save_cookie();" aria-label="관심상품" class="btn full outlinegrey large btn_wish" data-v-3d1bcc82="" data-v-2d0ab5c1="" data-v-5622d1e8="">												
												<span class="btn_text" data-v-2d0ab5c1="">관심상품 등록</span>												
											</a>
										</div>
									</div>
									<div class="product_info_wrap" data-v-5622d1e8="">
										<h3 class="detail_title info_title lg" data-v-52dd777b="" data-v-5622d1e8=""> 상품 정보 </h3>
										<div class="detail_product_wrap" data-v-b809b0a6="" data-v-5622d1e8="">
											<dl class="detail_product" data-v-b809b0a6="">
												<div class="detail_box model_num" data-v-b809b0a6="">
													<dt class="product_title" data-v-b809b0a6=""> 모델번호 </dt>
													<dd id="model_number" class="product_info" data-v-b809b0a6=""> DV0426-301 </dd>
												</div>
												<div class="detail_box" data-v-b809b0a6="">
													<dt class="product_title" data-v-b809b0a6=""> 출시일 </dt>
													<dd id="date" class="product_info" data-v-b809b0a6=""> 22/08/14 </dd>
												</div>
												<div class="detail_box" data-v-b809b0a6="">
													<dt class="product_title" data-v-b809b0a6=""> 컬러 </dt>
													<dd id="color" class="product_info" data-v-b809b0a6=""> LIGHT OLIVE/SAIL-WHITE </dd>
												</div>
												<div class="detail_box" data-v-b809b0a6="">
													<dt class="product_title" data-v-b809b0a6=""> 발매가 </dt>
													<dd id="price_public" class="product_info" data-v-b809b0a6=""> 139,000원 </dd>
												</div>
											</dl>
											
											<h3 class="detail_title info_title lg" data-v-52dd777b="" data-v-5622d1e8=""> NFT Shop </h3>
											<div id="map" style="width:100%;height:350px;"></div>
											
										</div>
									</div>
								</div>	
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
	var seq = <%=request.getAttribute("seq")%>;  
	$(window).load(function() {	
		var str = '';	
		$.ajax({
            type : "POST",
            url : "/main1/ajax_product_detail", 
            data : 'mainJust.seq='+seq,
            success : function(res){
            	var master = $.parseJSON(res);
            	var mainJust = master.mainJust;
            	
            	// 상품 상세 바인딩
            	var seq = mainJust.seq; //: 824
            	var brand = mainJust.brand; //: "Maxim"
            	var color = mainJust.color; //: "BLACK"
            	var date = mainJust.date; //: "2022-08-18"            	
            	var model_number = mainJust.model_number; //: "DO5304-010"
           		var name = mainJust.name; //: "A"
           		var name_kor = mainJust.name_kor; //: "나이키 x 스투시 NRG FL 스톰핏 자켓 블랙 (DO5304-010)"
           		var price = mainJust.price; //: 1
           		var price_public = mainJust.price_public; //: 2000
           		var price_recent = mainJust.price; //: 49 Coin
           		var price_sale = mainJust.price_sale; //: 1100           		           		
           		var url = mainJust.url; //: "ht
           		
           		$('.brand').text(brand);
           		$('#title').text(name);
           		$('.sub_title').text(name_kor);
           		$('#price_recent').text(price_recent);
           		$('#price_buy').text(price_sale);
           		$('#price_sale').text(price_sale.toLocaleString('ko-KR'));
           		$('#model_number').text(model_number);
           		$('#date').text(date);
           		$('#color').text(color);
           		$('#price_public').text(price_public.toLocaleString('ko-KR'));
           		
           		// 상품 이미지 바인딩            		
           		var listProductImgs = master.listProductImgs;
           		for (var i = 0; i < listProductImgs.length; i++) {
           			var ob = listProductImgs[i];
           			var date = ob.date; //: "2022-08-18"
           			var img_url = ob.img_url; //: "https://kream-phinf.pstatic.net/MjAyMjA4MDVfNTcg/MDAxNjU5NjY1MzcwNTI5.PsSkRJi0vLEiWvd8DOjuCIvsFzf9onIKkQNzpgDRT0Ig.wl2oSo4Kv4IuzrzZ1T0o9JrmRVmZFx-_1es6kEZ3j0Ig.JPEG/a_76ebb1d6af9f4d8b889d1728c5819c4d.jpg?type=m"
           			var seq = ob.seq; //: 5
           			var sub_seq = ob.sub_seq; //: 824
           			var type = ob.type; //: "just"
           			           				    
					str+='<div class="swiper-slide"><img src="'+img_url+'"></div>';									  	
				}
           		$('.swiper-wrapper').html(str);
           		
           		new Swiper('.swiper-container', {

           			// 자동높이 사용여부 : 사용하지 않을시 기본값은 false
           			autoHeight : false,

           			loop : false, // 슬라이드 반복
           			pagination : { // 페이징
           				el : '.swiper-pagination',
           				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
           			},
           			navigation : { // 네비게이션
           				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
           				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
           			},
           		}); 
           		
           		initCookie();
           		
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });	
	});
	
	function save_cookie(){
		// 상품정보를 쿠키에 담는다
		var product = new Product();
		product.seq = seq;
		product.brand = $('.brand').text();
		product.sub_title = $('.sub_title').text();
		product.model_number = $('#model_number').text();
		product.src = $('.swiper-slide').eq(0).find('img').attr('src');
		product.price_recent = $('#price_recent').text();
				
		var strLikeProducts = getCookie('likeProducts');
		if(strLikeProducts == ''){ // 최초 관심상품 담을때
			var arr = [];
			arr.push(product);
			var strs = JSON.stringify(arr);			
			setCookie('likeProducts',strs,365);	
		}else{
			var arr = $.parseJSON(strLikeProducts);	
			arr.push(product);
			var strs = JSON.stringify(arr);
			setCookie('likeProducts',strs,365);
			$.LoadingOverlay("show");
			$('#aSave').hide();
			alert('관심 상품 등록이 완료되었습니다.');
			$.LoadingOverlay("hide");
		}		
	}
	
	function initCookie(){
		var strLikeProducts = getCookie('likeProducts');
		if(strLikeProducts == ''){ // 최초 관심상품 담을때
				
		}else{
			var likeProducts = $.parseJSON(strLikeProducts);	
			for (var i = 0; i < likeProducts.length; i++) {
				var product = likeProducts[i];
				var _seq = product.seq;			
							
				if(_seq == seq){
					$('#aSave').hide();
				}
			}
		}
	}	
	
	
</script>

<!--  지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61176f9a329fb8506ea9b74103e11b1f&libraries=services,clusterer,drawing"></script>

<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.497, 127.0254), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('강남pc방', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
</html>