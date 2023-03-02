<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="../nav1/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>	
</head>

<link href="/resources/_nuxt/css/89d8b41.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/aeacc94.css" rel="stylesheet" />
<link href="/resources/_nuxt/css/46f6373.css" rel="stylesheet" />

<!-- Log CSS -->
<link href="/resources/_nuxt/css/0f788f7.css" rel="stylesheet" />
<body>
	<div id="__nuxt">
		<div id="__layout">
			<div tabindex="0" class="wrap win_os lg" data-v-3007c576>
				
				<div class="header lg" data-v-5875f283 data-v-3007c576>
					<jsp:include page="../nav1/header.jsp">
						<jsp:param name="test" value="" />
					</jsp:include>				
				</div>
				<div data-v-76574781 class="container customer md">				
					
					<!--  -->
					
					<div data-v-76574781="" class="snb_area">
						<a data-v-76574781="" href="/notice" class="nuxt-link-exact-active nuxt-link-active" aria-current="page">
							<h2 data-v-76574781="" class="snb_main_title">고객센터</h2>
						</a>
						<nav data-v-7bcac446="" data-v-76574781="" class="snb">
							<div data-v-7bcac446="" class="snb_list">
								<ul data-v-4d11470e="" data-v-7bcac446="" class="snb_menu">
									<li data-v-4d11470e="" class="menu_item menu_on">
										<a data-v-4d11470e="" href="/main1/notice" class="menu_link nuxt-link-exact-active nuxt-link-active" aria-current="page"> 공지사항 </a>
									</li>
									<li data-v-4d11470e="" class="menu_item">
										<a data-v-4d11470e="" href="/faq" class="menu_link"> 자주 묻는 질문 </a>
									</li>
									<li data-v-4d11470e="" class="menu_item">
										<a data-v-4d11470e="" href="/auth_policy" class="menu_link"> 검수 기준 </a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
					
					<!--  -->
					
					<div data-v-76574781="" class="content_area">
						<div data-v-59141e18="" data-v-76574781="" oncontextmenu="return false" ondragstart="return false" onselectstart="return false" class="customer_content my_notice md">
							<div data-v-88eb18f6="" data-v-59141e18="" class="content_title border">
								<div data-v-88eb18f6="" class="title">
									<h3 data-v-88eb18f6="">공지사항</h3>
								</div>
							</div>
							<div data-v-59141e18="" class="dropdown">
								<div data-v-59141e18="" class="dropdown_head">
									<div data-v-59141e18="" class="title_box">
										<span data-v-59141e18="" class="date"> 2022.08.09 </span>
										<p data-v-59141e18="" class="title" id="title"></p>
									</div>
								</div>
								<div data-v-59141e18="" class="dropdown_content">
									<img src="" id="img_url" style="width: 100%;">									
<!-- 									<div data-v-59141e18="" class="content"> </div>
 -->								<pre class="content"> </pre>	
								</div>
							</div>
							<div data-v-59141e18="" class="btn_list">
								<a data-v-3d1bcc82="" data-v-59141e18="" href="javascript:window.history.back();" class="btn outlinegrey medium"> 목록보기 </a>
								<a data-v-3d1bcc82="" data-v-59141e18="" href="/main1/update_notice?notice.seq=<%=request.getAttribute("seq") %>" class="btn outlinegrey medium"> 수정하기 </a> 
								<a data-v-3d1bcc82="" data-v-59141e18="" href="javascript:void(0);" onclick="deleteConfirm();" class="btn outlinegrey medium"> 삭제하기 </a>
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
	var seq = '<%=request.getAttribute("seq")%>';
	$(window).load(function() { 			
		ajax_notice_detail(seq);			
	});
	
	function ajax_notice_detail(seq){		
		var str = '';
        $.ajax({
            type : "POST",
            url : "/main1/ajax_notice_detail",
            data : 'notice.seq='+seq,
            success : function(res){
            	var master = $.parseJSON(res);
            	var o = master.notice;
            	
            	var content = o.content; //: "���담�����담����";
            	var date = o.date; //: "2022-08-16 18:51:25"            		
            	var email = o.email; //: "help@it-partner.co.kr"            		            	
            	var title = o.title; //: "���담�����담��"
            	var img_url = o.img_url; //: "���담�����담��"
            	
            	$('.title').text(title);
            	$('.date').text(date);
            	$('.content').text(content);
            	$('#img_url').attr('src',img_url);
            	
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	}
	
	
	function deleteConfirm(){
		
		if(!confirm("삭제 하시겠습니까?")){			
			return false;
		}else{
			// 삭제
			$.LoadingOverlay("show");
			$.ajax({
	            type : "POST",
	            url : "/main1/ajax_notice_delete",
	            data : 'notice.seq='+seq,
	            success : function(res){
	        		$.LoadingOverlay("hide");
	            	window.location = '/main1/notice';						            
	            },
	            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	                alert("통신 실패.")
	            }
	        });
		}
	}	
	
	
	
	
	
</script>
</html>