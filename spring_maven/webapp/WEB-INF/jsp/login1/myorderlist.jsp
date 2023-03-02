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


					<div data-fetch-key="OrderIndex:0" class="content_area" data-v-3d7f7af7="">
						<div class="my_purchase">
							<div class="content_title" data-v-88eb18f6="">
								<div class="title" data-v-88eb18f6="">
									<h3 data-v-88eb18f6="">구매 내역</h3>
									<!---->
								</div>
								<!---->
							</div>
							<div class="purchase_list_tab detail_tab" data-v-bbed98be="">
							
							
<!--class: tab_item으로 구현예정	<div class="tab_item total" data-v-bbed98be="">
									<a href="#" class="tab_link" data-v-bbed98be="">
										<dl class="tab_box" data-v-bbed98be="">
											<dt class="title" data-v-bbed98be="">전체</dt>
											<dd class="count" data-v-bbed98be="">1</dd>
										</dl>
									</a>
								</div>
 -->								
 								<div class="tab_item tab_on" data-v-bbed98be="" id="tab1" statusCode='N'>
									<a href="#" class="tab_link" data-v-bbed98be="">
										<dl class="tab_box" data-v-bbed98be="">
											<dt class="title" data-v-bbed98be="">입금 확인 중</dt>
											<dd class="count" data-v-bbed98be=""></dd>
										</dl>
									</a>
								</div>
								
								<div class="tab_item" data-v-bbed98be="" id="tab2" statusCode='Y'>
									<a href="#" class="tab_link" data-v-bbed98be="">
										<dl class="tab_box" data-v-bbed98be="">
											<dt class="title" data-v-bbed98be="">배송 중</dt>
											<dd class="count" data-v-bbed98be=""></dd>
											<!---->
										</dl>
									</a>
								</div>
								
								<div class="tab_item" data-v-bbed98be="" id="tab3" statusCode='F'>
									<a href="#" class="tab_link" data-v-bbed98be="">
										<dl class="tab_box" data-v-bbed98be="">
											<dt class="title" data-v-bbed98be="">배송 완료</dt>
											<dd class="count" data-v-bbed98be=""></dd>
										</dl>
									</a>
								</div>
							</div>
							
							
							<div class="purchase_list bidding bid" data-v-21d527e4="">
								<div class="purchase_head" data-v-21d527e4="">
									
