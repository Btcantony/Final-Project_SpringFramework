<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>
<link href="/resources/_nuxt/css/fc8ba0e.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/56b625e.css" rel="stylesheet" />
<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>
				
				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<jsp:include page="../nav1/header.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>				
				</div>


				<div class="container my md" data-v-3d7f7af7="">
					
					<jsp:include page="../nav1/mypagemenu.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>				
					

					
					<div data-v-3d7f7af7="" class="content_area">
						<div class="my_interest">
							<div data-v-88eb18f6="" class="content_title border">
								<div data-v-88eb18f6="" class="title">
									<h3 data-v-88eb18f6="">관심 상품</h3>
									<!---->
								</div>
								<!---->
							</div>
							<ul data-v-4ebc1bae="" class="wish_list">
							
								<li data-v-4ebc1bae="">
									<div data-v-4ebc1bae="" class="wish_item">
										<div data-v-4ebc1bae="" class="wish_product">
											<div data-v-4ebc1bae="" class="product_box">
												<div data-v-75e33658="" data-v-4ebc1bae="" class="product" style="background-color: rgb(244, 244, 244);">
													<picture data-v-548c90f9="" data-v-75e33658="" class="picture product_img">
														<img data-v-548c90f9="" alt="" src="이미지링크" class="image">
													</picture>
												</div>
											</div>
											<div data-v-4ebc1bae="" class="product_detail">
												<a data-v-4ebc1bae="" href="#" class="brand-text"> 브랜드명 </a>
												<p data-v-4ebc1bae="" class="name">제품명</p>
												<span data-v-4ebc1bae="" class="size">모델번호</span>
											</div>
										</div>
										<div data-v-4ebc1bae="" class="wish_buy">
											<div data-v-4ebc1bae="">
												<div data-v-23bbaa82="" data-v-4ebc1bae="" class="division_btn_box md">
													<a data-v-23bbaa82="" href="#" class="btn_division buy"><strong data-v-23bbaa82="" class="title">구매</strong>
													<div data-v-23bbaa82="" class="price">
															<span data-v-23bbaa82="" class="amount"><em data-v-23bbaa82="" class="num">163,000</em><span data-v-23bbaa82="" class="won">원</span></span><span data-v-23bbaa82="" class="desc">즉시 구매가</span>
														</div></a>
												</div>
												<a data-v-4ebc1bae="" href="#" class="status_link">삭제</a>
											</div>
										</div>
									</div>
								</li>
							
							
							</ul>
							<br>
							<br>
							<br>
							<div data-v-4ec1fe02="" class="login_btn_box"><a data-v-3d1bcc82="" data-v-4ec1fe02="" href="javascript:buy()" class="btn full solid"> 일괄구매 </a></div>							
							
							
							
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
</body>

<script>	

$(window).load(function() { 
/* 	makeBoldClick();	
 */	
	var strLikeProducts = getCookie('likeProducts');
	var str = '';
	if(strLikeProducts != ''){
		var likeProducts = $.parseJSON(getCookie('likeProducts'));	
		for (var i = 0; i < likeProducts.length; i++) {
			var product = likeProducts[i];
			var seq = product.seq;
			var brand = product.brand;
			var sub_title = product.sub_title;
			var model_number = product.model_number;
			var src = product.src;
			var price_recent = product.price_recent;
			
			
			str+='<li data-v-4ebc1bae="">';
			str+='<div data-v-4ebc1bae="" class="wish_item">';
			str+='	<div data-v-4ebc1bae="" class="wish_product">';
			str+='		<div data-v-4ebc1bae="" class="product_box">';
			str+='			<div data-v-75e33658="" data-v-4ebc1bae="" class="product" style="background-color: rgb(244, 244, 244);">';
			str+='				<picture data-v-548c90f9="" data-v-75e33658="" class="picture product_img">';
			str+='					<img data-v-548c90f9="" alt="" src="'+src+'" class="image">';
			str+='				</picture>';
			str+='			</div>';
			str+='		</div>';
			str+='		<div data-v-4ebc1bae="" class="product_detail">';
			str+='			<a data-v-4ebc1bae="" href="#" class="brand-text"> '+brand+' </a>';
			str+='			<p data-v-4ebc1bae="" class="name">'+sub_title+'</p>';
			str+='			<span data-v-4ebc1bae="" class="size">'+model_number+'</span>';
			str+='		</div>';
			str+='	</div>';
			str+='	<div data-v-4ebc1bae="" class="wish_buy">';
			str+='		<div data-v-4ebc1bae="">';
			str+='			<div data-v-23bbaa82="" data-v-4ebc1bae="" class="division_btn_box md">';
			str+='				<a data-v-23bbaa82="" href="#" class="btn_division buy"><strong data-v-23bbaa82="" class="title">구매</strong>';
			str+='				<div data-v-23bbaa82="" class="price">';
			str+='						<span data-v-23bbaa82="" class="amount"><em data-v-23bbaa82="" class="num">'+price_recent+'</em><span data-v-23bbaa82="" class="won">원</span></span><span data-v-23bbaa82="" class="desc">즉시 구매가</span>';
			str+='					</div></a>';
			str+='			</div>';
			str+='			<a data-v-4ebc1bae="" href="javascript:delCookie('+seq+');" class="status_link">삭제</a>';
			str+='		</div>';
			str+='	</div>';
			str+='</div>';
			str+='</li>';				
			
			
			
			
			
			
			
		}
		$('.wish_list').html(str);
	}
							
});

function delCookie(_seq){
	var strLikeProducts = getCookie('likeProducts');
	var likeProducts = $.parseJSON(strLikeProducts);
	var arr = [];
	for (var i = 0; i < likeProducts.length; i++) {
		var product = likeProducts[i];
		var seq = product.seq;			
					
		if(_seq != seq) arr.push(product);
	}
	var strs = JSON.stringify(arr);		
	setCookie('likeProducts',strs,365);	
	
	location.reload();
}

function buy(){
	// 구매 할 물품 담기		
	window.location = '/login1/mybuy';
}
	
/* function makeBoldClick(){
	makeBold();
	}

function makeBold(){
$('#my6').addClass('menu_on');
$('#my2').removeClass('menu_on');
$('#my1').removeClass('menu_on');
$('#my4').removeClass('menu_on');
$('#my3').removeClass('menu_on');
$('#my5').removeClass('menu_on');
}	
 */
</script>
</html>