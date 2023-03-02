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



					<div data-v-61d3533a="" data-v-3d7f7af7="" class="content_area">
						<div data-v-61d3533a="" class="my_addressbook">
							<div data-v-88eb18f6="" data-v-61d3533a="" class="content_title">
								<div data-v-88eb18f6="" class="title">
									<h3 data-v-88eb18f6="">주소록</h3>
									<!---->
								</div>
								<div data-v-88eb18f6="" class="btn_box">
									<a id="new_addr" data-v-3d1bcc82="" data-v-88eb18f6=""  class="btn btn_add">
										<!---->
										<span data-v-88eb18f6="" class="btn_txt">+ 새 배송지 추가</span>
									</a>
								</div>
							</div>
							
							
							<div data-v-1c284ef0="" data-v-61d3533a="" class="my_list">
								
								
								
							</div>
							<div data-v-61d3533a=""></div>
							
							<!---->
							
							<div id="myaddress_add_hidd" data-v-1f7c6d3f="" data-v-795b6767="" data-v-61d3533a="" class="layer_delivery layer lg" style="display: none;">
								<div data-v-1f7c6d3f="" class="layer_container">
								
									<div data-v-1f7c6d3f="" class="layer_header">
										<h2 data-v-795b6767="" data-v-1f7c6d3f="" class="title">새 주소 추가</h2>
									</div>
									
									<div data-v-1f7c6d3f="" class="layer_content">
										<div data-v-795b6767="" data-v-1f7c6d3f="" class="delivery_bind">
											<div data-v-795b6767="" data-v-1f7c6d3f="" class="delivery_input">
												<form id="frm">
												<div data-v-6c561060="" data-v-795b6767="" class="input_box" data-v-1f7c6d3f="">
													<h4 data-v-795b6767="" data-v-6c561060="" class="input_title">우편번호</h4>
													<div data-v-6c561060="" class="input_item">
														<input type="text" id="addr_type" name="addr.addr_type" data-v-6c561060="" placeholder="우편번호 검색 후, 자동입력 됩니다" autocomplete="off" class="input_txt addr.addr_type" readonly="readonly">
													</div>
												</div>
												
												<!-- 버튼 -->
												<div>
													<a data-v-3d1bcc82="" data-v-795b6767="" href="javascript:void(0);" onclick="execution_daum_address();" class="btn btn_delete outlinegrey medium" data-v-1f7c6d3f=""> 주소찾기 </a>
												</div>
												<!-- 버튼 -->
												
												<div data-v-6c561060="" data-v-795b6767="" class="input_box" data-v-1f7c6d3f="">
													<h4 data-v-795b6767="" data-v-6c561060="" class="input_title">메인주소</h4>
													<div data-v-6c561060="" class="input_item">
														<input data-v-6c561060="" type="text" id="main_addr" name="addr.main_addr" placeholder="우편번호 검색 후, 자동입력 됩니다" autocomplete="off" class="input_txt addr.main_addr" readonly="readonly">
													</div>
												</div>
												<div data-v-6c561060="" data-v-795b6767="" class="input_box" data-v-1f7c6d3f="">
													<h4 data-v-795b6767="" data-v-6c561060="" class="input_title">상세 주소</h4>
													<div data-v-6c561060="" class="input_item">
														<input data-v-6c561060="" type="text" id="main_detail" name="addr.main_detail" placeholder="건물, 아파트, 동/호수 입력" autocomplete="off" class="input_txt addr.main_detail" readonly="readonly">
													</div>
												</div>
											</div>
											<div data-v-795b6767="" data-v-1f7c6d3f="" class="delivery_check">
												<div data-v-4c714e9f="" data-v-795b6767="" class="checkbox_item" data-v-1f7c6d3f="">
													<input data-v-4c714e9f="" id="check1" type="checkbox" name="" class="blind"><label data-v-4c714e9f="" for="check1" class="check_label"><svg data-v-4c714e9f="" xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons ico-check-inactive">
															<use data-v-4c714e9f="" href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-inactive" xlink:href="/_nuxt/1a4fefc9c245c25be8c820c7d584e4d7.svg#i-ico-check-inactive"></use></svg>
													<!----></label>
												</div>
											</div>
										</div>
										<div data-v-795b6767="" data-v-1f7c6d3f="" class="layer_btn">
											<a id="new_addr_x" data-v-3d1bcc82="" data-v-795b6767="" href="" class="btn btn_delete outlinegrey medium" data-v-1f7c6d3f=""> 취소 </a>
											<a type="submit"  data-v-3d1bcc82="" data-v-795b6767="" disabled="disabled" href="javascript:callBackUploadFnc();" class="btn btn_save solid medium" data-v-1f7c6d3f=""> 저장하기 </a>
											</form>
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
$(window).load(function() { 						
/*  	makeBoldClick();
 */	ajax_myaddress();
});