<!-- 								<div class="head_product" data-v-21d527e4="">
										<a href="#" class="btn_filter" data-v-21d527e4=""> 전체 <svg xmlns="http://www.w3.org/2000/svg" class="ico-arr-dir-down-circle icon sprite-icons" data-v-21d527e4="">
										<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-arr-dir-down-circle" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-arr-dir-down-circle" data-v-21d527e4=""></use></svg></a>
									</div>
 -->									
									<div class="head_status" data-v-21d527e4="">
									
										<div class="status_box field_price" data-v-21d527e4="">
											<a href="#" class="status_link" data-v-21d527e4="">
												<span class="status_txt" data-v-21d527e4="">배송 주소</span>
											</a>
										</div>
									
										<div class="status_box field_price" data-v-21d527e4="">
											<a href="#" class="status_link" data-v-21d527e4="">
												<span class="status_txt" data-v-21d527e4="">판매가격</span>
											</a>
										</div>
										
										
										<div class="status_box field_expires_at" data-v-21d527e4="">
											<a href="#" class="status_link" data-v-21d527e4="">
												<span class="status_txt" data-v-21d527e4="">결제한 날짜</span>
											</a>
										</div>
										
										
										
									</div>
								</div>
								
								
								
								<div id="myorderlist">
								
									<!-- <div class="purchase_item bid" data-v-62dace61="" data-v-21d527e4="" >
										
										<div class="history_product" data-v-62dace61="">
										
											<div class="product_box" data-v-62dace61="">
												<div class="product" style="background-color: #f4f4f4;" data-v-75e33658="" data-v-62dace61="">
													<picture class="picture product_img" data-v-548c90f9="" data-v-75e33658="">
													<source type="image/webp" srcset="https://kream-phinf.pstatic.net/MjAyMjA3MjBfOSAg/MDAxNjU4MzA3NzEwNjIx.7Dn0YZgmQdjlT7Si_60lIyTv9dnRCMNdgPQuirLEGQEg.6jCtWGVz6P28DcKx2aSj9pIt4jZGh4HTpySAUkW6zTcg.PNG/a_476e6a653b5545bd8e9e874d3357c163.png?type=m_webp" data-v-548c90f9="">
													<source srcset="https://kream-phinf.pstatic.net/MjAyMjA3MjBfOSAg/MDAxNjU4MzA3NzEwNjIx.7Dn0YZgmQdjlT7Si_60lIyTv9dnRCMNdgPQuirLEGQEg.6jCtWGVz6P28DcKx2aSj9pIt4jZGh4HTpySAUkW6zTcg.PNG/a_476e6a653b5545bd8e9e874d3357c163.png?type=m" data-v-548c90f9="">
													<img alt="Le Labo Santal 33 Eau De Parfum 50ml (Korean Ver.)" src="https://kream-phinf.pstatic.net/MjAyMjA3MjBfOSAg/MDAxNjU4MzA3NzEwNjIx.7Dn0YZgmQdjlT7Si_60lIyTv9dnRCMNdgPQuirLEGQEg.6jCtWGVz6P28DcKx2aSj9pIt4jZGh4HTpySAUkW6zTcg.PNG/a_476e6a653b5545bd8e9e874d3357c163.png?type=m" class="image" data-v-548c90f9=""></picture>
												</div>
											</div>
											
											<div class="product_detail" data-v-62dace61="">
												<p class="name" data-v-62dace61="">Le Labo</p>
												<p class="name" data-v-62dace61="">Santal 33 Eau De Parfum 50ml (Korean Ver.)</p>
												<p class="size" data-v-62dace61="">
													<span class="size_text" data-v-62dace61="">주문번호: 202209032003neooper@naver.com</span>
												</p>
											</div>
											
										</div>
										
										<div class="history_status" data-v-62dace61="">
											<div class="status_box field_price" data-v-62dace61="">
												<div class="price" data-v-62dace61="">
													<span class="amount" data-v-62dace61="">300,000</span>
													<span class="unit" data-v-62dace61="">원</span>
												</div>
											</div>
											<div class="status_box field_expires_at" data-v-62dace61="">
												<span class="date text-default" data-v-62dace61="">22/09/03</span>
											</div>
										</div>
										
									</div> -->
								
								</div>
								
								
								
								
								
								
							</div>
							
							
							
							
							<!-- 페이징처리 코드 당분간 무시 -->
							<div class="pagination" data-v-4857d0b8="">
								<div class="pagination_box first last" data-v-4857d0b8="">
									<div class="prev_btn_box" data-v-4857d0b8="">
										<a href="#" class="btn_arr" data-v-4857d0b8=""><svg xmlns="http://www.w3.org/2000/svg" class="arr-page-first icon sprite-icons" data-v-4857d0b8="">
												<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-first" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-first" data-v-4857d0b8=""></use></svg></a><a href="#" class="btn_arr" data-v-4857d0b8=""><svg xmlns="http://www.w3.org/2000/svg" class="arr-page-prev icon sprite-icons" data-v-4857d0b8="">
												<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-prev" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-prev" data-v-4857d0b8=""></use></svg></a>
									</div>
									<div class="page_bind" data-v-4857d0b8="">
										<a href="#" class="btn_page active" data-v-4857d0b8=""> 1 </a>
									</div>
									<div class="next_btn_box" data-v-4857d0b8="">
										<a href="#" class="btn_arr" data-v-4857d0b8=""><svg xmlns="http://www.w3.org/2000/svg" class="arr-page-next icon sprite-icons" data-v-4857d0b8="">
												<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-next" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-next" data-v-4857d0b8=""></use></svg></a><a href="#" class="btn_arr" data-v-4857d0b8=""><svg xmlns="http://www.w3.org/2000/svg" class="arr-page-last icon sprite-icons" data-v-4857d0b8="">
												<use href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-last" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-arr-page-last" data-v-4857d0b8=""></use></svg></a>
									</div>
								</div>
							</div>
							<!-- 페이징처리 코드 당분간 무시 -->
							
							
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
	ajax_myorderlist('N');
/* 	makeBoldClick();	
 */	
	// 탭클릭시 현재 탭만 하이라이트 
	$('.tab_item').click(function(){
		// CSS 처리
		$('.tab_item').removeClass('tab_on');
		$(this).addClass('tab_on');
		
		// Data 처리
		ajax_myorderlist($(this).attr('statusCode'));
	});
});

