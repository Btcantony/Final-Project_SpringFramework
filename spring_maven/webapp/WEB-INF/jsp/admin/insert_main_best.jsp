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
                                <a href="javascript:regist();" class="btn btn-primary btn-user btn-block">
                                    등록
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
	window.onload = function(){
		// 리스트 가지고 와서 렌더링
		//cmm.ajax('/admin/ajax_main_just','',callBackFnc);				
	}	
	
	function callBackFnc(res){
		var master = $.parseJSON(res);
		var str = '';
		if(master.code == '0000'){
			//cmm.messageModal('success', master.code, master.msg);
			window.location = '/admin/main_just';			
		}else{
			cmm.messageModal('error', master.code, master.msg);			
		}
	}
	
	function callBackUploadFnc(res){
		// 이미지 없을 경우
		if(res == null){
			$('#url').($('#_url').val());	  			
			cmm.ajax('/admin/ajax_insert_main_just',$('#frm').serialize(),callBackFnc);
		}else{// 이미지 있을경우
			var master = $.parseJSON(res);
			var str = '';
			if(master.code == '0000'){
				 $('#url').val(master.files.url);		
				 cmm.ajax('/admin/ajax_insert_main_just',$('#frm').serialize(),callBackFnc);			
			}else{
				cmm.messageModal('error', master.code, master.msg);			
			}	
		}
		
	}
	
	function regist(){
		cmm.fileUpload('file',callBackUploadFnc);
	}
	
</script>