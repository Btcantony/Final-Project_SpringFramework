<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>


<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>
				
				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<jsp:include page="../nav1/header.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>				
				</div>







				<div data-fetch-key="data-v-09679932:0" class="container search lg" data-v-09679932="" data-v-3007c576="">
					<div class="search_top" data-v-09679932="">
						<div class="top_box" data-v-09679932="">
							<div style="display:;" data-v-09679932="">
								<div class="search_title has_input" data-v-1e362e12="" data-v-09679932="">
									<div value="" class="search_area" data-v-63326639="" data-v-1e362e12="">
									
										<div class="search" data-v-63326639="">
											<input id="searchBox" type="text" placeholder="브랜드명, 모델명, 모델번호 등" title="검색창" value="" class="input_search show_placeholder_on_focus" data-v-63326639="">
										</div>
										
																			
									</div>
								</div>
							</div>

						</div>
					</div>
					
					
					<div class="content" data-v-09679932="">
						<div selected-choices="[object Object]" class="search_filter" data-v-75a99100="" data-v-09679932="">
							<div count="0" class="filter_status" data-v-9c60e4ec="" data-v-75a99100="">
								<div class="status_box" data-v-9c60e4ec="">
									<span class="status_txt" data-v-9c60e4ec="">필터</span>
								</div>
							</div>
							<div class="filter_list" data-v-5b8abf19="" data-v-75a99100="">
								<div class="filter_title" data-v-5b8abf19="">
									<div class="title_box" data-v-5b8abf19="">
										<span class="main_title" data-v-5b8abf19="">카테고리</span><span class="placeholder" data-v-5b8abf19="">모든 카테고리</span>
									</div>
									<div class="ico_box" data-v-5b8abf19="">
										<svg xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons plus-gray" data-v-5b8abf19="">
											<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-plus-gray" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-plus-gray" data-v-5b8abf19=""></use></svg>
									</div>
								</div>
							</div>
						</div>
						<div class="search_content" data-v-09679932="">
							<div class="search_option" data-v-09679932="">
							
<!--		빠른배송 버튼 일단 삭제				
 								<div class="filter_express" data-v-68c81ce0="" data-v-09679932="">
									<a href="/search" class="express_btn" data-v-68c81ce0=""><svg xmlns="http://www.w3.org/2000/svg" class="ico-express icon sprite-icons" data-v-68c81ce0="">
											<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-express" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-express" data-v-68c81ce0=""></use></svg><span class="text" data-v-68c81ce0="">빠른배송</span></a>
								</div>