function ajax_myorderlist(statusCode){
	$.LoadingOverlay("show");
	$.ajax({
	    type : "POST",
	    url : "/login1/ajax_myorderlist", 
	    data : 'order.statusCode='+statusCode,
	    success : function(res){
	    	
			$.LoadingOverlay("hide");
        	var master = $.parseJSON(res);
        	var listOrder = master.listOrder;
        	
        	var str = '';
        	for (var i = 0; i < listOrder.length; i++) {
        		var order = listOrder[i];
       			var listItem = order.listItem;
				var date = order.orderDate;
				var date_date = date.substring(0,4)+"/"+date.substring(4,6)+"/"+date.substring(6,8);
				var addr_total = order.addr_total;
/* 				var type = addr_total.split(" ")[0];
 */				var deliver_type = order.deliver_type;
				
	        		for (var j = 0; j < listItem.length; j++) {
		        		var xyz = listItem[j];
		        		var orderNum = xyz.orderNum;
		        		var url = xyz.url;
		        		var brand = xyz.brand;
		        		var name = xyz.name;
		        		var price = xyz.price.toLocaleString('ko-KR');
		        		
        		
		        		
		        		str+='<div class="purchase_item bid" data-v-62dace61="" data-v-21d527e4="" >';
		        		str+='<div class="history_product" data-v-62dace61="">';
		        		str+='	<div class="product_box" data-v-62dace61="">';
		        		str+='		<div class="product" style="background-color: #f4f4f4;" data-v-75e33658="" data-v-62dace61="">';
		        		str+='			<picture class="picture product_img" data-v-548c90f9="" data-v-75e33658="">';
		        		str+='				<source type="image/webp" srcset="" data-v-548c90f9="">';
		        		str+='				<source srcset="" data-v-548c90f9="">';
		        		str+='				<img alt="" src="'+url+'" class="image" data-v-548c90f9="">';
		        		str+='			</picture>';
		        		str+='		</div>';
		        		str+='	</div>';
		        		str+='	<div class="product_detail" data-v-62dace61="">';
		        		str+='		<p class="name" data-v-62dace61="">'+brand+'</p>';
		        		str+='		<p class="name" data-v-62dace61="">'+name+'</p>';
		        		str+='		<p class="size" data-v-62dace61="">';
		        		str+='			<span class="size_text" data-v-62dace61="">주문번호: '+orderNum+'</span>';
		        		str+='		</p>';
		        		str+='	</div>';
		        		str+='</div>';
		        		
		        		str+='<div class="history_status" data-v-62dace61="">';
		        		
		        		//주소
		        		str+='	<div class="product_detail" data-v-62dace61="">';
		        		str+='		<div class="price" data-v-62dace61="">';
/* 		        		str+='			<span class="amount" data-v-62dace61="">'+type+'</span>';
 */		        		str+='			<span class="amount" data-v-62dace61="">'+addr_total+'</span>';
		        		str+='			<span class="unit" data-v-62dace61="">'+deliver_type+'</span>';
		        		str+='		</div>';
		        		str+='	</div>';
		        		//
		        		
		        		str+='	<div class="status_box field_price" data-v-62dace61="">';
		        		str+='		<div class="price" data-v-62dace61="">';
		        		str+='			<span class="amount" data-v-62dace61="">'+price+'</span>';
		        		str+='			<span class="unit" data-v-62dace61="">원</span>';
		        		str+='		</div>';
		        		str+='	</div>';
		        		
		        		
		        		str+='	<div class="status_box field_expires_at" data-v-62dace61="">';
		        		str+='		<span class="date text-default" data-v-62dace61="">'+date_date+'</span>';
		        		str+='	</div>';
		        		str+='</div>';
		        		str+='</div>';
        			}
        	}
        	
        	$('#myorderlist').html(str);          	
        	
        	// 배송 상태 개수 값 설정        	        
        	$('.tab_item').eq(0).find('.count').text(master.order.deliver_yn_n_cnt);        	
        	$('.tab_item').eq(1).find('.count').text(master.order.deliver_yn_y_cnt);
        	$('.tab_item').eq(2).find('.count').text(master.order.deliver_yn_f_cnt);        	
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
$('#my5').addClass('menu_on');
$('#my2').removeClass('menu_on');
$('#my1').removeClass('menu_on');
$('#my4').removeClass('menu_on');
$('#my3').removeClass('menu_on');
$('#my6').removeClass('menu_on');
}
 */


</script>
</html>