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

<style>

#searchBox{
    display: inline-block;
    margin-top: 30px;
    margin-left: 360px;
  }
#notice_searchkeyword{
    height: 30px;
    width: 250px;
    border:1px solid ;
  }
#notice_search{
    width: 100px;
    height: 60px;
    border:1px solid ;
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
				
				<div data-v-76574781="" class="container customer md">
					<div data-v-76574781="">
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
					</div>
					<div data-v-76574781="" class="content_area">
						<div data-v-0067a928="" data-v-76574781="" class="customer_content my_notice">
							<div data-v-88eb18f6="" data-v-0067a928="" class="content_title border">
								<div data-v-88eb18f6="" class="title">
									<h3 data-v-88eb18f6="">공지사항</h3>									
								</div>
							</div>							
							<ul data-v-0067a928="" class="dropdown_list">
								
							</ul>
							
							<!-- 검색  form 이 아니니 submit이 불가 -->
							<div class="card-header py-3" id="searchBox">
								<input type="text" id="notice_searchkeyword" name="searchKeyword" value="${notice.keyword}"  placeholder="  검색어를 입력하세요." /> 
								<a href="/main1/ajax_notice" id="notice_search" class="btn btn-primary">검색</a>
							</div>

							<!--  -->
							
							
							<div data-v-1f9de2f0="" data-v-0067a928="" class="pagination">
								<div data-v-1f9de2f0="" class="pagination_box first">									
									<div data-v-1f9de2f0="" class="page_bind">
										<!-- <a data-v-1f9de2f0="" href="/notice?page=1" class="btn_page active" aria-label="1페이지"> 1 </a>
										<a data-v-1f9de2f0="" href="/notice?page=2" class="btn_page" aria-label="2페이지"> 2 </a>
										<a data-v-1f9de2f0="" href="/notice?page=3" class="btn_page" aria-label="3페이지"> 3 </a>
										<a data-v-1f9de2f0="" href="/notice?page=4" class="btn_page" aria-label="4페이지"> 4 </a>
										<a data-v-1f9de2f0="" href="/notice?page=5" class="btn_page" aria-label="5페이지"> 5 </a> -->
									</div>
								</div>
							</div>
							<div data-v-59141e18="" class="btn_list" id="div_regist_notice" style="display: none;">
								<a data-v-3d1bcc82="" data-v-59141e18="" href="/main1/regist_notice" class="btn outlinegrey medium"> 등록하기 </a>
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
		ajax_notice_total(1);		
		
     	//검색
		$("#notice_search").click(function(e){
			e.preventDefault();
			
			var keyword = $("#notice_searchkeyword").val();
			
			if(!keyword) {
				alert("키워드를 입력하세요.")
				return false;
			} 
			
			ajax_notice(1);
		});  
		
		
	});
	
	function ajax_notice(next_page){
		// 1. 초기화로 모두 none actice 
		// 2. next_page 만 active class 추가
		$('.page_bind > a').removeClass('active');
		$('.page_bind > a').eq(next_page-1).addClass('active');
		
		//한페이지에 보여줄 게시글 수 
		var st_num = (next_page - 1) * 10;
		var str = ''; //str은 공백제거 
		$.LoadingOverlay("show");
        $.ajax({
            type : "POST",
            url : "/main1/ajax_notice",
            data : 'notice.st_num='+st_num+'&notice.ed_num=10&notice.keyword='+$("#notice_searchkeyword").val(),
            success : function(res){
        		$.LoadingOverlay("hide");
            	var master = $.parseJSON(res);
            	for (var i = 0; i < master.listNotice.length; i++) {
            		var noticeItem = master.listNotice[i];
            		var content = noticeItem.content;
            		var date = noticeItem.date;
            		var title = noticeItem.title;
            		var seq = noticeItem.seq;
            		
            		//검색 
            		var keyword = noticeItem.keyword;
            		
            		
            		str+='<li data-v-0067a928="" linkseq="'+seq+'">';
            		str+='	<div data-v-0067a928="" class="dropdown">';
            		str+='		<div data-v-0067a928="" class="dropdown_head">';
            		str+='			<div data-v-0067a928="" class="title_box">';
            		str+='				<p data-v-0067a928="" class="title">'+title+'</p>';
            		str+='			</div>';
            		str+='		</div>';
            		str+='	</div>';
            		str+='</li>';
				}
            	
            	//게시글 목록에 저장 
            	$('.dropdown_list').html(str);
            	
            	//게시글 클릭시 글 보여줌 
            	$('.dropdown_list > li').click(function(){
            		var seq = $(this).attr('linkseq');
            		window.location = '/main1/notice_detail?notice.seq='+seq;
            	});
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	}
	
	function ajax_notice_total(now_page){		
		var str = '';
        $.ajax({
            type : "POST",
            url : "/main1/ajax_notice_total",
            data : '',
            success : function(res){
            	var master = $.parseJSON(res);
            	var total_cnt = Number(master.total_cnt);
            	var page_cnt = Math.floor(total_cnt / 10) + 1;
            	var space_cnt = Math.floor(page_cnt / 5) + 1;
/*             	var current_space= Math.floor(5 / now_page) + 1;
 */            	            	
				for (var i = 0; i < space_cnt; i++) {
					if(i == 0) str+='<div data-v-1f9de2f0="" class="pagination_box first">';
 					else str+='<div data-v-1f9de2f0="" class="pagination_box first"  style="display:none; ">';
					
					if(i != 0) str+='	<img class="pree" src="/resources/_nuxt/img/pree.png" style="width: 20px;">';
					str+='	<div data-v-1f9de2f0="" class="page_bind">';
					
					var stSpage = i * 5;
					var edSpage = stSpage + 5;
					for (var j = stSpage; j < edSpage; j++) {
						if(j*5 < total_cnt)
							str+='<a data-v-1f9de2f0="" href="javascript:ajax_notice('+(j+1)+')" class="btn_page"> '+(j+1)+' </a>';
					}	
					
					str+='	</div>';
					if(i != space_cnt-1) str+='	<img class="neext" src="/resources/_nuxt/img/neext.png" style="width: 20px;">';
					str+='</div>';
				}
				
				$('.pagination').html(str);
				
				// 페이징 공간 표시
				$('.pree').click(function(){
					var idx = $(".pagination_box.first").index($(this).parent());
					$(".pagination_box.first").hide();
					$(".pagination_box.first").eq(idx-1).show();
				});
				
				$('.neext').click(function(){
					var idx = $(".pagination_box.first").index($(this).parent());
					$(".pagination_box.first").hide();
					$(".pagination_box.first").eq(idx+1).show();
				});
				
 				ajax_notice(1);
             },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	}
</script>
</html>