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
                            
                            <!-- 방법 1 form serailize() -->
                            <form class="user" name="frm" id="frm" accept-charset="utf-8">
                            
                            <!-- 방법 2 -->
                            <!-- <form id="frm" name="frm" method="post" action="/admin/submit_board_regist" enctype="multipart/form-data" accept-charset="utf-8"> -->	
                            	
                                <div class="form-group row">
                                	<label>Title</label>
                                    <div class="col-sm-6">
                                        <input class="form-control form-control-user" name="adminNotice.title" id="title" placeholder="제목">
                                    </div>
                                    
                                </div>
                                
                                 <div class="form-group row">
                                	<label>Content</label>
                                    <div class="col-sm-6">
                                        <textarea class="form-control form-control-user" rows="3" name="adminNotice.content" id="content" placeholder="내용"></textarea>
                                    </div>
                                    
                                </div>
                                
                                <div class="form-group row">
                                	<label>id</label>
                                    <div class="col-sm-6">
                                        <input class="form-control form-control-user" name="adminNotice.email" id="email" placeholder="작성자">
                                    </div>
                                    
                                </div>
                                
                                <br>
                            	<div class="form-group row">
                            		<div class="col-sm-3">
		                                <button type = "button" onclick="javascript:submit_board_regist();" class="btn btn-primary btn-user btn-block">
		                                    Submit
		                                </button>
	                                </div>
	                                <div class="col-sm-3">
		                                <button type = "reset" class="btn btn-warning btn-user btn-block">
		                                   	Reset
		                                </button>
	                                </div>
                                </div>  
                                                             
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
</body>

<script>	 
	window.onload = function() { 						
				
	}
	
	function submit_board_regist(){				
        
		$.ajax({
            type : "POST",
            url : "/admin/submit_board_regist",
            data : $('#frm').serialize(),
            //jsp에서 form 값들을 name으로 매칭되니 확인 필요
            success : function(res){
            	//얘는 뿌려줄때 하는거
            	/* var master = $.parseJSON(res);  
        		var str = ''; */
            	window.location = '/admin/board_list';
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	}
	
</script>

</html>
