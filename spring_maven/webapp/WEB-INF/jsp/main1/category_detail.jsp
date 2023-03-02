<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="main.java.com.web.dto.Master"%>
<%@ page import="main.java.com.web.dto.MainCategory"%>
<%@ page import="main.java.com.web.dto.MainJust"%>


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


<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>

				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<jsp:include page="../nav1/header.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>
				</div>

<!---------------------------------------------------------------------------------------------------------------------------->


				<div class="exhibition_items" data-v-6eeb5108="" data-v-607e750d="" data-v-3007c576="">
					<div class="image" data-v-6eeb5108="">
						<a class="exhibition_item_image" style="background-color: #ffffff;" data-v-1479961a="" data-v-6eeb5108=""><figure class="image_container aspect_fit" data-v-1479961a="">
								<div style="padding-top: 0.2%;" data-v-1479961a=""></div>
								<img src="https://kream-phinf.pstatic.net/MjAyMjA2MTZfMTk0/MDAxNjU1Mzc0MzYwODIy.EInGIKwhY_TkL_mjcoqGGj3QxeDmnZra4NGBe9Ssy-wg.OhAdgvuzsMyXdiCDvPb_0XamF6QMcRMxna8E350ZEWwg.JPEG/a_2ddda52e6d694942a8c8897e66e3a02d.jpeg" class="image fit" data-v-1479961a="">
							</figure>
						</a>
					</div>
					<div class="product_header" data-v-6eeb5108="">
						<div class="exhibition_item_product_header" data-v-5248bdc4="" data-v-6eeb5108="">
							<h2 class="title" data-v-5248bdc4=""><%= request.getAttribute("category") %> 카테고리 컬렉션</h2>
							<p class="description" data-v-5248bdc4="">추천하는 인기 상품</p>
						</div>
					</div>
					
					<div class="product_list" data-v-6eeb5108="">
						<div id="testhwang" class="exhibition_item_products"  data-v-4ffa3883="" data-v-6eeb5108=""  style="font-size: 0">
					
					
							<div class="search_result_item"  data-v-6a8ef390="" data-v-4ffa3883="">
								<a href="" class="item_inner" data-v-6a8ef390="">
									<div class="product" style="background-color: #f4f4f4;" data-v-75e33658="" data-v-6a8ef390="">
										<picture class="picture product_img" data-v-548c90f9="" data-v-75e33658="">
										<img src="" class="image" data-v-548c90f9="">
										</picture>
									</div>
									<div class="product_info" data-v-6a8ef390="">
										<div class="title" data-v-6a8ef390="">
											<p class="brand" data-v-6a8ef390=""></p>
											<p class="name" data-v-6a8ef390=""></p>
										</div>
										<div class="price" data-v-6a8ef390="">
											<div class="amount" data-v-6a8ef390=""></div>
											<div class="desc" data-v-6a8ef390="">
												<p data-v-6a8ef390="">즉시 구매가</p>
											</div>
										</div>
									</div>
								</a>
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
var category = '<%=request.getAttribute("category")%>';  

$(window).load(function() {	
	
	ajax_category_detail();			
	
});

function ajax_category_detail(){
	$.LoadingOverlay("show");
	$.ajax({
        type : "POST",
        url : "/main1/ajax_category_detail", 
        data : 'mainCategory.category='+category,
        success : function(res){
    		$.LoadingOverlay("hide");
        	var master = $.parseJSON(res);
        	var listMainJust = master.listMainJust;
        	var str = '';
        	
        	for (var i = 0; i < listMainJust.length; i++) {
        		var xyz = listMainJust[i];
            	var seq = xyz.seq; 
            	var brand = xyz.brand; 
           		var name = xyz.name; 
           		var name_kor = xyz.name_kor; 
           		var price = xyz.price; 
           		var url = xyz.url; 
        		
           		str+='<div class="search_result_item"  data-v-6a8ef390="" data-v-4ffa3883="">';
        		str+='<a href="/main1/product_detail?mainJust.seq='+seq+'" class="item_inner" data-v-6a8ef390="">';
        		str+='<div class="product" style="background-color: #f4f4f4;" data-v-75e33658="" data-v-6a8ef390="">';
        		str+='	<picture class="picture product_img" data-v-548c90f9="" data-v-75e33658="">';
        		str+='	<img src="'+url+'" class="image" data-v-548c90f9="">';
        		str+='	</picture>';
        		str+='</div>';
        		str+='<div class="product_info" data-v-6a8ef390="">';
        		str+='	<div class="title" data-v-6a8ef390="">';
        		str+='		<p class="brand" data-v-6a8ef390="">'+brand+'</p>';
        		str+='		<p class="name" data-v-6a8ef390="">'+name+'</p>';
        		str+='	</div>';
        		str+='	<div class="price" data-v-6a8ef390="">';
        		str+='		<div class="amount" data-v-6a8ef390="">'+price+'</div>';
        		str+='		<div class="desc" data-v-6a8ef390="">';
        		str+='			<p data-v-6a8ef390="">즉시 구매가</p>';
        		str+='		</div>';
        		str+='	</div>';
        		str+='</div>';
        		str+='</a>';		
        		str+='</div>';
        	}
        	$('#testhwang').html(str);       		
        },
        
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        }
    });		
}


</script>
</html>