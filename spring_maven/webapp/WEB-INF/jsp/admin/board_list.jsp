<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
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
				<div class="container-fluid">
					<div class="card shadow mb-4">
                        <div class="card-header py-3">                            
                            <a href="/admin/board_regist" class="btn btn-primary btn-icon-split">                    
			                    <span class="text">등록</span>
			                </a>			                
			                <a href="javascript:void(0);" id="btn_delete" class="btn btn-warning btn-icon-split">                    
			                    <span class="text">삭제</span>
			                </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th id="date_desc">seq</th> 
                                            <th>#번호</th>
                                            <th>제목</th>
                                            <th>이메일</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                            <th>수정하기</th>
                                         </tr>
                                    </thead>
                                    
                                    <tbody>
	                          
                                 	</tbody>
                                 	
                                </table>
                            </div>
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
	var seq = '<%=request.getAttribute("seq")%>';
	window.onload = function() { 						
		select_adminnotice_list();
		
		$('#btn_delete').click(function(){
			var seqs = ''; // 1,4,6,8
			var idx = 0;
			$('tbody > tr input').each(function(){				
				if($(this).is(":checked")){ // 체크된 상태만 삭제
					var seq = $(this).attr('dataSeq');
					if(idx == 0) seqs+=seq;
					else seqs+=','+seq;
					idx++;
				}								
			});
			
			$.ajax({
	            type : "POST",
	            url : "/admin/ajax_adminnotice_delete",
	            data : 'adminNotice.seqs='+seqs,
	            success : function(res){
	            	window.location = '/admin/board_list';						            
	            },
	            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	                alert("통신 실패.")
	            }
	        });
			
			
		});
		
		
	}
	
	
	function select_adminnotice_list() {
		
        $.ajax({
            type : "POST",
            url : "/admin/select_adminnotice_list",
            data : '',
            success : function(res){
            	
          		//뿌려준다
            	var master = $.parseJSON(res);
            	var listAdminNotice = master.listAdminNotice;
            	
            	//담는다.
            	var str = '';
            	for (var i = 0; i < listAdminNotice.length; i++) {
            		var adminnoticeItem = listAdminNotice[i];
            		var seq = adminnoticeItem.seq;
            		var title = adminnoticeItem.title;
            		var email = adminnoticeItem.email;
            		var content = adminnoticeItem.content;
            		var regdate = adminnoticeItem.regdate;
            		var updatedate = adminnoticeItem.updatedate;
            		
            		
            		
            		str+='<tr>';
    				str+='    <th>';
    				str+='		<div class="custom-control custom-checkbox">';
    			 	str+='    		<input type="checkbox" dataSeq="'+seq+'">'; 				
    				str+='		</div>';
    				str+='	  </th>';
    				str+='    <th>'+seq+'</th>';
    			 	str+='    <th>'+title+'</th>'; 
    				str+='    <th>'+email+'</th>';
    				str+='    <th>'+regdate+'</th>';
    				str+='    <th>'+updatedate+'</th>';
    				str+='    <th>';
    				//게시글 수정 버튼
    		 		str+='    	  <a href="/admin/board_detail?seq='+seq+'" class="btn btn-warning btn-circle btn-lg">';
    				str+='    	  	<i class="fas fa-exclamation-triangle"></i>';
    				str+='		  </a>'; 
    				str+='	  </th>'; 
    				str+='</tr>';
				}
            	
            	$('tbody').html(str);
            	
            	
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	}
	
</script>








