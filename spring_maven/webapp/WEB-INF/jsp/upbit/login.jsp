<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<html lang="en">

<head>
    <jsp:include page="nav/head.jsp">
		<jsp:param name="test" value="" />
	</jsp:include>
</head>

<body class="bg-gradient-primary">    
   	<div class="container">
   		<div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">                        
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" id="frm">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" id="access_key" name="upbitUser.access_key" placeholder="accessKey" value="ukZlJXXRdDK3uWBknpjLQIfsbeyEQPl7iyeHBaKn">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" id="secret_key" name="upbitUser.secret_key" placeholder="secretKey" value="jw0ALijK326vxRiy8xrh2o87NivQj0PE0hXm8zB6">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">
                                                Remember Me</label>
                                            </div>
                                        </div>
                                        <a href="javascript:ajax_login();" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a>                                        
                                    </form>
                                    <hr>
                                    
                                    <div class="text-center">
                                        <a class="small" href="javascript:account();">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
		
	}
	
	function ajax_login(){
		// 업비트에 등록되 Key 정보로 로그인 한다.
		cmm.ajax('/upbit/ajax_login',$('#frm').serialize(),callBackFnc);
	}
	
	function callBackFnc(res){
		var master = $.parseJSON(res);
		if(master.code == '0000'){
			// 로그인 처리
			window.location = '/upbit/';
		}else{
			cmm.messageModal('error', master.code, master.msg);			
		}
	}
</script>