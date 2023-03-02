<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<html lang="en">

<head>
    <jsp:include page="nav/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>
</head>

<body id="page-top" class="sidebar-toggled">    
    <div id="wrapper">    	
    	<jsp:include page="nav/left.jsp">
			<jsp:param name="test" value="" />
		</jsp:include>
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
				<jsp:include page="nav/top.jsp">
					<jsp:param name="test" value="" />
				</jsp:include>				
				<div class="row">                    
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">MAIN JUST REGIST!</h1>
                            </div>
                            <form class="user" id="frm">
                            	<input type="hidden" id="url" name="mainJust.url">
                            	<input type="hidden" id="seq" name="mainJust.seq">
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <input type="file" id="file" name="file" class="form-control form-control-user" placeholder="이미지 업로드">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" id="brand" name="mainJust.brand" class="form-control form-control-user" placeholder="브랜드">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" id="name" name="mainJust.name" class="form-control form-control-user" placeholder="영문 이름">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" id="price" name="mainJust.price" class="form-control form-control-user" placeholder="가격">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <input type="text" id="name_kor" name="mainJust.name_kor" class="form-control form-control-user" placeholder="한글 이름">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" id="price_recent" name="mainJust.price_recent" class="form-control form-control-user" placeholder="최근 가격">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" id="price_sale" name="mainJust.price_sale" class="form-control form-control-user" placeholder="판매 가격">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" id="model_number" name="mainJust.model_number" class="form-control form-control-user" placeholder="모델 번호">
                                    </div>
                                </div>  
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <select id="color" name="mainJust.color" class="form-control form-control-user">
                                        	<option>BLACK</option>
                                        	<option>RED</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" id="price_public" name="mainJust.price_public" class="form-control form-control-user" placeholder="출고 가격">
                                    </div>
                                    <div class="col-sm-4">
                                    	<select id="category" name="mainJust.category" class="form-control form-control-user">
                                        	<option>BUTT</option>
											<option>A</option>
											<option>B</option>
											<option>C</option>
											<option>H</option>
											<option>F</option>
											<option>D</option>
											<option>G</option>										
											<option>E</option>
                                        </select>                                        
                                    </div>                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input type="text" id="_url" name="_url" class="form-control form-control-user" placeholder="직접입력 주소">
                                    </div>                                    
                                </div>  
                                <a id="btn_regist" href="javascript:regist();" class="btn btn-primary btn-user btn-block">
                                    등록
                                </a>
                                <a id="btn_update" href="javascript:update();" class="btn btn-warning btn-user btn-block">
                                    수정
                                </a>
                                                                
                            </form>
                            <hr>                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © Your Website 2021</span>
                    </div>
                </div>
            </footer>
        </div>       
    </div>

    <jsp:include page="modal/modal.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>
    
    <jsp:include page="nav/js.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>
</body></html>
<script>
	var seq = <%=request.getParameter("seq")%>;
	window.onload = function(){		
		if(seq != null){ // 수정
		//등록일 때는, 수정 안보이게, 수정일 때는 등록 안보이게 
			$('#seq').val(seq);
			$('#btn_regist').hide();
			cmm.ajax('/admin/ajax_detail_main_just','mainJust.seq='+seq,callBackDetailFnc);
		}else{
			$('#seq').val(0);
			$('#btn_update').hide();
		}
	}	
	
	function callBackFnc(res){
		var master = $.parseJSON(res);  
		var str = '';
		if(master.code == '0000'){
			if(seq != null){ // 수정
				cmm.messageModal('success','0000','수정 되었습니다.');		
			}else{
				window.location = '/admin/main_just';
			}						
		}else{
			cmm.messageModal('error', master.code, master.msg);			
		}
	}
	
	//등록 , 수정, 삭제 담기 
	function callBackDetailFnc(res){
		var master = $.parseJSON(res);
		var str = '';
		if(master.code == '0000'){
			// 마스터에 담아온 내용을 뿌려준다
			var o = master.mainJust;
			/*var seq = o.seq;
			var brand = o.brand;			
			var category = o.category;
			var date = o.date;
			var color = o.color;
			var model_number = o.model_number;
			var name = o.name;
			var name_kor = o.name_kor;
			var price = o.price;
			var price_public = o.price_public;
			var price_recent = o.price_recent;
			var price_sale = o.price_sale;			
			var url = o.url;
			var user = o.user;
			var price_recent = o.price_recent;*/
			$('#brand').val(o.brand);
			$('#seq').val(o.seq);
			$('#_url').val(o.url);
			$('#brand').val(o.brand);
			$('#name').val(o.name);
			$('#price').val(o.price);
			$('#user').val(o.user);
			$('#name_kor').val(o.name_kor);
			$('#price_recent').val(o.price_recent);
			$('#price_sale').val(o.price_sale);
			$('#model_number').val(o.model_number);
			$('#color').val(o.color);
			$('#price_public').val(o.price_public);
			$('#date').val(o.date);
			$('#category').val(o.category);			
		}else{
			cmm.messageModal('error', master.code, master.msg);			
		}
	}
	
	function callBackUploadFnc(res){	
		var cmd = '';
		if(seq == null) cmd = '&mainJust.cmd=insert';
		else cmd = '&mainJust.cmd=update';
		
		if(res == null){
			//이미지 직접입력
			$('#url').val($('#_url').val());	  			
		    cmm.ajax('/admin/ajax_ins_upd_del_main_just',$('#frm').serialize()+cmd,callBackFnc);
		}else{// 이미지 있을경우
			var master = $.parseJSON(res);
			var str = '';
			if(master.code == '0000'){
				 $('#url').val(master.files.url);		
				 cmm.ajax('/admin/ajax_ins_upd_del_main_just',$('#frm').serialize()+cmd,callBackFnc);			
			}else{
				cmm.messageModal('error', master.code, master.msg);			
			}	
		}	
	}
	
	function regist(){
		cmm.fileUpload('file',callBackUploadFnc);
	}
	
	function update(){
		cmm.fileUpload('file',callBackUploadFnc);
	}
	
</script>