function ajax_myaddress(){
	// 나의 정보를 가지고 온다
	$.LoadingOverlay("show");
	$.ajax({
        type : "POST",
        url : "/login1/ajax_myaddress", 
        data : '',
        success : function(res){
    		$.LoadingOverlay("hide");
        	var master = $.parseJSON(res);
        	var listAddr = master.listAddr;
        	var str = '';
        	
    		for (var i = 0; i < listAddr.length; i++) {
   				var ad = listAddr[i];
   				var addr_type = ad.addr_type;
   				var main_addr = ad.main_addr;
   				var main_detail = ad.main_detail;
        		var email = ad.email;
        		var x = email.split("@");
        		var nick_name = x[0];
        		
        		
        		str+='<div data-v-1c284ef0="" class="basic">';
        		str+='	<div data-v-7d49a47c="" class="my_item is_active" default-mark="기본 배송지" data-v-1c284ef0="">';
        		str+='		<div data-v-7d49a47c="" class="info_bind">';
        		str+='			<div data-v-be4e2246="" class="address_info" data-v-7d49a47c="">';
        		str+='				<div data-v-be4e2246="" class="name_box">';
        		str+='					<span data-v-be4e2246="" class="name">'+nick_name+'</span>';
        		str+='				</div>';
        		str+='				<div data-v-be4e2246="" class="address_box">';
        		str+='					<span data-v-be4e2246="" class="zipcode">('+addr_type+')</span>';
        		str+='					<span data-v-be4e2246="" class="address">'+main_addr+' '+main_detail+' </span>';
        		str+='				</div>';
        		str+='			</div>';
        		str+='		</div>';
        		str+='		<div data-v-7d49a47c="" class="btn_bind">';
        		str+='			<a data-v-3d1bcc82="" data-v-7d49a47c="" href="#" class="btn outlinegrey small"> 수정 </a>';
        		str+='			<a data-v-3d1bcc82="" data-v-7d49a47c="" href="#" class="btn outlinegrey small"> 삭제 </a>';
        		str+='		</div>';
        		str+='	</div>';
        		str+='</div>';
    		}
        	$('.my_list').html(str);       		
     		        		
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("통신 실패.")
        }
    });		
		
}

/* 다음(카카오)지도 우편번호 조회 API */
function execution_daum_address(){
 
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
 
        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
             	// 주소변수 문자열과 참고항목 문자열 합치기
                addr += extraAddr;
            
            } else {
            	addr += ' ';
            }

            $("#addr_type").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $("#main_addr").val(addr);
            //$("[name=memberAddr2]").val(addr);            // 대체가능
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $("#main_detail").attr("readonly",false);
            $("#main_detail").focus();
        }
    }).open();    
 
}

function callBackUploadFnc(res){
		cmm.ajax('/login1/ajax_insert_myaddress',$('#frm').serialize(),callBackFnc);
}

function callBackFnc(res){
	var master = $.parseJSON(res);
	var str = '';
	if(master.code == '0000'){
		//cmm.messageModal('success', master.code, master.msg);
		window.location = '/login1/myaddress';			
	}else{
		cmm.messageModal('error', master.code, master.msg);	
	}
}




/* function makeBoldClick(){
makeBold();
}
function makeBold(){
$('#my2').addClass('menu_on');
$('#my3').removeClass('menu_on');
$('#my4').removeClass('menu_on');
$('#my1').removeClass('menu_on');
}
 */


$('#new_addr').click(function(){
	$('#myaddress_add_hidd').show();
});
$('#new_addr_x').click(function(){
	$('#myaddress_add_hidd').hide();
});
</script>
</html>