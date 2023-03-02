<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>

<link href="/resources/_nuxt/css/b676d9d.css" rel="stylesheet" />
<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>
				
				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<jsp:include page="../nav1/header.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>				
				</div>
				
				<div class="container buy md" data-v-6657f7cc data-v-7ffb34f7>
					<div class="content" data-v-6657f7cc>
					
					
					<div data-v-88eb18f6="" class="content_title border">
						<div data-v-88eb18f6="" class="title">
							<h3 data-v-88eb18f6="">배송 목록</h3>
						</div>
					</div>
					
					<div class="here" data-v-6657f7cc>
					</div>
					
					
					
					<div data-v-4ec1fe02="" class="login_btn_box"><a data-v-3d1bcc82="" data-v-4ec1fe02="" href="javascript:buying();" class="btn full solid"> 구매 확정 및 배송 시작 </a></div>							
						
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
		// 나의 정보를 가지고 온다
		$.ajax({
            type : "POST",
            url : "/login1/ajax_buy", 
            data : '',
            success : function(res){
            	var master = $.parseJSON(res);
            	var addr = master.addr;
            	
            	var addr_type = addr.addr_type; //: "home"
            	var email = addr.email; //: "help@it-partner.co.kr"
            	var main_addr = addr.main_addr; //: "서울시 강동구 성내동 388-7"
            	var main_detail = addr.main_detail; //: "201호 파란대문"
            	            	
            	var strLikeProducts = getCookie('likeProducts');
        		var likeProducts = $.parseJSON(strLikeProducts);
        		var str = '';
        		var total_pay_price = 0;
        		for (var i = 0; i < likeProducts.length; i++) {
        			var product = likeProducts[i];
        			var seq = product.seq;
        			var brand = product.brand;
        			var sub_title = product.sub_title;
        			var model_number = product.model_number;
        			var src = product.src;
        			var price_recent = product.price_recent;
        			total_pay_price+=Number(price_recent);
        			
        			str+='<div class="buy_immediate" data-v-0b1cdd04 data-v-6657f7cc>';
        			str+='	<div data-v-1643775e="" data-v-0b1cdd04="" class="product_info_area">';
        			str+='		<div data-v-1643775e="" class="product_info">';
        			str+='			<div data-v-75e33658="" data-v-1643775e="" class="product" style="background-color: rgb(235, 240, 245);">';																		
        			str+='				<img id="url" data-v-548c90f9="" alt="상품 이미지" src="'+src+'" class="image">';
        			str+='			</div>';
        			str+='			<div data-v-1643775e="" class="product_detail">';
        			str+='				<strong data-v-1643775e="" class="model_number" id="model_number">'+model_number+'</strong>';
        			str+='				<p data-v-1643775e="" class="model_title" id="brand">'+brand+'</p>';
        			str+='				<p data-v-1643775e="" class="model_ko" id="sub_title">'+sub_title+'</p>';	
        			str+='				<p data-v-1643775e="" class="model_title" id="seq">'+seq+'</p>';	
        			str+='				<p data-v-1643775e="" class="model_title" id="price_recent">'+price_recent+'</p>';			
        			str+='			</div>';
        			str+='		</div>';
        			str+='	</div>';
        			str+='</div>';
        		}
/*         			var total_pay_price = total_pay_price.toLocaleString('ko-KR') + " 원";
 */        			
        		str+='<section data-v-c1cede26="" data-v-0b1cdd04="">';
        		str+='	<div data-v-c1cede26="" class="section_unit">';
        		str+='		<div data-v-c1cede26="" class="section_title">';
        		str+='			<h3 data-v-c1cede26="" class="title_txt">배송 주소</h3>';
        		str+='			<div data-v-88eb18f6="" class="btn_box">';
        		str+='				<a id="select_addr" data-v-3d1bcc82="" data-v-88eb18f6="" class="btn btn_add">';					
        		str+='					<span data-v-88eb18f6="" class="btn_txt">배송지 선택</span>';
        		str+='				</a>';
        		str+='			</div>';
        		str+='		</div>';
        		str+='		<div data-v-c1cede26="" class="section_content" id="addr_total">';
        		str+='('+addr_type+')'+' '+main_addr+' '+main_detail ;
        		str+='	    </div>';
        		str+='	</div>';
        		str+='	<div data-v-c1cede26="" class="section_unit">';
        		str+='		<div data-v-c1cede26="" class="section_title">';
        		str+='			<h3 data-v-c1cede26="" class="title_txt">배송 방법</h3>';
        		str+='		</div>';
        		str+='		<div data-v-c1cede26="" class="section_content">';
        		str+='			<div data-v-c1cede26="" class="delivery_service_option selected disabled">';
        		str+='				<div data-v-12ba7144="" data-v-c1cede26="" class="delivery_way">';
        		str+='					<div data-v-12ba7144="" class="way_info">';
        		str+='						<div data-v-12ba7144="" class="way_status_thumb">';
        		str+='							<img data-v-12ba7144="" src="https://kream-phinf.pstatic.net/MjAyMTExMjlfMTQ4/MDAxNjM4MTc4MjI5NTk3.2phJLPtRvFqViNfhZu06HzNRiUBlT4cmZR4_Ukqsyesg.ikrfWOrL7WXCVO0Rqy5kMvOn3B2YpjLUj6RuJqosPX0g.PNG/a_8b54cbca40e945f4abf1ee24bdd031f7.png" alt="3,000원" class="way_img"></div><div data-v-12ba7144="" class="way_desc">';
        		str+='							<p data-v-12ba7144="" class="company">';
        		str+='								<span data-v-12ba7144="" class="badge_title">일반배송 </span>';
        		str+='								<span data-v-12ba7144="" class="title">3,000원</span>';
        		str+='							</p>';
        		str+='							<p data-v-12ba7144="" class="sub_text">검수 후 배송 ・ 5-7일 내 도착 예정</p>';
        		str+='						</div>';
        		str+='					</div>';
        		str+='				</div>';
        		str+='			</div>';
        		str+='		</div>';
        		str+='	</div>';
        		str+='</section>';
        		
        		str+='<section data-v-7c6ab650="" data-v-0b1cdd04="">';
        		str+='	<div data-v-7c6ab650="" class="section_title">';
        		str+='		<h3 data-v-7c6ab650="" class="title_txt">포인트</h3>';
        		str+='	</div>';
        		str+='	<div data-v-7c6ab650="" class="section_content">';
        		str+='		<div data-v-7c6ab650="" class="section_input">';
        		str+='			<input data-v-7c6ab650="" placeholder="0" disabled="disabled" class="input_credit">';
        		str+='			<br></br>';
        		str+='			<button onClick="setAllPoint('+master.total_point+');" data-v-7c6ab650="" class="btn_use_credit"> 모두 사용 </button>';
        		str+='		</div>';
        		str+='		<div data-v-7c6ab650="" class="info_point">';
        		str+='			<div data-v-7c6ab650="">';
        		str+='				<span data-v-7c6ab650="" class="text_current">보유 포인트</span>';
        		str+='				<button data-v-7c6ab650="" class="btn_question">';
        		str+='				</button>';
        		str+='				<div data-v-7c6ab650="" class="value_current">';
        		str+='					<span data-v-7c6ab650="" class="point">'+master.total_point+'</span>';
        		str+='					<span data-v-7c6ab650="" class="unit">P</span>';
        		str+='				</div>';
        		str+='			</div>';
        		str+='		</div>';
        		str+='	</div>';
        		str+='</section>';
        		
        		str+='<section data-v-0b1cdd04="">';
        		str+='	<div data-v-0b1cdd04="" class="section_title">';
        		str+='		<h3 data-v-0b1cdd04="" class="title_txt">최종 주문 정보</h3>';
        		str+='	</div>';
        		str+='	<div data-v-0b1cdd04="" class="section_content">';
        		str+='		<div data-v-887ad490="" data-v-0b1cdd04="" class="instant_group">';
        		str+='			<div data-v-679d7250="" data-v-887ad490="" class="price_total order_info">';
        		str+='				<dl data-v-679d7250="" class="price_box">';
        		str+='					<dt data-v-679d7250="" class="price_title"> 총 결제금액 </dt>';
        		str+='					<dd data-v-679d7250="" class="price empty_price">';
        		str+='						<span data-v-679d7250="" class="amount">'+total_pay_price+'</span>';
        		str+='						<span data-v-679d7250="" class="unit"></span>';
        		str+='					</dd>';
        		str+='				</dl>';
        		str+='			</div>';
        		str+='			<div data-v-887ad490="" class="price_bind">';
        		str+='				<dl data-v-3a2a7b6b="" data-v-887ad490="" class="price_addition is_dark">';
        		str+='					<dt data-v-3a2a7b6b="" class="price_title">';
        		str+='						<span data-v-3a2a7b6b="">즉시 구매가</span>';
        		str+='					</dt>';
        		str+='					<dd data-v-3a2a7b6b="" class="price_text">'+total_pay_price+'</dd>';
        		str+='				</dl>';
        		str+='				<dl data-v-3a2a7b6b="" data-v-887ad490="" class="price_addition">';
        		str+='					<dt data-v-3a2a7b6b="" class="price_title">';
        		str+='						<span data-v-3a2a7b6b="">포인트</span>';
        		str+='					</dt>';
        		str+='					<dd id="pay_point" data-v-3a2a7b6b="" class="price_text">-</dd>';
        		str+='				</dl>';
        		str+='				<dl data-v-3a2a7b6b="" data-v-887ad490="" class="price_addition">';
        		str+='					<dt data-v-3a2a7b6b="" class="price_title">';
        		str+='						<span data-v-3a2a7b6b="">검수비</span>';
        		str+='					</dt>';
        		str+='					<dd data-v-3a2a7b6b="" class="price_text">-</dd>';
        		str+='				</dl>';
        		str+='				<dl data-v-3a2a7b6b="" data-v-887ad490="" class="price_addition">';
        		str+='					<dt data-v-3a2a7b6b="" class="price_title">';
        		str+='						<span data-v-3a2a7b6b="">수수료</span>';
        		str+='						<button data-v-3a2a7b6b="" class="btn_title">';
        		str+='						</button>';
        		str+='					</dt>';
        		str+='					<dd data-v-3a2a7b6b="" class="price_text">-</dd>';
        		str+='				</dl>';
        		str+='				<dl data-v-3a2a7b6b="" data-v-887ad490="" class="price_addition">';
        		str+='					<dt data-v-3a2a7b6b="" class="price_title">';
        		str+='						<span data-v-3a2a7b6b="">배송비</span>';
        		str+='					</dt>';
        		str+='					<dd data-v-3a2a7b6b="" class="price_text">3000 원</dd>';
        		str+='				</dl>';
        		str+='			</div>';
        		str+='		</div>';
        		str+='	</div>';
        		str+='</section>';
        						        		
        		$('.here').html(str);     
        		
        		$('#select_addr').click(function(){
        			$('#myaddress_add_hidd').show()
        		});
        		
        		// 주소 목록
        		str = '';
        		var listAddr = master.listAddr;
        		for (var i = 0; i < listAddr.length; i++) {
        			var o = listAddr[i];
        			var email = o.email;
        			var addr_type = o.addr_type;
        			var main_addr = o.main_addr;
        			var main_detail = o.main_detail;
        			str+='<h4 data-v-795b6767="" data-v-6c561060="" class="input_title">'+'('+addr_type+')'+' '+main_addr+' ' +main_detail+'</h4>';
				}
        		$('.delivery_bind .input_box').html(str);
        		
				$('.delivery_bind h4').click(function(){		
					$('#myaddress_add_hidd').hide();
					$('#addr_total').text($(this).text());
        		});
        		
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });		
	});
	
	function setAllPoint(point){
		$('#pay_point').text(point);
		$('.input_credit').val(point);
		
		var realPayPrice = Number($('.amount').text()) - Number(point);
		$('.amount').text(realPayPrice);
		$('.btn_use_credit').addClass('disabled');
	}
	
	
 	function buying(){
		var str = '';
		var addr_total = $('#addr_total').text();
		var deliver_type = '일반배송';
		var point_pay = $('#pay_point').text();
		
		str+='order.addr_total='+addr_total;
		str+='&order.deliver_type='+deliver_type;
		str+='&order.point_pay='+point_pay;
		
		var idx = 0;
		$('.buy_immediate').each(function(){
			
			var brand = $(this).find('#brand').text();
			var sub_title = $(this).find('#sub_title').text();
			var seq = $(this).find('#seq').text();
			var price_recent = $(this).find('#price_recent').text();
			var url = $(this).find('#url').attr('src');
			
			str+='&order.listItem['+idx+'].brand='+brand;
			str+='&order.listItem['+idx+'].name='+sub_title;
			str+='&order.listItem['+idx+'].seq='+seq;
			str+='&order.listItem['+idx+'].price='+price_recent;
			str+='&order.listItem['+idx+'].url='+url;
			
			idx++;
		});
		
		$.LoadingOverlay("show");
		$.ajax({
	           type : "POST",
	           url : "/login1/ajax_buy_commit", 
	           data : str,
	           success : function(res){
	            	$.LoadingOverlay("hide"); 
	            	window.location = '/login1/myorderlist';						            
	           },
	           error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	               alert("통신 실패.")
	           }
	       });	
		
	}
			
</script>
<div id="myaddress_add_hidd" data-v-1f7c6d3f="" data-v-795b6767="" data-v-61d3533a="" class="layer_delivery layer lg" style="display: none;">
	<div data-v-1f7c6d3f="" class="layer_container">
	
		<div data-v-1f7c6d3f="" class="layer_header">
			<h2 data-v-795b6767="" data-v-1f7c6d3f="" class="title">주소 목록</h2>
		</div>
		
		<div data-v-1f7c6d3f="" class="layer_content">
			<div data-v-795b6767="" data-v-1f7c6d3f="" class="delivery_bind">
				<div data-v-795b6767="" data-v-1f7c6d3f="" class="delivery_input">					
					<div data-v-6c561060="" data-v-795b6767="" class="input_box" data-v-1f7c6d3f="">
												
					</div>				
				</div>				
			</div>			
		</div>
	</div>
</div>
</html>	
	