-->								
								
 								<div style="display:;" data-v-09679932="">
									<div class="filter_sorting" data-v-1df7d084="" data-v-09679932="">
										<button type="button" class="sorting_title" data-v-1df7d084="">인기순</button>
										<ul class="sorting_list" style="display: none;" data-v-1df7d084="">
											<li class="sorting_item item_on" data-v-1df7d084=""><a href="#" class="sorting_link" data-v-1df7d084=""><div class="sorting_desc" data-v-1df7d084="">
														<p class="main_desc" data-v-1df7d084="">인기순</p>
														<p class="sub_desc" data-v-1df7d084="">많이 판매된 순서대로 정렬합니다.</p>
													</div>
													<svg xmlns="http://www.w3.org/2000/svg" class="ico-check-s icon sprite-icons" data-v-1df7d084="">
														<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" data-v-1df7d084=""></use></svg></a></li>
											<li class="sorting_item" data-v-1df7d084=""><a href="#" class="sorting_link" data-v-1df7d084=""><div class="sorting_desc" data-v-1df7d084="">
														<p class="main_desc" data-v-1df7d084="">프리미엄순</p>
														<p class="sub_desc" data-v-1df7d084="">발매가 대비 가격이 높은 순서대로 정렬합니다.</p>
													</div>
													<svg xmlns="http://www.w3.org/2000/svg" class="ico-check-s icon sprite-icons" data-v-1df7d084="">
														<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" data-v-1df7d084=""></use></svg></a></li>
											<li class="sorting_item" data-v-1df7d084=""><a href="#" class="sorting_link" data-v-1df7d084=""><div class="sorting_desc" data-v-1df7d084="">
														<p class="main_desc" data-v-1df7d084="">즉시 구매가순</p>
														<p class="sub_desc" data-v-1df7d084="">즉시 구매가가 낮은 순서대로 정렬합니다.</p>
													</div>
													<svg xmlns="http://www.w3.org/2000/svg" class="ico-check-s icon sprite-icons" data-v-1df7d084="">
														<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" data-v-1df7d084=""></use></svg></a></li>
											<li class="sorting_item" data-v-1df7d084=""><a href="#" class="sorting_link" data-v-1df7d084=""><div class="sorting_desc" data-v-1df7d084="">
														<p class="main_desc" data-v-1df7d084="">즉시 판매가순</p>
														<p class="sub_desc" data-v-1df7d084="">즉시 판매가가 높은 순서대로 정렬합니다.</p>
													</div>
													<svg xmlns="http://www.w3.org/2000/svg" class="ico-check-s icon sprite-icons" data-v-1df7d084="">
														<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" data-v-1df7d084=""></use></svg></a></li>
											<li class="sorting_item" data-v-1df7d084=""><a href="#" class="sorting_link" data-v-1df7d084=""><div class="sorting_desc" data-v-1df7d084="">
														<p class="main_desc" data-v-1df7d084="">발매일순</p>
														<p class="sub_desc" data-v-1df7d084="">최신 상품 순서대로 정렬합니다. 아직 발매 전인 상품이 노출될 수 있습니다.</p>
													</div>
													<svg xmlns="http://www.w3.org/2000/svg" class="ico-check-s icon sprite-icons" data-v-1df7d084="">
														<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-s" data-v-1df7d084=""></use></svg></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div style="display:;" data-v-09679932="">
								<div data-v-9bcf6292="" data-v-09679932="">
									<div class="filter_tag" style="display: none;" data-v-9bcf6292=""></div>
								</div>
							</div>
							
							
							<div class="search_result lg" data-v-1e800624="" data-v-09679932="">
								<div class="search_result_list" data-v-1e800624="">
								
								
									


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
	
	$(window).load(function() { 
		$('#searchBox').keyup(function(){
			
			ajax_search_product();
			
		});	
		
		
	});
	
	
	function ajax_search_product(){
			var keyword = $("#searchBox").val();
		
		var str = ''; //str은 공백제거 
/* 		$.LoadingOverlay("show");
 */        $.ajax({
            type : "POST",
            url : "/main1/ajax_search_product",
            data : 'keyword='+keyword,
            success : function(res){
        		$.LoadingOverlay("hide");
            	var master = $.parseJSON(res);
            	if(master.listMainJust.length < 1) {
            		str += '<div><h3>검색 결과가 존재하지 않습니다.</h3></div>'
            	} else {
	            	for (var i = 0; i < master.listMainJust.length; i++) {
	            		var searchItem = master.listMainJust[i];
	            		var brand = searchItem.brand;              			
	            		var name = searchItem.name;
	            		var price = searchItem.price;               			
	            		var url = searchItem.url;
	            		var seq = searchItem.seq;
	            		var keyword = searchItem.keyword;
	            		
	            		str+='<div class="search_result_item" data-v-6a8ef390="" data-v-1e800624="">';
	            		str+='<a href="/main1/product_detail?mainJust.seq='+seq+'"  data-v-6a8ef390="">';
	            		str+='<div class="product" style="background-color: #ebf0f5;" data-v-75e33658="" data-v-6a8ef390="">';
	            		str+='		<picture class="picture product_img" data-v-548c90f9="" data-v-75e33658="">';
	            		str+='		<img src="'+url+'" class="image" data-v-548c90f9=""></picture>';
	            		str+='</div>';
	            		str+='	<div class="product_info" data-v-6a8ef390="">';
	            		str+='		<div class="title" data-v-6a8ef390="">';
	            		str+='			<p class="brand" data-v-6a8ef390="">'+brand+'</p>';
	            		str+='			<p class="name" data-v-6a8ef390="">'+name+'</p>';
	            		str+='			<p class="translated_name" data-v-6a8ef390="">'+name+'</p>';
	            		str+='		</div>';
	            		str+='		<div class="price" data-v-6a8ef390="">';
	            		str+='			<div class="amount" data-v-6a8ef390="">'+price+'</div>';
	            		str+='		</div>';
	            		str+='	</div>';
	            		str+='<div class="interest_figure" data-v-6a8ef390="">';
	            		str+='	<span class="wish_figure" data-v-6a8ef390="">';
	            		str+='		<a href="#" aria-label="관심상품" class="btn_wish" data-v-150a7ea0="" data-v-6a8ef390="">';
	            		str+='		</a>';
	            		str+='		<svg xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons ico-wish-off" data-v-150a7ea0="">';
	            		str+='</div>';
	            		str+='</div>';
	            		
					}
            	}
            	
            	$('.search_result_list').html(str);
            	
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.");
            	console.log(errorThrown);
            	console.log(textStatus);
            }
        });
	}	
	
	
	
	
	
	
</script>
</html>