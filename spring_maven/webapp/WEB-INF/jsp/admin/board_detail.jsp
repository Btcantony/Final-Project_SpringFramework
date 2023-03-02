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
            <div id="contentdetail">
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
                            	<input name="adminNotice.seq" type="hidden" value="<%=request.getParameter("seq")%>">	
                                <div class="form-group row">
                                	<label>Title</label>
                                    <div class="col-sm-6">
                                        <input class="form-control form-control-user" id="title" name="adminNotice.title"></input>
                                    </div>
                                    
                                </div>
                                
                                 <div class="form-group row">
                                	<label>Content</label>
                                    <div class="col-sm-6">
                                        <textarea class="form-control form-control-user" rows="3" name="adminNotice.content" id="content"></textarea>
                                    </div>
                                    
                                </div>
                                
                                <div class="form-group row">
                                	<label>id</label>
                                    <div class="col-sm-6" name="adminNotice.email" id="email">
                                        <p class="form-control form-control-user"></p>
                                    </div>
                                    
                                </div>
                                
                                <div class="form-group row">
                                	<label>regdate</label>
                                    <div class="col-sm-6" name="adminNotice.regdate" id="regdate">
                                        <p class="form-control form-control-user"></p>
                                    </div>
                                    
                                </div>
                                
                                <br>
                            	<div class="form-group row">
                            		<div class="col-sm-3">
		                                <button type = "button" onclick="javascript:ajax_adminnotice_update();" class="btn btn-primary btn-user btn-block">
		                                   	수정하기
		                                </button>
	                                </div>
	                                <div class="col-sm-3">
		                                <button type = "button" class="btn btn-warning btn-user btn-block" onclick="location.href='board_list';">
		                                   	목록보기
		                                </button>
	                                </div>
	                                 <div class="col-sm-3">
		                                <button type = "reset" class="btn btn-warning btn-user btn-block">
		                                   	공지하기
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
</body> </html>

<script>
	var seq = '<%=request.getParameter("seq")%>';
	
	window.onload = function() { 			

		ajax_board_detail(seq);			
	}
	
	function ajax_board_detail(seq){		
		var str = '';
        $.ajax({
            type : "POST",
            url : "/admin/ajax_board_detail",
            data : 'adminNotice.seq='+seq,
            success : function(res){
            
            	var master = $.parseJSON(res);
            	var o = master.adminNotice;
            	var str = '';
            	
            	var seq = o.seq;
            	var content = o.content; //: "���담�����담����";
            	var regdate = o.regdate; //: "2022-08-16 18:51:25"            		
            	var email = o.email; //: "help@it-partner.co.kr"            		            	
            	var title = o.title; //: "���담�����담��"
            	var updatedate = o.updatedate;
            	
            	
            	$('#title').val(title);
            	/* $('#regdate').text(regdate); */
            	$('#content').text(content);
            /* 	$('#email').text(email); */
         
            	
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	}
	
	 function ajax_adminnotice_update(){		
		var str = '';
        $.ajax({
            type : "POST",
            url : "/admin/ajax_adminnotice_update",
            data : $('#frm').serialize(),
            success : function(res){
            	
            	window.location = '/admin/board_list';
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	} 
</script> 


